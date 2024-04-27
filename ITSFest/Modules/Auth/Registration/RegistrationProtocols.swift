//
//  RegistrationProtocols.swift
//  ITSFest
//
//  Created by Александр Бобрун on 26.04.2024.
//  
//

import Foundation

protocol RegistrationModuleInput {
    var moduleOutput: RegistrationModuleOutput? { get }
}

protocol RegistrationModuleOutput: AnyObject {
}

protocol RegistrationViewInput: AnyObject {
    func toggleCheckbox()
    func showAlert()
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
}

protocol RegistrationRouterInput: AnyObject {
}
