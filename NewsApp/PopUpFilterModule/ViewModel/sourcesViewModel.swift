//
//  sourcesViewModel.swift
//  NewsApp
//
//  Created by ASamir on 8/2/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class SourcesViewModel: NSObject {
    public var errorModule = PublishSubject<ErrorModule>()
    public private(set) var objSourceRemoteObservable = PublishSubject<NewsSourceResponseModel>()
    private var disposeBag = DisposeBag()
    private var sourceRepo = NewsSourceRepository<NewsSourceResponseModel>()
    
    override init() {
        super.init()
        self.initializeSubscribers()
    }
    private func initializeSubscribers(){
        //GET LIST
        self.sourceRepo.objObservableRemoteData.asObservable().subscribe(onNext: { (sourceResponse) in
            self.objSourceRemoteObservable.onNext(sourceResponse)
        }, onError: {(error) in
        }, onCompleted: {
        }).disposed(by: self.disposeBag)
        
        self.sourceRepo.errorModule.asObservable().subscribe(onNext: { (err) in
            self.errorModule.onNext(err)
        }).disposed(by: disposeBag)
    }
    // call api
    func getSourceData(){
        self.sourceRepo.subscribeToAPI(url: NewsConstants.DEFAULT_SOURCES_URL,method:.get)
    }
}

