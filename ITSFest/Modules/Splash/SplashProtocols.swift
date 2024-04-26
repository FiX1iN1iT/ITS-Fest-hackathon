//
//  SplashProtocols.swift
//  ITSFest
//
//  Created by Mike Ulanov on 27.04.2024.
//

import Foundation


protocol SplashModuleInput {
    var moduleOutput: SplashModuleOutput? { get }
}

protocol SplashModuleOutput: AnyObject {
}

protocol SplashViewInput: AnyObject {
    func configure(with model: SplashViewModel)
}

protocol SplashViewOutput: AnyObject {
    func didLoadView()
    func didTapSplashButton()
}

protocol SplashRouterInput: BaseSwiftRouterInput {
    func presentAuthVC()
}
