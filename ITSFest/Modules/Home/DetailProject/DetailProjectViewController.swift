//
//  DetailProjectViewController.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import UIKit
import SnapKit

// MARK: - Constants

private enum Constants {
    
}

// MARK: - DetailProjectViewController

final class DetailProjectViewController: UIViewController {
    private let output: DetailProjectViewOutput

    init(output: DetailProjectViewOutput) {
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

// MARK: - DetailProjectViewController

extension DetailProjectViewController: DetailProjectViewInput {
}
