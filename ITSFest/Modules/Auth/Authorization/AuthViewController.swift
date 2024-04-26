//
//  AuthViewController.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//
//

import UIKit
import SnapKit

// MARK: - Constants

private enum Constants {
    static let backgroundColor = UIColor(hex: "212832")
    static let tfColor = UIColor(hex: "455A64")
    static let textColor = UIColor.white
    
    static let imageLogo = UIImage(named: "logoImage")
    
    static let logoTopOffset = 60
    static let logoHeight = 100
    static let logoWidth = 150
    
    static let welcomeLabelText = "Welcome Back!"
    static let welcomeLabelFontSize: CGFloat = 24
    static let welcomeLabelOffsets = 16
}

// MARK: - AuthViewController

final class AuthViewController: UIViewController {
    
    private let welcomeLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let logo = UIImageView()
    private let emailtextField = UITextField()
    private let passwordTextField = UITextField()
    private let emailContainer = UIView()
    private let passwordContainer = UIView()
    
    private let output: AuthViewOutput
    
    init(output: AuthViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: User Interface

private extension AuthViewController {
    func setupUI() {
        [
            welcomeLabel,
            logo,
            passwordContainer,
            emailContainer
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.backgroundColor = Constants.backgroundColor
        
        makeLogo()
        makeWelcomelabel()
        makeEmailContainer()
        makePasswordContainer()
    }
    
    func makeLogo() {
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
    
    func makeWelcomelabel() {
        welcomeLabel.text = Constants.welcomeLabelText
        welcomeLabel.textAlignment = .left
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.systemFont(ofSize: Constants.welcomeLabelFontSize, weight: .semibold)
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(Constants.welcomeLabelOffsets)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(Constants.welcomeLabelOffsets)
            make.right.equalToSuperview().offset(-Constants.welcomeLabelOffsets)
        }
    }
    
    func configureTextFieldBox(containerView: UIView, label: UILabel, textField: UITextField) {
        label.textColor = Constants.textColor
        
        textField.textColor = Constants.tfColor
        textField.backgroundColor = .clear

        containerView.backgroundColor = Constants.backgroundColor
        containerView.layer.cornerRadius = 10
        
        [label, textField].forEach {
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.snp.makeConstraints { make in
                make.left.right.equalTo(containerView).inset(10)
            }
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(10)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(5)
            make.bottom.equalTo(containerView.snp.bottom).offset(-10)
            make.height.equalTo(40)
        }
    }

    func makeEmailContainer() {
        configureTextFieldBox(containerView: emailContainer, label: emailLabel, textField: emailtextField)
        
        emailContainer.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(20)
            make.left.right.equalTo(view).inset(20)
            make.height.equalTo(80)
        }
    }

    func makePasswordContainer() {
        configureTextFieldBox(containerView: passwordContainer, label: passwordLabel, textField: passwordTextField)
        
        passwordContainer.snp.makeConstraints { make in
            make.top.equalTo(emailContainer.snp.bottom).offset(20)
            make.left.right.equalTo(view).inset(20)
            make.height.equalTo(80)
        }
    }

}

// MARK: - AuthViewInput

extension AuthViewController: AuthViewInput {
}
