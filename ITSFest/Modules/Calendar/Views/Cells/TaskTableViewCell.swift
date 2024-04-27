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
    private let profilesView = UIView()
    
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
        setupStackViews()
    }
    
    func setupView() {
        backgroundColor = Constants.backgroundColor
        layer.cornerRadius = Constants.cornerRadius
    }
    
    func setupSelectedBackgroundView() {
        let selectedView = UIView()
        selectedView.backgroundColor = Constants.SelectedBackgroundView.backgroundColor
        selectedBackgroundView = selectedView
    }
    
    func setupBackgroundIndicatorView() {
        backgroundIndicatorView.backgroundColor = Constants.BackgroundIndicatorView.backgroundColor
        
        addSubview(backgroundIndicatorView)
        backgroundIndicatorView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(Constants.BackgroundIndicatorView.width)
        }
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
            make.size.equalTo(Constants.ProfilesView.size)
        }
        
        addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constants.HorizontalStackView.insets)
        }
    }
}

// MARK: - Constants

private extension TaskTableViewCell {
    struct Constants {
        static let backgroundColor: UIColor = UIColor.accentBackgroundColor
        static let cornerRadius: CGFloat = 16
        
        struct SelectedBackgroundView {
            static let backgroundColor: UIColor = UIColor.accentColor
        }
        
        struct BackgroundIndicatorView {
            static let backgroundColor: UIColor = UIColor.accentColor
            static let width: CGFloat = 10
        }
        
        struct ProfilesView {
            static let size: CGFloat = 40
        }
        
        struct HorizontalStackView {
            static let insets: CGFloat = 16
        }
    }
}
