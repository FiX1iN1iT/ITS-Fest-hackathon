//
//  SplashPresenter.swift
//  ITSFest
//
//  Created by Mike Ulanov on 26.04.2024.
//

import Foundation
import UIKit

final class SplashPresenter {
    weak var view : SplashViewInput?
    weak var moduleOutput: SplashModuleOutput?
    var router: SplashRouterInput?
}

extension SplashPresenter: SplashModuleOutput{}

extension SplashPresenter: SplashViewOutput{
    func didTapSplashButton() {
        print(#function)
        router?.presentAuthVC()
    }
    
    func didLoadView() {
        updateUI()
    }
}



private extension SplashPresenter {
    func updateUI() {
        guard let appLogo = UIImage(named: "appLogo") else { return }
        guard let splashImage = UIImage(named: "splashImage") else { return }
        let splashModel: SplashViewModel = .init(
            appName: "DayTask",
            appLogo: appLogo,
            splashImage: splashImage,
            descriptionString: "Manage your Task with ")
        view?.configure(with: splashModel)
    }
}
