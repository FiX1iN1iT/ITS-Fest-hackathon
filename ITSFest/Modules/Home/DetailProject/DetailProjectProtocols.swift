//
//  DetailProjectProtocols.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import Foundation

protocol DetailProjectModuleInput {
    var moduleOutput: DetailProjectModuleOutput? { get }
}

protocol DetailProjectModuleOutput: AnyObject {
}

protocol DetailProjectViewInput: AnyObject {
}

protocol DetailProjectViewOutput: AnyObject {
}

protocol DetailProjectInteractorInput: AnyObject {
}

protocol DetailProjectInteractorOutput: AnyObject {
}

protocol DetailProjectRouterInput: AnyObject {
}
