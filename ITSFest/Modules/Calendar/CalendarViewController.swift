//
//  CalendarViewController.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//  
//

import UIKit
import SnapKit

final class CalendarViewController: UIViewController {
    private let output: CalendarViewOutput
    
    private let weeklyCalendarViewController = WeeklyCalendarViewController()

    init(output: CalendarViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.didLoadView()
        setup()
    }
}

private extension CalendarViewController {
    
    // MARK: - Setup
    
    func setup() {
        setupView()
        setupWeeklyCalendarViewController()
    }

    func setupView() {
        view.backgroundColor = Constants.backgroundColor
    }
    
    func setupWeeklyCalendarViewController() {
        addChild(weeklyCalendarViewController)
        view.addSubview(weeklyCalendarViewController.view)
        
        weeklyCalendarViewController.view.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//                .inset(Constants.WeeklyCalendarViewController.marginTop)
            make.topMargin.equalTo(Constants.WeeklyCalendarViewController.marginTop)
            make.height.equalTo(Constants.WeeklyCalendarViewController.height)
        }
    }
}

extension CalendarViewController: CalendarViewInput {
    func configure(with viewModel: CalendarViewModel) {
        print(#function)
    }
    
    func reloadData() {
        print(#function)
    }
    
    func showLoadingView() {
        print(#function)
    }
    
    func dismissLoadingView() {
        print(#function)
    }
    
    func showEmptyStateView() {
        print(#function)
    }
    
    func dismissEmptyStateView() {
        print(#function)
    }
}

// MARK: - Constants

private extension CalendarViewController {
    struct Constants {
        static let backgroundColor: UIColor = .white
        
        struct WeeklyCalendarViewController {
            static let marginTop: CGFloat = 20
            static let height: CGFloat = 60
        }
    }
}
