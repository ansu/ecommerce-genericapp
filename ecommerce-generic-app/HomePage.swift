//
//  HomePage.swift
//  ecommerce-generic-app
//
//  Created by Kuliza-282 on 10/09/17.
//  Copyright © 2017 Ansu. All rights reserved.
//

import Foundation
import ObjectMapper



class HomePageModel : Mappable{
    
    var returnCode : Int?
    var returnMsg : String?
    var content : [Content]?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return HomePageModel()
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    static func mappedHomePageModel(_ dict: Dictionary<String, AnyObject>) -> HomePageModel {
        return Mapper<HomePageModel>().map(JSON: dict)! as HomePageModel
    }
  
    func mapping(map: Map)
    {
        returnCode <- map["ReturnCode"]
        returnMsg <- map["ReturnMsg"]
        content <- map["content"]
        
    }
    
    
    
}


class Content : Mappable{
    
    var items : [Item]?
    var layoutType : String?
    var sectionTitle : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return Content()
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    static func mappedContent(_ dict: Dictionary<String, AnyObject>) -> Content {
        return Mapper<Content>().map(JSON: dict)! as Content
    }

    
    func mapping(map: Map)
    {
        items <- map["items"]
        layoutType <- map["layout_type"]
        sectionTitle <- map["section_title"]
        
    }
    
    
}


class Item : Mappable{
    
    var cellType : String?
    var discountedPrice : String?
    var id : Int?
    var image : String?
    var itemType : String?
    var price : String?
    var subtitle : String?
    var titile : String?
    
    
    class func newInstance(map: Map) -> Mappable?{
        return Item()
    }
    required convenience init?(map: Map) {
        self.init()
    }
    
    static func mappedItem(_ dict: Dictionary<String, AnyObject>) -> Item {
        return Mapper<Item>().map(JSON: dict)! as Item
    }
    
    func mapping(map: Map)
    {
        cellType <- map["cell_type"]
        discountedPrice <- map["discounted_price"]
        id <- map["id"]
        image <- map["image"]
        itemType <- map["item_type"]
        price <- map["price"]
        subtitle <- map["subtitle"]
        titile <- map["titile"]
        
    }
    
    
    
}
