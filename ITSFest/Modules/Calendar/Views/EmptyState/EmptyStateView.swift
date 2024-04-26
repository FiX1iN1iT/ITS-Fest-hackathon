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
    private let imageView = UIImageView()
    
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
        setupImageView()
        setupTitleLabel()
    }
    
    func setupView() {
        backgroundColor = Constants.backgroundColor
    }
    
    func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constants.ImageView.marginTop)
            make.height.equalTo(Constants.ImageView.size)
            make.width.equalTo(Constants.ImageView.size)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupTitleLabel() {
        titleLabel.textAlignment = .center
        
        addSubview(titleLabel)        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.safeAreaLayoutGuide.snp.bottom).inset(Constants.ImageView.marginTop)
            make.height.equalTo(Constants.TitleLabel.height)
            make.horizontalEdges.equalToSuperview()
        }
    }
    
    // MARK: - Configure
    
    func configure() {
        let viewModel = EmptyStateViewViewModel()
        imageView.image = viewModel.logoImage
        titleLabel.attributedText = viewModel.title
    }
}

// MARK: - Constants

private extension EmptyStateView {
    struct Constants {
        static let backgroundColor: UIColor = .clear
        
        struct ImageView {
            static let marginTop: CGFloat = 100
            static let size: CGFloat = 300
        }
        
        struct TitleLabel {
            static let height: CGFloat = 36
        }
    }
}
