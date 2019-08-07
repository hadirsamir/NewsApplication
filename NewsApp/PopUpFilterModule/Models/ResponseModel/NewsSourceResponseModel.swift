//
//  NewsSourceResponseModel.swift
//  NewsApp
//
//  Created by ASamir on 8/2/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper

class NewsSourceResponseModel: Mappable {
    var status : String = ""
    var sources: [SourcesModel] = []
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status       <- map["status"]
        sources      <- map["sources"]
        
    }
}
