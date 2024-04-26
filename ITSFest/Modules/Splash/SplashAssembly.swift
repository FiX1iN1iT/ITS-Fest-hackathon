//
//  SplashAssembly.swift
//  ITSFest
//
//  Created by Mike Ulanov on 27.04.2024.
//

import Foundation
import UIKit

final class SplashAssembly {
    static func assembly(moduleOutput: SplashModuleOutput? = nil) -> UIViewController {
        let presenter = SplashPresenter()
        let viewController = SplashViewController(output: presenter)
        let router = SplashRouter()
        presenter.view = viewController
        presenter.moduleOutput = moduleOutput
        presenter.router = router
        router.view = viewController

        return viewController
    }
}
