//
//  CollectionCellModel.swift
//  ecommerce-generic-app
//
//  Created by Pushpendra Khandelwal on 18/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation

struct CollectionCellModel {
    
    var title: String!
    var subtitle: String!
    var price: String!
    var imageUrl: URL?
    
    init(title: String, subtitle: String, price: String, imageUrl: String) {
        self.title = title
        self.subtitle = subtitle
        self.price = price
        self.imageUrl = URL.init(string: imageUrl)
    }
}
