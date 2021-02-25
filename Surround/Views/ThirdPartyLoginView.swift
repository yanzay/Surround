//
//  SocialLoginView.swift
//  Surround
//
//  Created by Anh Khoa Hong on 8/12/20.
//

import Foundation
import UIKit
import SwiftUI
import WebKit
import Alamofire
import Combine

struct ThirdPartyLoginView: View {
    var type: ThirdPartyLoginWebView.ThirdParty
    @State var isLoading = true
    
    var body: some View {
        ZStack {
            ThirdPartyLoginWebView(type: type, isLoading: $isLoading)
            if isLoading {
                ProgressView()
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
}

struct ThirdPartyLoginWebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    var type: ThirdParty
    @EnvironmentObject var ogs: OGSService
    @Binding var isLoading: Bool
    
    enum ThirdParty {
        case facebook
        case google
        case twitter
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.websiteDataStore = WKWebsiteDataStore.nonPersistent()
        
        let webview = WKWebView(frame: CGRect.zero, configuration: configuration)
        webview.navigationDelegate = context.coordinator
        context.coordinator.isLoadingObservation = webview.observe(\.isLoading, options: [.new]) { _, change in
            if let newValue = change.newValue {
                if isLoading != newValue {
                    DispatchQueue.main.async {
                        isLoading = newValue
                    }
                }
            }
        }
        webview.load(URLRequest(url: OGSService.thirdPartyLoginURL(type: type)))
        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: ThirdPartyLoginWebView
        var isLoadingObservation: NSKeyValueObservation?
        var loginCancellable: AnyCancellable?
        
        init(_ parent: ThirdPartyLoginWebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            let ogs = parent.ogs
            if let url = webView.url {
                if ogs.isOGSDomain(url: url) {
                    let cookieStore = webView.configuration.websiteDataStore.httpCookieStore
                    cookieStore.getAllCookies { cookies in
                        for cookie in cookies {
                            if ogs.isOGSDomain(cookie: cookie) {
                                if cookie.name == "sessionid" {
                                    self.loginCancellable = ogs.thirdPartyLogin(cookieStore: cookieStore)
                                        .sink(receiveCompletion: { completion in
                                            if case .failure(let error) = completion {
                                                print(error)
                                            }
                                        }, receiveValue: { ogsUIConfig in
                                            ogs.loadOverview()
                                            print(ogsUIConfig)
                                        })
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
