//
//  UIColor+Extension.swift
//  ChiPT
//
//  Created by David Para on 5/9/19.
//  Copyright © 2019 parad. All rights reserved.
//

import Foundation
import UIKit

// MARK: Extension

extension UIColor {
    
    convenience init(hexString: String) {

        var hex: UInt32 = 0
        
        Scanner(string: hexString).scanHexInt32(&hex)
        
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16)/255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)/255.0,
            blue: CGFloat((hex & 0x0000FF) >> 0)/255.0,
            alpha: CGFloat(1)
        )
    }
}
