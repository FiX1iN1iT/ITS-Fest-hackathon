//
//  CalendarViewController.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//  
//

import UIKit

final class CalendarViewController: UIViewController {
    private let output: CalendarViewOutput

    init(output: CalendarViewOutput) {
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

extension CalendarViewController: CalendarViewInput {
}
