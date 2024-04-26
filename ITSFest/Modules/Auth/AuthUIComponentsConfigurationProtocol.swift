//
//  AuthUIComponentsConfigurationProtocol.swift
//  ITSFest
//
//  Created by Александр Бобрун on 26.04.2024.
//

import Foundation
import UIKit

// MARK: - Constants

private enum Constants {
    static let textFieldColor = UIColor(hex: "455A64")
    static let textColor = UIColor(hex: "8CAAB9")
    static let titleTextColor = UIColor.white
    static let textFieldTextColor = UIColor.white
    static let mainButtonColor = UIColor(hex: "FED36A")
    static let mainButtonTextColor = UIColor.black
    static let secondaryButtonColor = UIColor.white
    
    static let imageLogo = UIImage(named: "logoImage")

    
    static let logoTopOffset = 60
    static let logoHeight = 100
    static let logoWidth = 150
    
    static let titleLabelFontSize: CGFloat = 24

    static let logInButtonHeight = 44
    static let textFieldHeight = 44
}

protocol AuthUIComponentsConfigurationProtocol {
    
}

extension AuthUIComponentsConfigurationProtocol {
    
    func configureTextFieldBox(containerView: UIView, label: UILabel, textField: UITextField) {
        
        label.textColor = Constants.textColor
        
        textField.textColor = Constants.textFieldTextColor
        textField.backgroundColor = Constants.textFieldColor
        
        containerView.backgroundColor = .clear
        
        [label, textField].forEach {
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.snp.makeConstraints { make in
                make.left.right.equalTo(containerView)
            }
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(5)
            make.bottom.equalTo(containerView.snp.bottom)
            make.height.equalTo(Constants.textFieldHeight)
        }
    }
    
    func configureLogo(logo: UIImageView) {
        logo.image = Constants.imageLogo
        if logo.image == nil {
            print("Image not loaded")
        }
        
        logo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.logoTopOffset)
            make.centerX.equalToSuperview()
            make.width.equalTo(Constants.logoWidth)
            make.height.equalTo(Constants.logoHeight)
        }
    }
    
    func configureTitlelabel(label: UILabel) {
        label.textAlignment = .left
        label.textColor = Constants.titleTextColor
        label.font = UIFont.systemFont(ofSize: Constants.titleLabelFontSize, weight: .semibold)
    }
    
    func configureMainButton(button: UIButton) {
        
        button.setTitleColor(Constants.mainButtonTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        button.backgroundColor = Constants.mainButtonColor
        
        button.snp.makeConstraints { make in
            make.height.equalTo(Constants.logInButtonHeight)
        }
    }
    
    func configureSecondaryButton(button: UIButton) {
        
        button.setTitleColor(Constants.secondaryButtonColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.tintColor = Constants.secondaryButtonColor
        
        button.backgroundColor = .clear
        button.layer.borderWidth = 2
        button.layer.borderColor = Constants.secondaryButtonColor.cgColor
        
        button.snp.makeConstraints { make in
            make.height.equalTo(Constants.logInButtonHeight)
        }
    }
    
    func configureDefaultLabel(label: UILabel) {
        
        label.textColor = Constants.textColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
    func configureFooterButton(button: UIButton) {
        
        button.setTitleColor(Constants.mainButtonColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
    func configureFooterContainer(container: UIView, label: UILabel, button: UIButton) {
        
        [label, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview($0)
        }
        
        configureDefaultLabel(label: label)
        label.textAlignment = .right
        
        configureFooterButton(button: button)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(container.snp.top)
            make.left.equalTo(container.snp.left)
        }
        
        button.snp.makeConstraints { make in
            make.right.equalTo(container.snp.right)
            make.centerY.equalTo(label.snp.centerY)
            make.left.equalTo(label.snp.right).offset(5)
        }
    }
}
