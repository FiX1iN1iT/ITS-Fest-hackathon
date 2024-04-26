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
}

protocol RegistrationViewOutput: AnyObject {
}

protocol RegistrationInteractorInput: AnyObject {
}

protocol RegistrationInteractorOutput: AnyObject {
}

protocol RegistrationRouterInput: AnyObject {
}
