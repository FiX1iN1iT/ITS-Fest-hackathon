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
    private let timeLabel = UILabel()
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
        titleLabel.attributedText = viewModel.title
        timeLabel.attributedText = viewModel.time
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
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor.accentColor
        selectedBackgroundView = selectedView
        backgroundColor = Constants.backgroundColor
        layer.cornerRadius = 16
    }
    
    func setupBackgroundIndicatorView() {
        backgroundIndicatorView.backgroundColor = UIColor.accentColor
        
        addSubview(backgroundIndicatorView)
        backgroundIndicatorView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(10)
        }
    }
    
    func setupProfilesView() {

    }
    
    func setupStackViews() {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(timeLabel)
        
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .top
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
        static let backgroundColor: UIColor = UIColor.accentBackgroundColor
    }
}
