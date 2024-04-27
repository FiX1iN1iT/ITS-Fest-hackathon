//
//  SplashRouter.swift
//  ITSFest
//
//  Created by Mike Ulanov on 27.04.2024.
//

import Foundation
import UIKit

final class SplashRouter: BaseSwiftRouter {
}

extension SplashRouter: SplashRouterInput {
    func presentAuthVC() {
        print(#function)
        openModuleFromViewController(sourceView: self.view, openView: AuthContainer.assemble().viewController, needHavController: false)
    }
}
