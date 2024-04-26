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
    func configure(with viewModel: CalendarViewModel)
    func reloadData()
    func showLoadingView()
    func dismissLoadingView()
    func showEmptyStateView()
    func dismissEmptyStateView()
}

protocol CalendarViewOutput: AnyObject {
    func didLoadView()
    func didTapDay(_ date: Date)
    func didTapTask(at index: Int)
    func numberOfSections() -> Int
    func numberOfRowsInSection(_ section: Int) -> Int
    func getTask(at index: Int) -> Task
}

protocol CalendarInteractorInput: AnyObject {
    func loadDay(_ date: Date)
}

protocol CalendarInteractorOutput: AnyObject {
    func didLoadDay(with tasks: [Task])
    func didStartLoading()
    func didEndLoading()
}

protocol CalendarRouterInput: AnyObject {
    func openTask()
}
