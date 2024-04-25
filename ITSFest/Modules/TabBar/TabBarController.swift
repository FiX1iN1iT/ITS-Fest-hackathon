//
//  TabBarController.swift
//  ITSFest
//
//  Created by Alexander on 25.04.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {

    // Создаем и конфигурируем кнопки для TabBar
    private func setupTabs() {
        let firstViewController = ViewController()
        let secondViewController = ViewController()
        let thirdViewController = ViewController()

        let first = self.createNavigation(
            with: Texts.tabBarAccount,
            and: UIImage(systemName: "person.fill"),
            vc: firstViewController
        )
        let second = self.createNavigation(
            with: Texts.tabBarMain,
            and: UIImage(systemName: "wallet.pass.fill"),
            vc: secondViewController
        )
        let third = self.createNavigation(
            with: Texts.tabBarFavourite,
            and: UIImage(systemName: "star.fill"),
            vc: thirdViewController
        )

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .white
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance

        self.setViewControllers([first, second, third], animated: true)
        self.selectedViewController = self.viewControllers?[1]
    }

    private func createNavigation(with title: String?, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: vc)
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = image
        navigation.isNavigationBarHidden = true
        
        return navigation
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
}

private extension TabBarViewController {
    struct Texts {
        static let tabBarMain = String(localized: "First")
        static let tabBarAccount = String(localized: "Second")
        static let tabBarFavourite = String(localized: "Third")
    }
}
