//
//  Color.swift
//  instagramClone
//
//  Created by Sinan Özman on 12.01.2021.
//

import Foundation
import UIKit

extension UIColor {
    // MARK: - Hex Settings
    /// Hex Pointer creation
    /// - Parameters:
    ///   - hex: hex code
    ///   - alpha: alpha value
    convenience init(hex: Int, alpha: Double = 1.0) {
          self.init(red: CGFloat((hex >> 16) & 0xFF) / 255.0, green: CGFloat((hex >> 8) & 0xFF) / 255.0, blue: CGFloat((hex) & 0xFF) / 255.0, alpha: CGFloat(255 * alpha) / 255)
      }
    /// Hex String Creation
    /// - Parameters:
    ///   - hexString: hex code
    ///   - alpha: alpha value
 convenience init(hex: String, alpha: CGFloat = 1.0) {
          var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

          if hexFormatted.hasPrefix("#") {
              hexFormatted = String(hexFormatted.dropFirst())
          }

          assert(hexFormatted.count == 6, "Invalid hex code used.")

          var rgbValue: UInt64 = 0
          Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

          self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                    green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                    blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                    alpha: alpha)
      }
    /// Hex Code to String
    /// - Returns: string hex value
      func toHexString() -> String {
          var r: CGFloat = 0
          var g: CGFloat = 0
          var b: CGFloat = 0
          var a: CGFloat = 0
          getRed(&r, green: &g, blue: &b, alpha: &a)
          let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int)(b * 255) << 0
          return NSString(format: "#%06x", rgb) as String
      }
}
