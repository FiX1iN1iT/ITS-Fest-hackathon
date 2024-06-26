//
//  BaseRouterProtocol.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//

import UIKit

protocol BaseSwiftRouterInput {
    
    func openModuleFromWindow(window: UIWindow?, navigationController: UINavigationController?)
    func openModuleFromViewController(sourceView: UIViewController?, openView: UIViewController, needHavController: Bool)
    func closeModule()
}
