//
//  DetailProjectViewController.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//
//

import UIKit
import SnapKit

// MARK: - Constants

private enum Constants {
    static let baseTextColor = UIColor.white
    static let backgroundColor = UIColor(hex: "212832")
    
    static let baseOffset: CGFloat = 16
    static let nameLabelHeight: CGFloat = 100
}

// MARK: - DetailProjectViewController

final class DetailProjectViewController: UIViewController {
    
    private let nameLabel = UILabel()
    private let dateContainer = UIView()
    private let teamContainer = UIView()
    private let teamNamelabel = UILabel()
    private let dateNameLabel = UILabel()
    //    private let teamDatalabel = UILabel()
    private let dateValueLabel = UILabel()
    private let projDescriptionContainer = UIView()
    private let projDescNameLabel = UILabel()
    private let projDesclabel = UILabel()
    private let projProgressNameLabel = UILabel()
    
    private let output: DetailProjectViewOutput
    
    init(output: DetailProjectViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavigationController()
    }
}

// MARK: - User Interface

private extension DetailProjectViewController {
    private func setupNavigationController() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Constants.baseTextColor]
        navigationItem.title = "Project's Details"
    }
    
    func setupUI() {
        [
            nameLabel,
            dateContainer,
            teamContainer,
            teamNamelabel,
            dateNameLabel,
            dateValueLabel,
            projDescriptionContainer,
            projDescNameLabel,
            projDesclabel,
            projProgressNameLabel
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.backgroundColor = Constants.backgroundColor
        
        makeNameLabel()
    }
    
    func makeNameLabel() {
        nameLabel.text = "kscmdlkcmlskdcmklsdmclksdmkcljsndckjsdkcjsndkcsjkdcnkjsdcnjksndckjnskjdcnkjsdncjksdncks"
        nameLabel.textColor = Constants.baseTextColor
        nameLabel.font = UIFont.systemFont(ofSize: 24)
        nameLabel.numberOfLines = 0
        
        nameLabel.snp.makeConstraints { make in
            make.top.left.equalTo(view.safeAreaLayoutGuide).offset(Constants.baseOffset)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-Constants.baseOffset)
            make.height.equalTo(Constants.nameLabelHeight)
        }
    }
    
    func configureUniversalContainer(container: UIView, label: UILabel, content: UILabel, image: UIView) {
        // Добавление всех элементов в контейнер
        [label, content, image].forEach {
            container.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // Настройка констрейнтов
        label.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top).offset(10)
            make.left.right.equalTo(container).inset(10)
        }
        
        content.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.left.right.equalTo(container).inset(10)
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(content.snp.bottom).offset(10)
            make.left.right.equalTo(container).inset(10)
            make.bottom.equalTo(container.snp.bottom).offset(-10)
        }
    }

}

// MARK: - DetailProjectViewController

extension DetailProjectViewController: DetailProjectViewInput {
}
