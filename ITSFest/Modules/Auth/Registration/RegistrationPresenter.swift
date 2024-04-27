//
//  RegistrationPresenter.swift
//  ITSFest
//
//  Created by Александр Бобрун on 26.04.2024.
//  
//

import Foundation
import FirebaseAuth

final class RegistrationPresenter {
    weak var view: RegistrationViewInput?
    weak var moduleOutput: RegistrationModuleOutput?
    
    private let router: RegistrationRouterInput
    private let interactor: RegistrationInteractorInput
    
    init(router: RegistrationRouterInput, interactor: RegistrationInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension RegistrationPresenter: RegistrationModuleInput {
}

extension RegistrationPresenter: RegistrationViewOutput {
    func checkboxTapp() {
        view?.toggleCheckbox()
    }
    
    func showPassword() {
        view?.togglePasswordDisplay()
    }
    
    func registerByGoogle() {
//        view?.showAlert(title: "Comming soon...")
    }
    
    func registerBy(name: String, login: String, pass: String) {
        interactor.register(model: AuthModel(email: login, password: pass))
    }
    
    func goToLogin() {
        router.openLogin()
    }
}

extension RegistrationPresenter: RegistrationInteractorOutput {
    func failureRegistration(with error: Error) {
        view?.showAlert(title: error.localizedDescription)
    }
    
    func successRegistration(with result: AuthDataResult?) {
        router.openHome()
    }
    
}
