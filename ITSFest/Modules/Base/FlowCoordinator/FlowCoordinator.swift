//
//  FlowCoordinator.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//

import Foundation
import UIKit

class FlowCoordinator {
    
    private var navController: UINavigationController?
    
    init(navController: UINavigationController? = nil) {
        self.navController = navController
    }
}

extension FlowCoordinator: FlowCoordinatorProtocol {
    func start() {
        
        let authModule = AuthContainer.assemble()
        navController?.pushViewController(authModule.viewController, animated: false)
    }
}
