//
//  AuthUIComponentsConfigurationProtocol.swift
//  ITSFest
//
//  Created by Александр Бобрун on 26.04.2024.
//

import Foundation
import UIKit
import SnapKit

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

    static let logoTopOffset = 10
    static let logoHeight = 100
    static let logoWidth = 150
    
    static let titleLabelFontSize: CGFloat = 24

    static let logInButtonHeight = 44
    static let textFieldHeight = 44
}

protocol AuthUIComponentsConfigurationProtocol {
    
}

extension AuthUIComponentsConfigurationProtocol {
    
    func configureTextFieldBox(containerView: UIView, label: UILabel, textField: UITextField, image: UIImageView, button: UIButton) {
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = Constants.textFieldColor
        
        label.textColor = Constants.textColor
        
        textField.textColor = Constants.textFieldTextColor
        textField.backgroundColor = Constants.textFieldColor
        textField.keyboardType = .default
        
        containerView.backgroundColor = .clear
        
        [label, backgroundView].forEach {
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.snp.makeConstraints { make in
                make.left.right.equalTo(containerView)
            }
        }
        
        [textField, image, button].forEach {
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(5)
            make.bottom.equalTo(containerView.snp.bottom)
            make.height.equalTo(Constants.textFieldHeight)
        }
        
        image.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundView.snp.centerY)
            make.centerX.equalTo(backgroundView.snp.left).offset(20)
        }
        
        textField.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundView.snp.centerY)
            make.left.equalTo(containerView.snp.left).offset(40)
            make.right.equalTo(containerView.snp.right).offset(-40)
            make.height.equalTo(Constants.textFieldHeight)
        }

        button.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundView.snp.centerY)
            make.centerX.equalTo(backgroundView.snp.right).offset(-20)
        }
    }
    
    func configurePasswordTextFieldBox(containerView: UIView, label: UILabel, textField: UITextField, image: UIImageView, button: UIButton) {
        
        label.text = "Password"
        
        image.image = UIImage(systemName: "lock.fill")
        image.tintColor = Constants.textColor
        
        button.setImage(UIImage(systemName: "eyes"), for: .normal)
        button.tintColor = Constants.textColor
        
        textField.isSecureTextEntry = true
        
        configureTextFieldBox(containerView: containerView,
                              label: label,
                              textField: textField,
                              image: image,
                              button: button)
    }
    
    func configureLogo(view: UIView, logo: UIImageView) {
        logo.image = Constants.imageLogo
        if logo.image == nil {
            print("Image not loaded")
        }
        
        logo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.logoTopOffset)
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
            make.top.equalTo(container.snp.top)
            make.bottom.equalTo(container.snp.bottom)
        }
    }
}
