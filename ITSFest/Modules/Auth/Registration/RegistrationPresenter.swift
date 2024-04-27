//
//  RegistrationPresenter.swift
//  ITSFest
//
//  Created by Александр Бобрун on 26.04.2024.
//  
//

import Foundation

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
        print(#function)
    }
    
    func registerBy(name: String, login: String, pass: String) {
        print(#function)
    }
    
    func goToLogin() {
        print(#function)
    }
}

extension RegistrationPresenter: RegistrationInteractorOutput {
}
