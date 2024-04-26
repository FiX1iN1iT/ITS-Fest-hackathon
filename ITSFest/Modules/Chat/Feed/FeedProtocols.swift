//
//  FeedProtocols.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import Foundation

protocol FeedModuleInput {
    var moduleOutput: FeedModuleOutput? { get }
}

protocol FeedModuleOutput: AnyObject {
}

protocol FeedViewInput: AnyObject {
}

protocol FeedViewOutput: AnyObject {
}

protocol FeedInteractorInput: AnyObject {
}

protocol FeedInteractorOutput: AnyObject {
}

protocol FeedRouterInput: AnyObject {
}
