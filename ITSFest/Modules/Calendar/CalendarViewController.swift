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

    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let emptyStateView = EmptyStateView()
    
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
        setup()
        output.didLoadView()
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
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Constants.TitleLabel.horizontalInsets)
            make.top.equalTo(weeklyCalendarViewController.view.snp.bottom).inset(Constants.TitleLabel.topInset)
            make.height.equalTo(Constants.TitleLabel.height)
        }
    }
    
    func setupTasksTableView() {
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        tasksTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.reuseID)

        tasksTableView.sectionHeaderHeight = Constants.TasksTableView.sectionHeaderHeight
        tasksTableView.backgroundColor = Constants.TasksTableView.backgroundColor
        
        view.addSubview(tasksTableView)
        tasksTableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didTapTask(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
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
        titleLabel.attributedText = viewModel.title
    }
    
    func reloadData() {
        tasksTableView.reloadData()
    }
    
    func showEmptyStateView() {
        titleLabel.isHidden = true
        view.addSubview(emptyStateView)
        
        emptyStateView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(weeklyCalendarViewController.view.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func dismissEmptyStateView() {
        guard emptyStateView.superview != nil else {
            return
        }
        
        titleLabel.isHidden = false
        emptyStateView.removeFromSuperview()
    }
    
    func showLoadingView() {
        view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        activityIndicator.removeFromSuperview()
    }
}

// MARK: - Constants

private extension CalendarViewController {
    struct Constants {
        static let backgroundColor: UIColor = UIColor.backgroundColor
        
        struct WeeklyCalendarViewController {
            static let marginTop: CGFloat = 20
            static let height: CGFloat = 90
        }
        
        struct TitleLabel {
            static let horizontalInsets: CGFloat = 20
            static let topInset: CGFloat = -20
            static let height: CGFloat = 30
        }
        
        struct TasksTableView {
            static let sectionHeaderHeight: CGFloat = 0
            static let backgroundColor: UIColor = .clear
        }
    }
}
