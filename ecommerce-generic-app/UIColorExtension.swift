//
//  UIColorExtension.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 11/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit


extension UIColor {
    
    static func UIColorFromRGB(_ rgbValue: Int) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func colorFromHexString(_ hexString : String) -> UIColor {
        let hexString:NSString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) as NSString
        let scanner = Scanner(string: hexString as String)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        return self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    static func primaryBlue() -> UIColor {
        return self.colorFromHexString("10A1A1")
    }
    
    static func primaryRed() -> UIColor {
        return self.colorFromHexString("f25d62")
    }
    
    static func primaryGray() -> UIColor {
        return self.colorFromHexString("999999")
    }
    
    
    static func secondaryGrayLight() -> UIColor {
        return self.colorFromHexString("d7d7d7")
    }
    
    static func secondaryGrayLighter() -> UIColor {
        return self.colorFromHexString("eeeeee")
    }
    
    static func secondaryGrayLightest() -> UIColor {
        return self.colorFromHexString("f1f1f1")
    }
    
    static func headingTextBlue() -> UIColor {
        return self.colorFromHexString("004C77")
    }
    
    static func backgroundGray() -> UIColor {
        return self.colorFromHexString("f4f3f0")
    }
    
    static func numbersDarkBlue() -> UIColor {
        return self.colorFromHexString("1673a1")
    }
    
    static func vehicleHeaderBlue() -> UIColor {
        return self.colorFromHexString("206990")
    }
    
    static func greyBorderColor() -> UIColor {
        return self.colorFromHexString("d4d3ce")
    }
    
    static func greenBorderColor() -> UIColor {
        return self.colorFromHexString("87D0D1")
    }
    
    static func backgroundBlue() -> UIColor {
        return UIColor.colorFromHexString("#e6e9f0")
    }
    
    static func greyDark() -> UIColor {
        return UIColor.colorFromHexString("#9c9c98")
    }
    
    
}
