//
//  HttpClientAppApp.swift
//  HttpClientApp
//
//  Created by Mayur Nilwant on 27/09/2022.
//

//import SwiftUI
//
//@available(iOS 14.0, *)
//@main
//struct FoodRatingAppUK: App {
//    var body: some Scene {
//        WindowGroup {
//            LandingPageView()
//        }
//    }
//}


import UIKit
import SwiftUI

@main
struct MainApp {
    static func main() {
        if #available(iOS 14.0, *) {
            FoodRatingAppUK.main()
        } else {
            UIApplicationMain(
                CommandLine.argc,
                CommandLine.unsafeArgv,
                nil,
                NSStringFromClass(AppDelegate.self))
        }
    }
}

@available(iOS 14.0, *)
struct FoodRatingAppUK: App {
    var body: some Scene {
        WindowGroup {
            LandingPageView()
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let contentView = LandingPageView()

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        //
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        //
    }

    func sceneWillResignActive(_ scene: UIScene) {
       //
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       //
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        //
    }
}
