//
//  RegistrationViewController.swift
//  ITSFest
//
//  Created by Александр Бобрун on 26.04.2024.
//  
//

import UIKit
import SnapKit

// MARK: - Constants

private enum Constants {
    static let backgroundColor = UIColor(hex: "212832")
    static let textColor = UIColor(hex: "8CAAB9")
    static let disableCheckboxColor = UIColor(hex: "FED36A")
    
    static let horisontalOffset = 26

    static let textFieldContainersSpace = 20
    static let logInButtonAndLabelSpace = 15
    static let textFieldsAndLogInButtonsSpace = 68
    static let footerAndButtonsSpace = 20
    static let titleLableAndTextFieldSpace = 20
}

final class RegistrationViewController: ViewController, AuthUIComponentsConfigurationProtocol {
    
    private let createLabel = UILabel()
    
    private let logo = UIImageView()
    
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let nameContainer = UIView()
    private let nameImageView = UIImageView()
    private let nameButton = UIButton()
    
    private let emailLabel = UILabel()
    private let emailTextField = UITextField()
    private let emailContainer = UIView()
    private let emailImageView = UIImageView()
    private let emailButton = UIButton()
    
    private let passwordLabel = UILabel()
    private let passwordTextField = UITextField()
    private let passwordContainer = UIView()
    private let passwordImageView = UIImageView()
    private let passwordButton = UIButton()
    
    private let logInButton = UIButton()
    private let otherLogInWaysLabel = UILabel()
    private let googleLogInButton = UIButton()
    
    private let registrationButton = UIButton()
    private let registrationLabel = UILabel()
    private let registrationContainer = UIView()
    
    private let checkboxButton = UIButton()
    private let privacyLable = UITextView()
    private let checkboxContainer = UIView()
    
    private let output: RegistrationViewOutput

    init(output: RegistrationViewOutput) {
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
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapWholeView))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc private func didTapWholeView() {
        view.endEditing(true)
    }
}

// MARK: User Interface

private extension RegistrationViewController {
    
    func setupUI() {
        [
            createLabel,
            logo,
            nameContainer,
            emailContainer,
            passwordContainer,
            logInButton,
            otherLogInWaysLabel,
            googleLogInButton,
            registrationContainer,
            checkboxContainer
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.backgroundColor = Constants.backgroundColor
        
        makeCreateLabel()
        makeNameContainer()
        makeEmailContainer()
        makePasswordContainer()
        makeCheckBoxContainer()
        makeLogInButton()
        makeOtherLogInWaysLabel()
        makeGoogleLogInButton()
        makeRegistrationContainer()
    }
    
    func configureCheckboxContainer(containerView: UIView, label: UITextView, button: UIButton) {
        
        label.textColor = Constants.textColor
        label.font = UIFont.systemFont(ofSize: 14)
        
        containerView.backgroundColor = .clear
        
        [label, button].forEach {
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.bottom.equalTo(containerView.snp.bottom)
            make.left.equalTo(containerView.snp.left).offset(30)
            make.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        button.snp.makeConstraints { make in
            make.centerY.equalTo(label.snp.centerY)
            make.left.equalTo(containerView.snp.left)
        }
    }
    
    func makeCreateLabel() {
        
        createLabel.text = "Create your account"
        
        configureTitlelabel(label: createLabel)
        
        createLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.horisontalOffset)
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
        }
    }
    
    func makeNameContainer() {
        
        nameLabel.text = "Full Name"
        
        nameImageView.image = UIImage(systemName: "person.fill")
        nameImageView.tintColor = Constants.textColor
        
        configureTextFieldBox(containerView: nameContainer, 
                              label: nameLabel,
                              textField: nameTextField,
                              image: nameImageView,
                              button: nameButton)
        
        nameContainer.snp.makeConstraints { make in
            make.top.equalTo(createLabel.snp.bottom).offset(Constants.titleLableAndTextFieldSpace)
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
        }
    }
    
