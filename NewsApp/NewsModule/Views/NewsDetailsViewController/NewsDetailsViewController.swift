//
//  NewsDetailsViewController.swift
//  NewsApp
//
//  Created by ASamir on 7/31/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var headlineLabel : UILabel!
    @IBOutlet weak var urlLablel     : UILabel!
    @IBOutlet weak var authorLabel   : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    //MARK:- Objects
    var newsObject : NewsArticleModel = NewsArticleModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News Details"
        setObjectData()
    }
    // set data in detailsVC from NewsObject on Navigation by did select row of cell in newsTable in NewsVc
    func setObjectData(){
        self.headlineLabel.text = newsObject.title
        self.descriptionLabel.text = newsObject.description
        self.authorLabel.text  = "Author: " + newsObject.author
        self.urlLablel.text    = newsObject.url
    }
    
}
