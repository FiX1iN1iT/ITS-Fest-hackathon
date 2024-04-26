//
//  DayCollectionViewCell.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit
import SnapKit

class DayCollectionViewCell: UICollectionViewCell {
    static let reuseID = "DayCollectionViewCell"
    
    private var stackView = UIStackView()
    private var weekdayLabel = UILabel()
    private var dayOfMonthLabel = UILabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                let generator = UISelectionFeedbackGenerator()
                generator.selectionChanged()
            }
            UIView.animate(withDuration: Constants.BackgroundView.animationDuration) { [weak self] in
                guard let self else {
                    return
                }
                
                backgroundView?.alpha = isSelected ? Constants.BackgroundView.endAlpha : Constants.BackgroundView.startAlpha
            }
        }
    }
    
    // MARK: - Interface
    
    func configure(with viewModel: DayCollectionViewCellViewModel) {
        weekdayLabel.attributedText = viewModel.weekday
        dayOfMonthLabel.attributedText = viewModel.dayOfMonth
    }
}

private extension DayCollectionViewCell {
    
    // MARK: - Setup
    
    func setup() {
        setupView()
        setupStackView()
    }
    
    func setupView() {
        backgroundColor = Constants.backgroundColor
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = Constants.BackgroundView.backgroundColor
        backgroundView.layer.cornerRadius = Constants.BackgroundView.cornerRadius
        self.backgroundView = backgroundView
        self.backgroundView?.alpha = Constants.BackgroundView.startAlpha
    }
    
    func setupStackView() {
        stackView.addArrangedSubview(weekdayLabel)
        stackView.addArrangedSubview(dayOfMonthLabel)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - Constants

private extension DayCollectionViewCell {
    struct Constants {
        static let backgroundColor: UIColor = .clear
        
        struct BackgroundView {
            static let backgroundColor: UIColor = .systemYellow
            static let cornerRadius: CGFloat = 8
            static let startAlpha: CGFloat = 0.0
            static let endAlpha: CGFloat = 1.0
            static let animationDuration: TimeInterval = 0.3
        }
    }
}
