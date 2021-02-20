//
//  MainView.swift
//  Surround
//
//  Created by Anh Khoa Hong on 4/29/20.
//

import SwiftUI
import WidgetKit

struct MainView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    @Environment(\.scenePhase) private var scenePhase
    @EnvironmentObject var ogs: OGSService
    @State var navigationCurrentView: RootView? = .home
    
    @State var backgroundTaskID: UIBackgroundTaskIdentifier = .invalid
    @State var widgetInfos = [WidgetInfo]()
    @State var firstLaunch = true

    @EnvironmentObject var nav: NavigationService
    
    func onAppActive(newLaunch: Bool) {
        WidgetCenter.shared.getCurrentConfigurations { result in
            if case .success(let widgetInfos) = result {
                self.widgetInfos = widgetInfos
            }
        }
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        ogs.ensureConnect(thenExecute: {
            if ogs.isLoggedIn {
                ogs.updateUIConfig()
                if newLaunch {
                    if let latestOverview = userDefaults[.latestOGSOverview] {
                        if let overviewData = try? JSONSerialization.jsonObject(with: latestOverview) as? [String: Any] {
                            ogs.processOverview(overview: overviewData)
                        }
                    }
                }
                ogs.loadOverview()
            }
            if nav.main.rootView == .publicGames {
                ogs.fetchPublicGames()
            }
        })

    }
    
    func navigateTo(appURL: URL) {
        if let rootViewName = appURL.host, let rootView = RootView(rawValue: rootViewName) {
            nav.main.rootView = rootView
            navigationCurrentView = rootView
            switch rootView {
            case .home:
                if appURL.pathComponents.count > 1 {
                    if let ogsGameId = Int(appURL.pathComponents[1]) {
                        nav.home.ogsIdToOpen = ogsGameId
                    }
                }
            case .publicGames:
                if appURL.pathComponents.count > 1 {
                    if let ogsGameId = Int(appURL.pathComponents[1]) {
                        nav.publicGames.ogsIdToOpen = ogsGameId
                    }
                }
            default:
                break
            }
        }
    }
    
    var body: some View {
        if firstLaunch {
            DispatchQueue.main.async {
                if self.firstLaunch {
                    self.firstLaunch = false
                    self.onAppActive(newLaunch: true)
                }
            }
        }
        var compactSizeClass = false
        #if os(iOS)
        compactSizeClass = horizontalSizeClass == .compact
        #endif
        let navigationCurrentView = Binding<RootView?>(
            get: { nav.main.rootView },
            set: { if let rootView = $0 { nav.main.rootView = rootView } }
        )
        return ZStack(alignment: .top) {
            NavigationView {
                if compactSizeClass {
                    nav.main.rootView.view
                } else {
                    List(selection: navigationCurrentView) {
                        RootView.home.navigationLink(currentView: navigationCurrentView)
                        RootView.publicGames.navigationLink(currentView: navigationCurrentView)
                        Divider()
                        RootView.settings.navigationLink(currentView: navigationCurrentView)
                        Divider()
                        RootView.browser.navigationLink(currentView: navigationCurrentView)
                    }
                    .listStyle(SidebarListStyle())
                    .navigationTitle("Surround")
                    nav.main.rootView.view
                }
            }
            if ogs.isLoggedIn {
                NotificationPopup()
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                self.onAppActive(newLaunch: false)
            } else if phase == .background {
                self.backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: {
                    UIApplication.shared.endBackgroundTask(self.backgroundTaskID)
                    self.backgroundTaskID = .invalid
                })
                userDefaults[.cachedOGSGames] = [Int: Data]()
                if self.widgetInfos.count > 0 {
                    WidgetCenter.shared.reloadAllTimelines()
                    UIApplication.shared.endBackgroundTask(self.backgroundTaskID)
                    self.backgroundTaskID = .invalid
                } else {
                    ogs.loadOverview(finishCallback: {
                        UIApplication.shared.endBackgroundTask(self.backgroundTaskID)
                        self.backgroundTaskID = .invalid
                    })
                }
            }
        }
        .onOpenURL { url in
            navigateTo(appURL: url)
        }
        .fullScreenCover(isPresented: Binding(
                            get: { nav.main.gameInModal != nil },
                            set: { if !$0 { nav.main.gameInModal = nil } })
        ) {
            NavigationView {
                GameDetailView(currentGame: nav.main.gameInModal)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button(action: { nav.main.gameInModal = nil }) {
                                Text("Close")
                            }
                        }
                    }
                    .environmentObject(ogs)
                    .environmentObject(nav)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .environmentObject(OGSService.previewInstance(
                    user: OGSUser(username: "kata-bot", id: 592684),
                    activeGames: [TestData.Ongoing19x19wBot1, TestData.Ongoing19x19wBot2]
                ))
            MainView()
                .environmentObject(OGSService.previewInstance())
        }
        .environmentObject(NavigationService.shared)
    }
}
