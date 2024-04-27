//
//  NewTaskViewController.swift
//  ITSFest
//
//  Created by Mike Ulanov on 27.04.2024.
//

import Foundation
import UIKit
import SnapKit

final class TaskViewController: UIViewController {
    private let output: TaskViewOutput
    
    private let taskTitleLabel = UILabel()
    private let taskTitleTextField = UITextField()
    private let taskDetailsLabel = UILabel()
    private let taskDetailsTextField = UITextField()
    private let timeAndDateLabel = UILabel()
    private let timeButton = UIButton()
    private let dateButton = UIButton()
    private let createButton = UIButton()

    init(output: TaskViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        output.didLoadView()
    }
}

private extension TaskViewController {
    func setupUI() {
        view.backgroundColor = ColorsConstants.taskBackground
        
        setupTaskTitleLabel()
        setupTaskTitleTextField()
        setupTaskDetailsLabel()
        setupTaskDetailsTextField()
        setupTimeAndDateLabel()
        setupTimeButton()
        setupDateButton()
        setupCreateButton()
    }
    
    func setupTaskTitleLabel(){
        view.addSubview(taskTitleLabel)
        taskTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        taskTitleLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        taskTitleLabel.textColor = ColorsConstants.taskTextColor
        taskTitleLabel.textAlignment = .left
        taskTitleLabel.text = "Task Title"
        
        taskTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
        }
    }
    func setupTaskTitleTextField() {
        view.addSubview(taskTitleTextField)
        taskTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        taskTitleTextField.attributedPlaceholder = NSAttributedString(
            string: "  Create New Task", attributes: [NSAttributedString.Key.foregroundColor: ColorsConstants.taskTextColor])

        taskTitleTextField.backgroundColor = ColorsConstants.taskTextFieldColor
        taskTitleTextField.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        taskTitleTextField.textColor = ColorsConstants.taskTextColor
        
        taskTitleTextField.snp.makeConstraints { make in
            make.top.equalTo(taskTitleLabel.snp.bottom).offset(8)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.height.equalTo(48)
        }
    }
    
    func setupTaskDetailsLabel(){
        view.addSubview(taskDetailsLabel)
        taskDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
        taskDetailsLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        taskDetailsLabel.textColor = ColorsConstants.taskTextColor
        taskDetailsLabel.textAlignment = .left
        taskDetailsLabel.text = "Task Details"
        
        taskDetailsLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.top.equalTo(taskTitleTextField.snp.bottom).offset(32)
        }
    }
    
    func setupTaskDetailsTextField() {
        view.addSubview(taskDetailsTextField)
        taskDetailsTextField.translatesAutoresizingMaskIntoConstraints = false
        taskDetailsTextField.attributedPlaceholder = NSAttributedString(
            string: "  Create New Task Details", attributes: [NSAttributedString.Key.foregroundColor: ColorsConstants.taskTextColor])
        taskDetailsTextField.contentVerticalAlignment = .top

        taskDetailsTextField.backgroundColor = ColorsConstants.taskTextFieldColor
        taskDetailsTextField.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        taskDetailsTextField.textColor = ColorsConstants.taskTextColor
        
        taskDetailsTextField.snp.makeConstraints { make in
            make.top.equalTo(taskDetailsLabel.snp.bottom).offset(8)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.height.equalTo(48*3)
        }
    }
    
    func setupTimeAndDateLabel(){
        view.addSubview(timeAndDateLabel)
        timeAndDateLabel.translatesAutoresizingMaskIntoConstraints = false
        timeAndDateLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 28)
        timeAndDateLabel.textColor = ColorsConstants.taskTextColor
        timeAndDateLabel.textAlignment = .left
        timeAndDateLabel.text = "Time & Date"
        
        timeAndDateLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.top.equalTo(taskDetailsTextField.snp.bottom).offset(32)
        }
    }
    
    func setupTimeButton(){
        view.addSubview(timeButton)
        let imageName = "clock"
        let symbolPointSize: CGFloat = 23
        let color = ColorsConstants.taskTextColor

        if let originalImage = UIImage(systemName: imageName) {
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: symbolPointSize)
            let symbolImage = originalImage.withConfiguration(symbolConfiguration)
            
            timeButton.setImage(symbolImage, for: .normal)
            timeButton.tintColor = color
        }
        
        timeButton.setTitle(" Date", for: .normal)
        timeButton.setTitleColor(color, for: .normal)
        timeButton.backgroundColor = ColorsConstants.taskTimeButtonBackground
        timeButton.addTarget(self, action: #selector(didTapTimeButton), for: .touchUpInside)
        let timeButtonSize = (view.frame.width - 34) / 2
        
        timeButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.top.equalTo(timeAndDateLabel.snp.bottom).offset(32)
            make.height.equalTo(48)
            make.width.equalTo(timeButtonSize)
        }
    }
    
    @objc func didTapTimeButton(){
        output.didTapTimeButton()
    }
    
    func setupDateButton(){
        view.addSubview(dateButton)
        let imageName = "calendar"
        let symbolPointSize: CGFloat = 23
        let color = ColorsConstants.taskTextColor

        if let originalImage = UIImage(systemName: imageName) {
            let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: symbolPointSize)
            let symbolImage = originalImage.withConfiguration(symbolConfiguration)
            
            dateButton.setImage(symbolImage, for: .normal)
            dateButton.tintColor = color
        }
        
        dateButton.setTitle(" Date", for: .normal)
        dateButton.setTitleColor(color, for: .normal)
        dateButton.backgroundColor = ColorsConstants.taskTimeButtonBackground
        dateButton.addTarget(self, action: #selector(didTapDateButton), for: .touchUpInside)
        let timeButtonSize = (view.frame.width - 34) / 2
        
        dateButton.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.top.equalTo(timeAndDateLabel.snp.bottom).offset(32)
            make.height.equalTo(48)
            make.width.equalTo(timeButtonSize)
        }
    }
    
    @objc func didTapDateButton(){
        output.didTapDateButton()
    }
    
    func setupCreateButton(){
        view.addSubview(createButton)
        
        createButton.setTitle("Create", for: .normal)
        createButton.setTitleColor(.black, for: .normal)
        createButton.backgroundColor = ColorsConstants.splashButtonColor
        createButton.addTarget(self, action: #selector(didTapCreateButton), for: .touchUpInside)
        let timeButtonSize = (view.frame.width - 32)
        
        createButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(timeButton.snp.bottom).offset(32)
            make.height.equalTo(64)
            make.width.equalTo(timeButtonSize)
        }
    }
    
    @objc func didTapCreateButton(){
        output.didTapCreateButton()
    }
}

extension TaskViewController: TaskViewInput {
    func configure(with model: TaskViewModel) {
    }
}
