//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by ASamir on 8/1/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class NewsViewModel: NSObject {
    // publish error subject
    public var errorModule = PublishSubject<ErrorModule>()
    public private(set) var objNewsRemoteObservable = PublishSubject<NewsResponseModel>()
    private var disposeBag = DisposeBag()
    private var NewsRepo = NewsRepository<NewsResponseModel>()
    
    override init() {
        super.init()
        self.initializeSubscribers()
    }
    // initialize subscribers
    private func initializeSubscribers(){
        //GET LIST
        self.NewsRepo.objObservableRemoteData.asObservable().subscribe(onNext: { (weatherResponse) in
            self.objNewsRemoteObservable.onNext(weatherResponse)
        }, onError: {(error) in
        }, onCompleted: {
        }).disposed(by: self.disposeBag)
        
        self.NewsRepo.errorModule.asObservable().subscribe(onNext: { (err) in
            self.errorModule.onNext(err)
        }).disposed(by: disposeBag)
    }
    //get news data according to enum type
    func getNewsData( type : FilterType, code : String){
        if (type == FilterType.COUNTRY){
            self.NewsRepo.subscribeToAPI(url: NewsConstants.COUNTRY_URL + code + NewsConstants.API_KEY,method:.get)
        }
            
        else if (type == FilterType.SOURCE){
            self.NewsRepo.subscribeToAPI(url:  NewsConstants.SOURCE_URL + code + NewsConstants.API_KEY,method:.get)
        }
        
    }
}
