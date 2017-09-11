//
//  UIDeviceExtension.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 11/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import UIKit


struct ScreenSize {
    static let SCREENWIDTH         = UIScreen.main.bounds.size.width
    static let SCREENHEIGHT        = UIScreen.main.bounds.size.height
    static let SCREENMAXLENGTH    = max(ScreenSize.SCREENWIDTH, ScreenSize.SCREENHEIGHT)
    static let SCREENMINLENGTH    = min(ScreenSize.SCREENWIDTH, ScreenSize.SCREENHEIGHT)
}

struct DeviceType {
    static let isIPHONE4ORLESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREENMAXLENGTH < 568.0
    static let isIPHONE5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREENMAXLENGTH == 568.0
    static let isIPHONE6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREENMAXLENGTH == 667.0
    static let isIPHONE6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREENMAXLENGTH >= 736.0
    static let isIPHONE7          = isIPHONE6
    static let isIPHONE7P         = isIPHONE6P
    static let isIPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREENMAXLENGTH == 1024.0
}


extension UIDevice {
    public class func idForVendor() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    /// Operating system name
    public class func systemName() -> String {
        return UIDevice.current.systemName
    }
    
    /// Operating system version
    public class func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    /// Operating system version
    public class func systemFloatVersion() -> Float {
        return (systemVersion() as NSString).floatValue
    }
    
    public class func deviceName() -> String {
        return UIDevice.current.name
    }
    
    public class func deviceLanguage() -> String {
        return Bundle.main.preferredLocalizations[0]
    }
    
    
    
    ///  Returns true if the device is iPhone //TODO: Add to readme
    public class func isPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    ///  Returns true if the device is iPad //TODO: Add to readme
    public class func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    public class func deviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machine = systemInfo.machine
        var identifier = ""
        let mirror = Mirror(reflecting: machine)
        
        for child in mirror.children {
            let value = child.value
            
            if let value = value as? Int8, value != 0 {
                identifier.append(String(UnicodeScalar(UInt8(value))))
            }
        }
        
        return identifier
    }
    
    //TODO: Fix syntax, add docs and readme for these methods:
    //TODO: Delete isSystemVersionOver()
    // MARK: - Device Version Checks
    public enum Versions: Float {
        case five = 5.0
        case six = 6.0
        case seven = 7.0
        case eight = 8.0
        case nine = 9.0
        case ten = 10.0
    }
    
    public class func isVersion(_ version: Versions) -> Bool {
        return systemFloatVersion() >= version.rawValue && systemFloatVersion() < (version.rawValue + 1.0)
    }
    
    public class func isVersionOrLater(_ version: Versions) -> Bool {
        return systemFloatVersion() >= version.rawValue
    }
    
    public class func isVersionOrEarlier(_ version: Versions) -> Bool {
        return systemFloatVersion() < (version.rawValue + 1.0)
    }
    
    public class var CURRENTVERSION: String {
        return "\(systemFloatVersion())"
    }
    
    public class func isSystemVersionOver(_ requiredVersion: String) -> Bool {
        switch systemVersion().compare(requiredVersion, options: NSString.CompareOptions.numeric) {
        case .orderedSame, .orderedDescending:
            //println("iOS >= 8.0")
            return true
        case .orderedAscending:
            //println("iOS < 8.0")
            return false
        }
    }
}
