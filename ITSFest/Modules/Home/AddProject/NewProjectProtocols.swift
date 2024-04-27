//
//  NewProjectProtocols.swift
//  ITSFest
//
//  Created by Grigory Don on 27.04.2024.
//  
//

import Foundation

protocol NewProjectModuleInput {
    var moduleOutput: NewProjectModuleOutput? { get }
}

protocol NewProjectModuleOutput: AnyObject {
}

protocol NewProjectViewInput: AnyObject {
}

protocol NewProjectViewOutput: AnyObject {
}

protocol NewProjectInteractorInput: AnyObject {
}

protocol NewProjectInteractorOutput: AnyObject {
}

protocol NewProjectRouterInput: AnyObject {
}
