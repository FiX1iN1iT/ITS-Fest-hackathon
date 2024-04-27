//
//  NewProjectViewController.swift
//  ITSFest
//
//  Created by Grigory Don on 27.04.2024.
//  
//

import UIKit

final class NewProjectViewController: UIViewController {
    private let output: NewProjectViewOutput

    init(output: NewProjectViewOutput) {
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

extension NewProjectViewController: NewProjectViewInput {
}
