//
//  NewsSourceRequestClass.swift
//  NewsApp
//
//  Created by ASamir on 8/2/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper
import Alamofire

class NewsSourceRequestClass<U:Mappable>:NewsSourceRemoteDataSourceContract {
    
    typealias T = U
    
    func performNewsSourceRequest(url: String, method: HTTPMethod) -> Observable<U>? {
        return  Observable.create{
            observer in
            Alamofire.request(url,
                              method: method,
                              encoding: URLEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success(let json):
                        guard let value = json as? [String: Any]
                            
                            else {
                                return
                        }
                        print (value)
                        let responseObj = U(JSON: value)
                        observer.onNext(responseObj!)
                    case .failure(let error):
                        observer.onError(error)
                    }
            }
            return Disposables.create {
            }
        }
    }
}

