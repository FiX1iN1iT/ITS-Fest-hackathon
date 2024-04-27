//
//  SceneDelegate.swift
//  ITSFest
//
//  Created by Alexander on 25.04.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        let viewController = TabBarViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        let window = UIWindow(windowScene: windowScene)
        self.window = window

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
