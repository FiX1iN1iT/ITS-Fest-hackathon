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
        titleLabel.text = "Title amamammama"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(32)
        }
    }
}
