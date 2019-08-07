//
//  Delegates.swift
//  NewsApp
//
//  Created by ASamir on 7/30/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
// show popUp view Delegate function
protocol showPopUpDelegate : class{
    func showPobUpView()
}
// send data to NewsVc from pop up Delagate function
protocol sendDataToViewControllerDelegate : class {
    func sendDataToMainVC(filterType: FilterType,stringCode: String)
}
