//
//  EmptyStateView.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit
import SnapKit

final class EmptyStateView: UIView {
    
    // MARK: - Private Properties
    
    private let titleLabel = UILabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        configure()
    }
}

private extension EmptyStateView {
    
    // MARK: - Setup
    
    func setup() {
        setupView()
        setupTitleLabel()
    }
    
    func setupView() {
        backgroundColor = Constants.backgroundColor
    }
    
    func setupTitleLabel() {
        titleLabel.textAlignment = .center
        
        addSubview(titleLabel)        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
//                .inset(Constants.ImageView.marginTop)
            make.height.equalTo(Constants.TitleLabel.height)
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    // MARK: - Configure
    
    func configure() {
        let viewModel = EmptyStateViewViewModel()
        titleLabel.attributedText = viewModel.title
    }
}

// MARK: - Constants

private extension EmptyStateView {
    struct Constants {
        static let backgroundColor: UIColor = .clear
        
        struct TitleLabel {
            static let height: CGFloat = 40
        }
    }
}
