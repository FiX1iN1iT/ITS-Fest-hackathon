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
}

protocol AuthViewOutput: AnyObject {
    func goToRegistration() 
}

protocol AuthInteractorInput: AnyObject {
}

protocol AuthInteractorOutput: AnyObject {
}

protocol AuthRouterInput: AnyObject, BaseSwiftRouterInput {
    func openRegistration()
}
