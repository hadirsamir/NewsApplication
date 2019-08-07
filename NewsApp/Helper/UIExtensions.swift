//
//  UIExtensions.swift
//  NewsApp
//
//  Created by ASamir on 8/5/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import Foundation
import UIKit
//UIButton extension
extension UIButton{
    func setBtnImage(btnImage:String){
        let image = UIImage(named: btnImage)
        self.setImage(image, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = 11
        
    }
    
}
//UIView extension
extension UIView{
    func setCornerReduis()  {
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
    }
}
