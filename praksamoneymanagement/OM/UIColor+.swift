//
//  UIColor+.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 1.3.22..
//

import Foundation
import UIKit

extension UIColor
{
    static let primaryColor = UIColor(named: "PrimaryColor")!
    static let lightPurple = UIColor(named: "LightPurple")!
    static let backgroundGrey = UIColor(named: "BackgroundGrey")!
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    var hexString: String? {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0

            let multiplier = CGFloat(255.999999)

            guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
                return nil
            }

            if alpha == 1.0 {
                return String(
                    format: "#%02lX%02lX%02lX",
                    Int(red * multiplier),
                    Int(green * multiplier),
                    Int(blue * multiplier)
                )
            }
            else {
                return String(
                    format: "#%02lX%02lX%02lX%02lX",
                    Int(alpha * multiplier),
                    Int(red * multiplier),
                    Int(green * multiplier),
                    Int(blue * multiplier)
                )
            }
        }
}
