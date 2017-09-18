//
//  CommonServiceProtocol.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 10/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation


protocol CommonServiceProtocol {
    
    typealias HomePageCompletionHandler = (Result<HomePageModel?>) -> ()
    func getHomePageData(completion: @escaping HomePageCompletionHandler)
    
}
