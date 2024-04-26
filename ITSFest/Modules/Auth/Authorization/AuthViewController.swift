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
    static let textFieldColor = UIColor(hex: "455A64")
    static let textColor = UIColor(hex: "8CAAB9")
    static let textFieldTextColor = UIColor.white
    static let logInButtonColor = UIColor(hex: "FED36A")
    static let logInButtonTextColor = UIColor.black
    
    static let imageLogo = UIImage(named: "logoImage")
    
    static let horisontalOffset = 26
    
    static let logoTopOffset = 60
    static let logoHeight = 100
    static let logoWidth = 150
    
    static let welcomeLabelText = "Welcome Back!"
    static let welcomeLabelFontSize: CGFloat = 24
    static let welcomeLabelOffsets = 16
    
    static let logInButtonText = "Log In"
    static let logInButtonHeight = 67
    
    static let textFieldHeight = 58
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
    private let forgotPasswordButton = UIButton()
    private let logInButton = UIButton()
    private let otherLogInWaysLabel = UILabel()
    private let googleLogInButton = UIButton()
    private let registrationButton = UIButton()
    private let registrationLabel = UILabel()
    
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
            emailContainer,
            forgotPasswordButton,
            logInButton,
            otherLogInWaysLabel,
            googleLogInButton,
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.backgroundColor = Constants.backgroundColor
        
        makeLogo()
        makeWelcomelabel()
        makeEmailContainer()
        makePasswordContainer()
        makeLogInButton()
        makeOtherLogInWaysLabel()
        makeGoogleLogInButton()
        makeRegistrationContainer()
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
    
    func configureLogInButtonSize(button: UIButton) {
        
        button.snp.makeConstraints { make in
            make.height.equalTo(Constants.logInButtonHeight)
            make.left.right.equalTo(view).inset(Constants.horisontalOffset)
        }
    }

    func makeEmailContainer() {
        
        emailLabel.text = "Email address"
        
        configureTextFieldBox(containerView: emailContainer, label: emailLabel, textField: emailtextField)
        
        emailContainer.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(20)
            make.left.right.equalTo(view).inset(Constants.horisontalOffset)
        }
    }

    func makePasswordContainer() {
        
        makeForgotPasswordButton()
        
        passwordLabel.text = "Password"
        
        configureTextFieldBox(containerView: passwordContainer, label: passwordLabel, textField: passwordTextField)
        
        passwordContainer.snp.makeConstraints { make in
            make.top.equalTo(emailContainer.snp.bottom).offset(20)
            make.left.right.equalTo(view).inset(Constants.horisontalOffset)
        }
    }
    
    func makeForgotPasswordButton() {
        
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.setTitleColor(Constants.textColor, for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordContainer.snp.bottom).offset(10)
            make.right.equalTo(passwordContainer.snp.right)
        }
    }
    
    func makeLogInButton() {
        
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(Constants.logInButtonTextColor, for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        logInButton.backgroundColor = Constants.logInButtonColor
    
        configureLogInButtonSize(button: logInButton)
        
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordContainer.snp.bottom).offset(68)
        }
    }
    
    func makeOtherLogInWaysLabel() {
        
    }
    
    func makeGoogleLogInButton() {
        
    }
    
    func makeRegistrationContainer() {
        
    }

}

// MARK: - AuthViewInput

extension AuthViewController: AuthViewInput {
}
