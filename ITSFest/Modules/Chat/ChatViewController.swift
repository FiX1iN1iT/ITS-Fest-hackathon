//
//  ChatViewController.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//  
//

import UIKit

final class ChatViewController: UIViewController {
    private let output: ChatViewOutput

    init(output: ChatViewOutput) {
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

extension ChatViewController: ChatViewInput {
}
