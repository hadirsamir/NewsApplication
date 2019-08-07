//
//  ErrorModule.swift
//  NewsApp
//
//  Created by ASamir on 8/1/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import ObjectMapper
// error module to detect error description
struct ErrorModule : Error{
    let desc:String
    let code:Int
}
