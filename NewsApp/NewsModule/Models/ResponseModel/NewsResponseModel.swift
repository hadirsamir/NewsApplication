//
//  NewsResponseModel.swift
//  NewsApp
//
//  Created by ASamir on 8/1/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import ObjectMapper

class NewsResponseModel : Mappable {
    var status : String = ""
    var totalResults : Int = 0
    var articles : [NewsArticleModel] = []
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status       <- map["status"]
        totalResults <- map["totalResults"]
        articles     <- map["articles"]
        
    }
}
