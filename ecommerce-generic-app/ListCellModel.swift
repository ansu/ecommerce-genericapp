//
//  ListCellModel.swift
//  ecommerce-generic-app
//
//  Created by Pushpendra Khandelwal on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation

struct ListCellModel {
    
    var productName: String!
    var productPrice: String!
    var productImage: URL?
    
    init(productName: String, productPrice: String!, productImageUrl: String) {
        
        self.productName = productName
        self.productImage = URL.init(string: productImageUrl)
        self.productPrice = productPrice
        
    }
    
}
