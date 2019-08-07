//
//  NewsSourceDataSourceContract.swift
//  NewsApp
//
//  Created by ASamir on 8/2/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import Foundation
import RxSwift
import RxCocoa
import ObjectMapper
import Alamofire

typealias newsSourceDataSourceContract = NewsSourceRemoteDataSourceContract
// News Remote Protocole
protocol NewsSourceRemoteDataSourceContract {
    associatedtype T : Mappable
    func performNewsSourceRequest(url:String, method: HTTPMethod)-> Observable<T>?
    
}
