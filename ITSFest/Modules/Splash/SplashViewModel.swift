//
//  SplashViewModel.swift
//  ITSFest
//
//  Created by Mike Ulanov on 27.04.2024.
//

import Foundation
import UIKit

struct SplashViewModel {
    let appName: String
    let descriptionString: String
    var appLogo = UIImage()
    var splashImage = UIImage()
    
    init(appName: String, appLogo: UIImage = UIImage(), splashImage: UIImage = UIImage(), descriptionString: String) {
        self.appName = appName
        self.appLogo = appLogo
        self.splashImage = splashImage
        self.descriptionString = descriptionString
    }
}
