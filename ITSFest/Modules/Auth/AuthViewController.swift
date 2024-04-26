//
//  AuthViewController.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import UIKit
import SnapKit

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
    }
}

private extension AuthViewController {
    func setupUI() {
        [
            welcomeLabel,
            emailLabel,
            passwordLabel,
            logo
        ].forEach {
            view.addSubview(
                $0
            )
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

extension AuthViewController: AuthViewInput {
}
