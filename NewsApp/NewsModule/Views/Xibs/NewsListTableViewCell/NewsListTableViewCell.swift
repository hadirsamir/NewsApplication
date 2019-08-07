//
//  NewsListTableViewCell.swift
//  NewsApp
//
//  Created by ASamir on 7/30/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {
    @IBOutlet weak var headlineLabel : UILabel!
    @IBOutlet weak var publishDateLabel : UILabel!
    @IBOutlet weak var newsImage : UIImageView!
    @IBOutlet weak var cellMainView : UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.cellMainView.setCornerReduis()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
