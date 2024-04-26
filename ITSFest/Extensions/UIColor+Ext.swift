//
//  UIColor+Ext.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit

extension UIColor {
    static let backgroundColor: UIColor = {
        guard let color = UIColor(named: "Background") else {
            fatalError("Can't find color: Background")
        }
        
        return color
    }()
    
    static let accentColor: UIColor = {
        guard let color = UIColor(named: "Accent") else {
            fatalError("Can't find color: Accent")
        }
        
        return color
    }()
    
    static let accentBackgroundColor: UIColor = {
        guard let color = UIColor(named: "AccentBackground") else {
            fatalError("Can't find color: AccentBackground")
        }
        
        return color
    }()
}
