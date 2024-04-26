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
    private let titleLabel = UILabel()
    private let tasksTableView = UITableView(frame: .zero, style: .insetGrouped)

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
        setupTitleLabel()
        setupTasksTableView()
    }

    func setupView() {
        view.backgroundColor = Constants.backgroundColor
    }
    
    func setupWeeklyCalendarViewController() {
        addChild(weeklyCalendarViewController)
        weeklyCalendarViewController.delegate = self
        view.addSubview(weeklyCalendarViewController.view)
        
        weeklyCalendarViewController.view.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                .inset(Constants.WeeklyCalendarViewController.marginTop)
            make.height.equalTo(Constants.WeeklyCalendarViewController.height)
        }
    }
    
    func setupTitleLabel() {
        titleLabel.text = "Today's Tasks"
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(weeklyCalendarViewController.view.snp.bottom).inset(-20)
            make.height.equalTo(20)
        }
    }
    
    func setupTasksTableView() {
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        tasksTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.reuseID)

        tasksTableView.sectionHeaderHeight = 0
        
        view.addSubview(tasksTableView)
        tasksTableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom).inset(-20)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - WeeklyCalendarDelegate

extension CalendarViewController: WeeklyCalendarViewControllerDelegate {
    func didTapDay(_ date: Date) {
        output.didTapDay(date)
    }
}

// MARK: - TableViewDelegate

extension CalendarViewController: UITableViewDelegate {
}

// MARK: - TableViewDataSource

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.numberOfRowsInSection(section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        output.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tasksTableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseID, for: indexPath) as? TaskTableViewCell else {
            return UITableViewCell()
        }
        
        let task = output.getTask(at: indexPath.section)
        let viewModel = TaskTableViewCellViewModel(task: task)
        cell.configure(with: viewModel)
        
        return cell
    }
}

// MARK: - ViewInput

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
            static let height: CGFloat = 90
        }
    }
}
