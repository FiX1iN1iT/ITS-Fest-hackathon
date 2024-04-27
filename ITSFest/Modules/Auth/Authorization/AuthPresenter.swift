//
//  AuthPresenter.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import Foundation

final class AuthPresenter {
    weak var view: AuthViewInput?
    weak var moduleOutput: AuthModuleOutput?
    
    private let router: AuthRouterInput
    private let interactor: AuthInteractorInput
    
    init(router: AuthRouterInput, interactor: AuthInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension AuthPresenter: AuthModuleInput {
}

extension AuthPresenter: AuthViewOutput {
    func logInBy(login: String, pass: String) {
        print(#function)
    }
    
    func logInByGoogle() {
        view?.showAlert(title: "Comming soon...")
    }
    
    func showPassword() {
        view?.togglePasswordDisplay()
    }
    
    func recoverPassword() {
        view?.showAlert(title: "Comming soon...")
    }
    
    func goToRegistration() {
        router.openRegistration()
    }
}

extension AuthPresenter: AuthInteractorOutput {
}
