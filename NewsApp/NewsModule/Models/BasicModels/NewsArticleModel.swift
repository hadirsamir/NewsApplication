//
//  NewsArticleModel.swift
//  NewsApp
//
//  Created by ASamir on 8/1/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import ObjectMapper

class NewsArticleModel : Mappable {
    var source : NewsArticleSourceModel?
    var title : String = ""
    var description : String = ""
    var urlToImage : String = ""
    var publishedAt : String = ""
    var content  : String = ""
    var author : String = ""
    var url : String = ""
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        source      <- map["source"]
        title       <- map["title"]
        description <- map["description"]
        urlToImage  <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        content     <- map["content"]
        author      <- map["author"]
        url         <- map["url"]
    }
}

