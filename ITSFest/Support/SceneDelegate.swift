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
        
        window = UIWindow(windowScene: windowScene)
        
        let detailFlow = DetailProjectContainer.assemble(with: nil)
        let navigationController = UINavigationController()
        
        detailFlow.router.openModuleFromWindow(window: window, navigationController: navigationController)
    }
}
