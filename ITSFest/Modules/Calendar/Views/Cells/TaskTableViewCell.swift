//
//  TaskTableViewCell.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit
import SnapKit

final class TaskTableViewCell: UITableViewCell {
    static let reuseID = "TaskTableViewCell"
    
    private let titleLabel = UILabel()
    private let timeIntervalLabel = UILabel()
    private let backgroundIndicatorView = UIView()
    private let profilesView = UIView()  // create custom view with collection view
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Interface
    
    func configure(with viewModel: TaskTableViewCellViewModel) {
        titleLabel.text = viewModel.title
        timeIntervalLabel.text = viewModel.timeInterval
    }
}

private extension TaskTableViewCell {
    
    // MARK: - Setup
    
    func setup() {
        setupView()
        setupBackgroundIndicatorView()
        setupProfilesView()
        setupStackViews()
    }
    
    func setupView() {
        backgroundColor = Constants.backgroundColor
        layer.cornerRadius = 16
    }
    
    func setupBackgroundIndicatorView() {
        backgroundIndicatorView.backgroundColor = .systemYellow
        
        addSubview(backgroundIndicatorView)
        backgroundIndicatorView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(10)
        }
    }
    
    func setupProfilesView() {
        profilesView.backgroundColor = .systemMint
    }
    
    func setupStackViews() {
        
        // MARK: - VerticalStackView
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
//        verticalStackView.spacing = UIConstants.yStackSpacing
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(timeIntervalLabel)
//        verticalStackView.setCustomSpacing(UIConstants.collectionViewToCardNameSpacing, after: cardNameLabel)
        
        // MARK: - HorizontalStackView
        
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .top
//        xStack.spacing = UIConstants.xStackSpacing
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(profilesView)
        profilesView.snp.makeConstraints { make in
            make.size.equalTo(40)
        }
        
        addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}

// MARK: - Constants

private extension TaskTableViewCell {
    struct Constants {
        static let backgroundColor: UIColor = .systemGray
    }
}
