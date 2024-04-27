//
//  AuthProtocols.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import Foundation

protocol AuthModuleInput {
    var moduleOutput: AuthModuleOutput? { get }
}

protocol AuthModuleOutput: AnyObject {
}

protocol AuthViewInput: AnyObject {
    func togglePasswordDisplay()
    func showAlert()
}

protocol AuthViewOutput: AnyObject {
    func goToRegistration()
    func logInBy(login: String, pass: String)
    func logInByGoogle()
    func showPassword()
    func recoverPassword()
}

protocol AuthInteractorInput: AnyObject {
}

protocol AuthInteractorOutput: AnyObject {
}

protocol AuthRouterInput: AnyObject, BaseSwiftRouterInput {
    func openRegistration()
}
