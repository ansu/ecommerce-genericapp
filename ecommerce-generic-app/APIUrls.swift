//
//  APIUrls.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 10/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation


enum APIUrls:String {
    case homePageAPI = "/ValidateIFA"
    
    
    var returnURL: String {
        return  self.rawValue
    }
}
