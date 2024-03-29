//
//  AppDelegate.swift
//  ios-app-sample
//
//  Created by mothule on 2023/09/08.
//

import UIKit
import DIContainer

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        initializeDIContainer()
        
        return true
    }
    
    // TODO: アクセスフローを違反しないためにレイヤー別にイベントを呼び出す仕組み実装する
    private func initializeDIContainer() {
        Container.shared
            .register(AuthRepository.self) { _ in
                AuthRepositoryImpl()
            }
            .register(UserAuthenticationUsecase.self) { c in
                UserAuthenticationUsecase(authRepository: c.resolve())
            }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

