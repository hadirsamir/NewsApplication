//
//  NewsListHeaderTableViewCell.swift
//  NewsApp
//
//  Created by ASamir on 7/30/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import UIKit

class NewsListHeaderTableViewCell: UITableViewHeaderFooterView {
    @IBOutlet weak var headerLabel : UILabel!
    @IBOutlet weak var filterBtn : UIButton!
    @IBOutlet weak var headerMainView : UIView!
    weak var delegate : showPopUpDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.headerMainView.setCornerReduis()

    }
// show pop up delaegate function
    @IBAction func showPobUpAction(){
        self.delegate!.showPobUpView()
    }
    
}
