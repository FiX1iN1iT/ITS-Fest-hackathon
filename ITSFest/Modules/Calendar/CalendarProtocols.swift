//
//  CalendarProtocols.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//  
//

import Foundation

protocol CalendarModuleInput {
    var moduleOutput: CalendarModuleOutput? { get }
}

protocol CalendarModuleOutput: AnyObject {
}

protocol CalendarViewInput: AnyObject {
}

protocol CalendarViewOutput: AnyObject {
}

protocol CalendarInteractorInput: AnyObject {
}

protocol CalendarInteractorOutput: AnyObject {
}

protocol CalendarRouterInput: AnyObject {
}
