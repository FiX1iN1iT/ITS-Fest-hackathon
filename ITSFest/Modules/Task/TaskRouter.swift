//
//  TaskRouter.swift
//  ITSFest
//
//  Created by Mike Ulanov on 27.04.2024.
//

import Foundation

final class ProfileRouter {
    weak var viewController: TaskViewController?
}

extension ProfileRouter: TaskRouterInput {
    func openMain() {
        let container = SplashAssembly.assembly()
        viewController?.navigationController?.pushViewController(container, animated: true)
    }
}
