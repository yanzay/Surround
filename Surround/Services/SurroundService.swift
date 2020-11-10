//
//  SurroundService.swift
//  Surround
//
//  Created by Anh Khoa Hong on 10/28/20.
//

import Foundation
import Alamofire
import Combine
import WidgetKit

enum SurroundServiceError: Error {
    case notLoggedIn
}

class SurroundService: ObservableObject {
    static var shared = SurroundService()
    static var instances = [String: SurroundService]()
    
    static func instance(forSceneWithID sceneID: String) -> SurroundService {
        if let result = instances[sceneID] {
            return result
        } else {
            let result = SurroundService()
            instances[sceneID] = result
            return result
        }
    }
    
//    static let sgsRoot = "http://192.168.44.101:8000"
    static let sgsRoot = "https://surround.honganhkhoa.com"
    
    private var sgsRoot = SurroundService.sgsRoot
    
    func isProductionEnvironment() -> Bool {
        if let provisionPath = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") {
            if let provisionData = try? Data(contentsOf: URL(fileURLWithPath: provisionPath)) {
                if let provisionString = String(data: provisionData, encoding: .ascii) {
                    let noBlankProvisionString = provisionString.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "").replacingOccurrences(of: "\t", with: "")
//                    print(noBlankProvisionString)
                    return !noBlankProvisionString.contains("<key>aps-environment</key><string>development</string>")
                }
            }
        }
        return true
    }
    
    func getPushSettingsString() -> String {
        let pushSettingsKey: [SettingKey<Bool>] = [
            .notificationOnUserTurn,
            .notificationOnTimeRunningOut,
            .notificationOnNewGame,
            .notiticationOnGameEnd,
            .notificationOnChallengeReceived
        ]
        var pushSettings = [String: Bool]()
        for settingKey in pushSettingsKey {
            pushSettings[settingKey.mainName] = userDefaults[settingKey]
        }
        if let pushSettingsData = try? JSONSerialization.data(withJSONObject: pushSettings) {
            return String(data: pushSettingsData, encoding: .utf8) ?? ""
        }
        return ""
    }
    
    func registerDeviceIfLoggedIn(pushToken: Data) {
        if let uiconfig = userDefaults[.ogsUIConfig],
           let ogsSessionId = userDefaults[.ogsSessionId],
           let ogsCsrfToken = uiconfig.csrfToken {
            let ogsUserId = uiconfig.user.id
            let ogsUsername = uiconfig.user.username
            var headers = HTTPHeaders()
            if let accessToken = userDefaults[.sgsAccessToken] {
                headers = [.authorization(accessToken)]
            }
            let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "-1"
            let pushSettings = getPushSettingsString()
            AF.request(
                "\(self.sgsRoot)/register",
                method: .post,
                parameters: [
                    "ogsUserId": ogsUserId,
                    "ogsUsername": ogsUsername,
                    "ogsCsrfToken": ogsCsrfToken,
                    "ogsSessionId": ogsSessionId,
                    "pushToken": pushToken.map { String(format: "%02hhx", $0) }.joined(),
                    "production": isProductionEnvironment(),
                    "version": version,
                    "pushSettings": pushSettings
                ],
                headers: headers
            ).validate().responseJSON { response in
                switch response.result {
                case .success:
                    if let accessToken = (response.value as? [String: Any])?["accessToken"] as? String {
                        userDefaults[.sgsAccessToken] = accessToken
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func unregisterDevice() {
        if let accessToken = userDefaults[.sgsAccessToken] {
            AF.request(
                "\(self.sgsRoot)/unregister",
                method: .post,
                headers: [.authorization(accessToken)]
            ).validate().responseJSON(completionHandler: { _ in
                
            })
        }
    }
    
    func setPushEnabled(enabled: Bool) {
        if let accessToken = userDefaults[.sgsAccessToken] {
            AF.request(
                "\(self.sgsRoot)/enable_push",
                method: .post,
                parameters: [
                    "enabled": enabled
                ],
                headers: [.authorization(accessToken)]
            ).validate().responseJSON(completionHandler: { _ in
                
            })
        }
    }
    
    func getOGSOverview(allowsCache: Bool = false) -> AnyPublisher<[String: Any], Error> {
        return Future<[String: Any], Error> { promise in
            if let accessToken = userDefaults[.sgsAccessToken] {
                AF.request(
                    "\(self.sgsRoot)/ogs_overview",
                    parameters: ["allows_cache": allowsCache],
                    headers: [.authorization(accessToken)]
                ).validate().responseData(completionHandler: { response in
                    if case .failure(let error) = response.result {
                        promise(.failure(error))
                        return
                    }
                    if let responseValue = response.value, let json = try? JSONSerialization.jsonObject(with: responseValue) as? [String: Any] {
                        userDefaults[.latestOGSOverview] = responseValue
                        userDefaults[.latestOGSOverviewTime] = Date()
                        WidgetCenter.shared.reloadAllTimelines()
                        
                        promise(.success(json))
                    } else {
                        promise(.failure(OGSServiceError.invalidJSON))
                    }
                })
            } else {
                promise(.failure(SurroundServiceError.notLoggedIn))
            }
        }.eraseToAnyPublisher()
    }
}
