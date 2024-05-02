//
//  UIColor+Extension.swift
//  OderFood
//
//  Created by Grazi  Berti on 01/05/24.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let primarybgColor = UIColor.rgb(red: 15, green: 23, blue: 42)
    static let secondaryBgColor = UIColor.rgb(red: 163, green: 230, blue: 53)
    static let thirdBgColor = UIColor.rgb(red: 30, green: 41, blue: 59)
    static let primaryTextColor = UIColor.rgb(red: 255, green: 255, blue: 255)
    static let secondaryTextColor = UIColor.rgb(red: 203, green: 213, blue: 225)
}
