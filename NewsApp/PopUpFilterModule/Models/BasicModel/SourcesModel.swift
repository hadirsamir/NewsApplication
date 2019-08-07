//
//  SourcesModel.swift
//  NewsApp
//
//  Created by ASamir on 8/2/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import ObjectMapper

class SourcesModel: Mappable {
    var id   : String = ""
    var name : String = ""
    var description : String = ""
    var url  : String = ""
    var category : String = ""
    var language : String = ""
    var country  : String = ""
  
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map ["name"]
        description <- map["description"]
        url         <- map["url"]
        category    <- map["category"]
        language    <- map["language"]
        country     <- map["country "]
        
        
    }
}

