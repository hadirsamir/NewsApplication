//
//  Constants.swift
//  NewsApp
//
//  Created by ASamir on 8/1/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
class NewsConstants {
    //
    // API Constants
    //
    static let API_KEY = "&apiKey=20e5de2d0e7e430fb687ece68a20597e"
    static let BASE_URL = "https://newsapi.org/v2/top-headlines?"
    static let COUNTRY_URL = BASE_URL + "country="
    static let SOURCE_URL = BASE_URL + "sources="
    static let DEFAULT_COUNTRY_CODE = "us"
    static let DEFAULT_URL = COUNTRY_URL + DEFAULT_COUNTRY_CODE + API_KEY
    static let DEFAULT_SOURCES_URL = "https://newsapi.org/v2/sources?&apiKey=20e5de2d0e7e430fb687ece68a20597e"
    //
    // Country codes
    //
    static let countryArray = ["AE","AR", "AT", "AU", "BE","BG","BR", "CA","CH","CN","CO","CU","CZ","DE","EG","FR","GB","GR","HK","HU","ID","IE","IL","IT","JP","KR","LT","LV","MA","MX","MY","NG","NL","NO","NZ","PH","PL","PT","RO","RS","RU","SA","SE", "SG","SI","SK","TH", "TR", "TW", "UA", "US", "VE","ZA"]
}
// Filter type enum 
enum FilterType {
    case COUNTRY
    case SOURCE
}
