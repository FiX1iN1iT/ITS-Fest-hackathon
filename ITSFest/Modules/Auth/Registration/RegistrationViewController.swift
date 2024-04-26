//
//  RegistrationViewController.swift
//  ITSFest
//
//  Created by Александр Бобрун on 26.04.2024.
//  
//

import UIKit

final class RegistrationViewController: ViewController {
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
    }
}

extension RegistrationViewController: RegistrationViewInput {
}
