//
//  UIFontExtension.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 11/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit


import UIKit


struct FontSize {
    
    static var six: CGFloat {
        if DeviceType.isIPHONE5 {
            return 6
        } else if DeviceType.isIPHONE6 {
            return 8
        } else if DeviceType.isIPHONE6P {
            return 9
        } else {
            return 6
        }
    }
    
    static var seven: CGFloat {
        if DeviceType.isIPHONE5 {
            return 7
        } else if DeviceType.isIPHONE6 {
            return 9
        } else if DeviceType.isIPHONE6P {
            return 10
        } else {
            return 7
        }
    }
    
    static var eight: CGFloat {
        if DeviceType.isIPHONE5 {
            return 8
        } else if DeviceType.isIPHONE6 {
            return 10
        } else if DeviceType.isIPHONE6P {
            return 11
        } else {
            return 8
        }
    }
    
    static var nine: CGFloat {
        if DeviceType.isIPHONE5 {
            return 9
        } else if DeviceType.isIPHONE6 {
            return 11
        } else if DeviceType.isIPHONE6P {
            return 12
        } else {
            return 9
        }
    }
    
    static var ten: CGFloat {
        if DeviceType.isIPHONE5 {
            return 10
        } else if DeviceType.isIPHONE6 {
            return 13
        } else if DeviceType.isIPHONE6P {
            return 14
        } else {
            return 10
        }
    }
    
    static var eleven: CGFloat {
        if DeviceType.isIPHONE5 {
            return 11
        } else if DeviceType.isIPHONE6 {
            return 14
        } else if DeviceType.isIPHONE6P {
            return 15
        } else {
            return 11
        }
    }
    
    static var twelve: CGFloat {
        if DeviceType.isIPHONE5 {
            return 12
        } else if DeviceType.isIPHONE6 {
            return 15
        } else if DeviceType.isIPHONE6P {
            return 16
        } else {
            return 12
        }
    }
    
    static var thirteen: CGFloat {
        if DeviceType.isIPHONE5 {
            return 13
        } else if DeviceType.isIPHONE6 {
            return 16
        } else if DeviceType.isIPHONE6P {
            return 17
        } else {
            return 13
        }
    }
    
    static var fourteen: CGFloat {
        if DeviceType.isIPHONE5 {
            return 14
        } else if DeviceType.isIPHONE6 {
            return 17
        } else if DeviceType.isIPHONE6P {
            return 18
        } else {
            return 14
        }
    }
    
    static var sixteen: CGFloat {
        if DeviceType.isIPHONE5 {
            return 16
        } else if DeviceType.isIPHONE6 {
            return 19
        } else if DeviceType.isIPHONE6P {
            return 20
        } else {
            return 16
        }
    }
    
    static var seventeen: CGFloat {
        if DeviceType.isIPHONE5 {
            return 17
        } else if DeviceType.isIPHONE6 {
            return 20
        } else if DeviceType.isIPHONE6P {
            return 21
        } else {
            return 17
        }
    }
    
    static var eighteen: CGFloat {
        if DeviceType.isIPHONE5 {
            return 18
        } else if DeviceType.isIPHONE6 {
            return 21
        } else if DeviceType.isIPHONE6P {
            return 22
        } else {
            return 18
        }
    }
    
    static var twenty: CGFloat {
        if DeviceType.isIPHONE5 {
            return 20
        } else if DeviceType.isIPHONE6 {
            return 22
        } else if DeviceType.isIPHONE6P {
            return 24
        } else {
            return 20
        }
    }
    
    static var twentyThree: CGFloat {
        if DeviceType.isIPHONE5 {
            return 23
        } else if DeviceType.isIPHONE6 {
            return 26
        } else if DeviceType.isIPHONE6P {
            return 27
        } else {
            return 23
        }
    }
    
    static var twentyEight: CGFloat {
        if DeviceType.isIPHONE5 {
            return 28
        } else if DeviceType.isIPHONE6 {
            return 30
        } else if DeviceType.isIPHONE6P {
            return 32
        } else {
            return 28
        }
    }
    
    static var thirtyFive: CGFloat {
        if DeviceType.isIPHONE5 {
            return 35
        } else if DeviceType.isIPHONE6 {
            return 37
        } else if DeviceType.isIPHONE6P {
            return 38
        } else {
            return 35
        }
    }
    
}

extension UIFont {
    
    // MARK - MerryWeather Fonts
    static func cardHeadingLarge() -> UIFont {
        return UIFont(name: "Merriweather-Regular", size: FontSize.sixteen)!
    }
    
    static func cardHeadingSmall() -> UIFont {
        return UIFont(name: "Merriweather-Regular", size: FontSize.twelve)!
    }
    
    static func cardHeadingSmaller() -> UIFont {
        return UIFont(name: "Merriweather-Regular", size: FontSize.ten)!
    }
    
    
    static func headingLargeBold() -> UIFont {
        return UIFont(name: "Merriweather-Bold", size: FontSize.twenty)!
    }
    
    static func headingSmallBold() -> UIFont {
        return UIFont(name: "Merriweather-Bold", size: FontSize.twelve)!
    }
    
    static func headingMediumBold() -> UIFont {
        return UIFont(name: "Merriweather-Bold", size: FontSize.fourteen)!
    }
    
    static func cardHeadingMedium() -> UIFont {
        return UIFont(name: "Merriweather-Regular", size: FontSize.fourteen)!
    }
    
    
    static func UltraLargeText() -> UIFont {
        return UIFont(name: "Raleway-Regular", size: FontSize.twentyEight)!
    }
    
    static func UltraLargeBoldText() -> UIFont {
        return UIFont(name: "Raleway-Bold", size: FontSize.twentyEight)!
    }
    
    static func textXXXL() -> UIFont {
        return UIFont(name: "Raleway-Regular", size: FontSize.eighteen)!
    }
    
    static func textXXL() -> UIFont {
        return UIFont(name: "Raleway-Regular", size: FontSize.seventeen)!
    }
    
    
    static func textXL() -> UIFont {
        return UIFont(name: "Raleway-Regular", size: FontSize.fourteen)!
    }
    
    
    static func textLarge() -> UIFont {
        return UIFont(name: "Raleway-Regular", size: FontSize.twelve)!
    }
    
    static func textSemiLargeStyle2() -> UIFont {
        return UIFont(name: "Raleway-Medium", size: FontSize.eleven)!
    }
    
    static func textMedium() -> UIFont {
        return UIFont(name: "Raleway-Regular", size: FontSize.ten)!
    }
    
    static func textSmall() -> UIFont {
        return UIFont(name: "Raleway-Regular", size: FontSize.nine)!
    }
    
    

}

