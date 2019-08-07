//
//  NewsArticleSource.swift
//  NewsApp
//
//  Created by ASamir on 8/1/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import ObjectMapper

class NewsArticleSourceModel : Mappable {
    var id : String = ""
    var name : String = ""
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id       <- map["id"]
        name     <- map["name"]
        
    }
}
