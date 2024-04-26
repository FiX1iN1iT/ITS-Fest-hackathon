//
//  ChatProtocols.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import Foundation

protocol ChatModuleInput {
    var moduleOutput: ChatModuleOutput? { get }
}

protocol ChatModuleOutput: AnyObject {
}

protocol ChatViewInput: AnyObject {
}

protocol ChatViewOutput: AnyObject {
}

protocol ChatInteractorInput: AnyObject {
}

protocol ChatInteractorOutput: AnyObject {
}

protocol ChatRouterInput: AnyObject {
}
