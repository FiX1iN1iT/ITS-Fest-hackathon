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
    static let imageLogo = UIImage(systemName: "logoImage")
}

// MARK: - AuthViewController

final class AuthViewController: UIViewController {
    
    private let welcomeLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let logo = UIImageView()
    
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
            emailLabel,
            passwordLabel,
            logo
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        view.backgroundColor = Constants.backgroundColor
        
        makeLogo()
    }
    
    func makeLogo() {
        logo.image = Constants.imageLogo
        if logo.image == nil {
            print("Image not loaded")
        }

        logo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200) // Ширина
            make.height.equalTo(100) // Высота
        }
    }

}

// MARK: - AuthViewInput

extension AuthViewController: AuthViewInput {
}
