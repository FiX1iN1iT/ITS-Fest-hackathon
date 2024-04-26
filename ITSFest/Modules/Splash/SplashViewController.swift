//
//  SplashViewController.swift
//  ITSFest
//
//  Created by Mike Ulanov on 26.04.2024.
//

import UIKit
import SnapKit

final class SplashViewController: UIViewController {
    
    private let output: SplashViewOutput
    private var model: SplashViewModel?
    
    private let appLogoImageView = UIImageView()
    private let splashImageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let appNameLabel = UILabel()
    private let splashButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didLoadView()
        
        setupUI()
    }
    
    init(output: SplashViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("[DEBUG]: FATAL ERROR")
    }
}

private extension SplashViewController{
    func setupUI(){
        view.backgroundColor = ColorsConstants.splashBackground
        
        setupAppLogoImageView()
        setupSplashImageView()
        setupDescriptionLabel()
        setupAppNameLabel()
        setupSplashButton()
    }
    
    func setupAppLogoImageView(){
        view.addSubview(appLogoImageView)
        appLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        appLogoImageView.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(64)
            make.width.equalTo(94)
            make.height.equalTo(62)
        }
    }
    
    func setupSplashImageView(){
        view.addSubview(splashImageView)
        splashImageView.translatesAutoresizingMaskIntoConstraints = false
        let splashImageSize:CGFloat = view.frame.width - 32
        
        splashImageView.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.top.equalTo(appLogoImageView.snp.bottom).offset(16)
            make.width.equalTo(splashImageSize)
            make.height.equalTo(splashImageSize)
        }
    }
    
    func setupDescriptionLabel(){
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 48)
        descriptionLabel.textColor = ColorsConstants.splashDescriptionColor
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.top.equalTo(splashImageView.snp.bottom).offset(16)
        }
    }
    
    func setupAppNameLabel(){
        view.addSubview(appNameLabel)
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 48)
        appNameLabel.textColor = ColorsConstants.appNameLabelColor
        appNameLabel.numberOfLines = 0
        appNameLabel.textAlignment = .left
        
        appNameLabel.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(0)
        }
    }
    
    func setupSplashButton(){
        view.addSubview(splashButton)
        splashButton.setTitle("Let's Start", for: .normal)
        splashButton.setTitleColor(.black, for: .normal)
        splashButton.backgroundColor = ColorsConstants.splashButtonColor
        splashButton.addTarget(self, action: #selector(didTapSplashButton), for: .touchUpInside)
        
        splashButton.snp.makeConstraints { make in
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
            make.height.equalTo(64)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }
    
    @objc func didTapSplashButton(){
        output.didTapSplashButton()
    }
}

extension SplashViewController: SplashViewInput{
    func configure(with model: SplashViewModel) {
        appLogoImageView.image = model.appLogo
        splashImageView.image = model.splashImage
        descriptionLabel.text = model.descriptionString
        appNameLabel.text = model.appName
    }
}
