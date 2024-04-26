//
//  ReplyProtocols.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import Foundation

protocol ReplyModuleInput {
    var moduleOutput: ReplyModuleOutput? { get }
}

protocol ReplyModuleOutput: AnyObject {
}

protocol ReplyViewInput: AnyObject {
}

protocol ReplyViewOutput: AnyObject {
}

protocol ReplyInteractorInput: AnyObject {
}

protocol ReplyInteractorOutput: AnyObject {
}

protocol ReplyRouterInput: AnyObject {
}
