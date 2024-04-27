//
//  RegistrationProtocols.swift
//  ITSFest
//
//  Created by Александр Бобрун on 26.04.2024.
//  
//

import Foundation
import Firebase

protocol RegistrationModuleInput {
    var moduleOutput: RegistrationModuleOutput? { get }
}

protocol RegistrationModuleOutput: AnyObject {
}

protocol RegistrationViewInput: AnyObject {
    func toggleCheckbox()
    func showAlert(title: String)
    func togglePasswordDisplay()
}

protocol RegistrationViewOutput: AnyObject {
    func checkboxTapp()
    func showPassword()
    func registerByGoogle()
    func registerBy(name: String, login: String, pass: String)
    func goToLogin()
}

protocol RegistrationInteractorInput: AnyObject {
    func register(model: AuthModel)
}

protocol RegistrationInteractorOutput: AnyObject {
    func failureRegistration(with error: Error)
    func successRegistration(with result: AuthDataResult?)
}

protocol RegistrationRouterInput: AnyObject {
    func openLogin()
    func openHome()
}