    func makeEmailContainer() {
        
        emailLabel.text = "Email address"
        
        emailImageView.image = UIImage(systemName: "envelope.fill")
        emailImageView.tintColor = Constants.textColor
        
        configureTextFieldBox(containerView: emailContainer, 
                              label: emailLabel,
                              textField: emailTextField,
                              image: emailImageView,
                              button: emailButton)
        
        emailContainer.snp.makeConstraints { make in
            make.top.equalTo(nameContainer.snp.bottom).offset(Constants.textFieldContainersSpace)
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
        }
        
        emailTextField.keyboardType = .emailAddress
    }
    
    func makePasswordContainer() {
        
        passwordButton.addTarget(self, action: #selector(showPasswordButtonDidTapped), for: .touchUpInside)
        
        configurePasswordTextFieldBox(containerView: passwordContainer,
                              label: passwordLabel,
                              textField: passwordTextField,
                              image: passwordImageView,
                              button: passwordButton)
        
        passwordContainer.snp.makeConstraints { make in
            make.top.equalTo(emailContainer.snp.bottom).offset(Constants.textFieldContainersSpace)
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
        }
    }
    
    func makeCheckBoxContainer() {
        
        checkboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        checkboxButton.tintColor = Constants.disableCheckboxColor
        checkboxButton.addTarget(self, action: #selector(checkboxButtonDidTapped), for: .touchUpInside)
        
        let attributedString = NSMutableAttributedString(string: "I have read & agreed to DayTask Privacy Policy, Terms & Condition")
        attributedString.addAttribute(.link, value: "https://www.vk.com", range: NSRange(location: 32, length: 33))
        privacyLable.backgroundColor = .clear
        privacyLable.attributedText = attributedString
        
        configureCheckboxContainer(containerView: checkboxContainer,
                                   label: privacyLable,
                                   button: checkboxButton)
        
        checkboxContainer.snp.makeConstraints { make in
            make.top.equalTo(passwordContainer.snp.bottom)
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
        }
        
    }
    
    func makeLogInButton() {
        
        logInButton.setTitle("Log In", for: .normal)
        configureMainButton(button: logInButton)
        
        logInButton.addTarget(self, action: #selector(mainRegisterButtonDidTapped), for: .touchUpInside)
        
        logInButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Constants.horisontalOffset)
            make.top.equalTo(checkboxContainer.snp.bottom)
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

        configureFooterContainer(container: registrationContainer,
                                 label: registrationLabel,
                                 button: registrationButton)
        
        registrationContainer.snp.makeConstraints { make in
            make.top.equalTo(googleLogInButton.snp.bottom).offset(Constants.footerAndButtonsSpace)
            make.centerX.equalTo(view.snp.centerX)
        }
    }

    func textView(_ textView: UITextView, 
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
    
    @objc
    func logInButtonDidTapped() {
        output.goToLogin()
    }
    
    @objc
    func mainRegisterButtonDidTapped() {
        output.registerBy(name: nameTextField.text ?? "", login: emailTextField.text ?? "", pass: passwordLabel.text ?? "")
    }
    
    @objc
    func googleRegisterButtonDidTapped() {
        output.registerByGoogle()
    }
    
    @objc
    func showPasswordButtonDidTapped() {
        output.showPassword()
    }
    
    @objc
    func checkboxButtonDidTapped() {
        output.checkboxTapp()
    }
}

extension RegistrationViewController: RegistrationViewInput {
    
    func togglePasswordDisplay() {
        if passwordTextField.isSecureTextEntry {
            passwordButton.setImage(UIImage(systemName: "eyes.inverse"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordButton.setImage(UIImage(systemName: "eyes"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    func toggleCheckbox() {
        if checkboxButton.currentImage == UIImage(systemName: "checkmark.square") {
            checkboxButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            checkboxButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
    }
    
    func showAlert(title: String) {
        print("alert")
    }
    
}
