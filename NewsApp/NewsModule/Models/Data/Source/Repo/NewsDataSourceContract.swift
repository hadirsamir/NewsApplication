//
//  NewsDataSourceContract.swift
//  NewsApp
//
//  Created by ASamir on 8/1/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper
import Alamofire

typealias NewsDataSourceContract = NewsRemoteDataSourceContract
// News Remote Protocole
protocol NewsRemoteDataSourceContract {
    associatedtype T : Mappable
    func performNewsRequest(url:String, method: HTTPMethod)-> Observable<T>?
    
}
