//
//  DetailProjectCell.swift
//  ITSFest
//
//  Created by Grigory Don on 27.04.2024.
//

import Foundation
import UIKit
import SnapKit

final class DetailProjectCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
}

extension DetailProjectCell {
    private func setupViews() {
        contentView.addSubview(titleLabel)
        backgroundColor = UIColor(hex: "455A64")
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(32)
        }
    }
}

extension DetailProjectCell {
    func configureWith(_ model: TaskModel) {
        titleLabel.text = model.title
    }
    
    func changeBackgroundColor(_ done: Bool) {
        
        if done {
            backgroundColor = UIColor.systemYellow
        } else {
            backgroundColor = UIColor(hex: "455A64")
        }
        
        self.layoutIfNeeded()
    }
}
