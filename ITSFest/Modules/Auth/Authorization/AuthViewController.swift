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
    static let textColor = UIColor(hex: "8CAAB9")
    
    static let horisontalOffset = 26

    static let textFieldContainersSpace = 20
    static let logInButtonAndLabelSpace = 15
    static let textFieldsAndLogInButtonsSpace = 68
    static let footerAndButtonsSpace = 20
    static let titleLableAndTextFieldSpace = 20
}

// MARK: - AuthViewController

final class AuthViewController: UIViewController, AuthUIComponentsConfigurationProtocol {
    
    private let welcomeLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let logo = UIImageView()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let emailContainer = UIView()
    private let passwordContainer = UIView()
    private let forgotPasswordButton = UIButton()
    private let logInButton = UIButton()
    private let otherLogInWaysLabel = UILabel()
    private let googleLogInButton = UIButton()
    private let registrationButton = UIButton()
    private let registrationLabel = UILabel()
    private let registrationContainer = UIView()
    
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
            registrationContainer
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.backgroundColor = Constants.backgroundColor
        
        configureLogo(view: view, logo: logo)
        makeWelcomelabel()
        makeEmailContainer()
        makePasswordContainer()
        makeLogInButton()
        makeOtherLogInWaysLabel()
        makeGoogleLogInButton()
        makeRegistrationContainer()
    }
    
    func makeWelcomelabel() {
        
        welcomeLabel.text = "Welcome Back!"
        
        configureTitlelabel(label: welcomeLabel)
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(Constants.horisontalOffset)
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
        }
    }

    func makeEmailContainer() {
        
        emailLabel.text = "Email address"
        
        configureTextFieldBox(containerView: emailContainer, 
                              label: emailLabel,
                              textField: emailTextField)
        
        emailContainer.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(Constants.titleLableAndTextFieldSpace)
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
        }
    }

    func makePasswordContainer() {
        
        makeForgotPasswordButton()
        
        passwordLabel.text = "Password"
        
        configureTextFieldBox(containerView: passwordContainer, 
                              label: passwordLabel,
                              textField: passwordTextField)
        
        passwordContainer.snp.makeConstraints { make in
            make.top.equalTo(emailContainer.snp.bottom).offset(Constants.textFieldContainersSpace)
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
        }
    }
    
    func makeForgotPasswordButton() {
        
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        
        forgotPasswordButton.setTitleColor(Constants.textColor, for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordContainer.snp.bottom).offset(5)
            make.right.equalTo(passwordContainer.snp.right)
        }
    }
    
    func makeLogInButton() {
        
        logInButton.setTitle("Log In", for: .normal)
        configureMainButton(button: logInButton)
        
        logInButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
            make.top.equalTo(passwordContainer.snp.bottom).offset(Constants.textFieldsAndLogInButtonsSpace)
        }
    }
    
    func makeOtherLogInWaysLabel() {
        
        otherLogInWaysLabel.text = "Or continue with"
        otherLogInWaysLabel.textAlignment = .center
        
        configureDefaultLabel(label: otherLogInWaysLabel)
        
        otherLogInWaysLabel.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(Constants.logInButtonAndLabelSpace)
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
        }
    }
    
    func makeGoogleLogInButton() {
        
        googleLogInButton.setTitle("Google", for: .normal)
        googleLogInButton.setImage(UIImage(systemName: "person"), for: .normal)

        configureSecondaryButton(button: googleLogInButton)
        
        googleLogInButton.snp.makeConstraints { make in
            make.top.equalTo(otherLogInWaysLabel.snp.bottom).offset(Constants.logInButtonAndLabelSpace)
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
        }
    }
    
    func makeRegistrationContainer() {
        
        registrationLabel.text = "Don't have an account?"
        
        registrationButton.setTitle("Sign up", for: .normal)
        registrationButton.addTarget(self, action: #selector(signUpButtonDidTapped), for: .touchUpInside)

        configureFooterContainer(container: registrationContainer,
                                 label: registrationLabel,
                                 button: registrationButton)
        
        registrationContainer.snp.makeConstraints { make in
            make.top.equalTo(googleLogInButton.snp.bottom).offset(Constants.footerAndButtonsSpace)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    @objc
    func signUpButtonDidTapped() {
        output.goToRegistration()
        print("tap")
    }
}

// MARK: - AuthViewInput

extension AuthViewController: AuthViewInput {
}
