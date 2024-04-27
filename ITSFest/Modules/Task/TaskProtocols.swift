//
//  TaskProtocols.swift
//  ITSFest
//
//  Created by Mike Ulanov on 27.04.2024.
//

import Foundation

protocol TaskViewOutput: AnyObject {
    func didLoadView()
    func didTapChangeButton(with status: String)
    func didTapDateButton()
    func didTapTimeButton()
    func didTapCreateButton()
}

protocol TaskViewInput: AnyObject {
    func configure(with model: TaskViewModel)
}

protocol TaskRouterInput: AnyObject {
    func openMain()
}

protocol TaskInteractorInput: AnyObject {
}

protocol TaskInteractorOutput: AnyObject {
}
