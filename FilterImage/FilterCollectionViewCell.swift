//
//  FilterCollectionViewCell.swift
//  VideoFilters
//
//  Created by Viet Le on 12/14/19.
//  Copyright © 2019 Solar. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var unTitleImageView: UIImageView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.isHidden = true
        self.layer.cornerRadius = 3
    }
    
    func showTickMark() {
        colorView.isHidden = false
        name.textColor = .white
        bottomView.backgroundColor = UIColor.init(rgb: 0x6F4FEE)
    }
    
    func hideTickMark() {
        colorView.isHidden = true
        name.textColor = UIColor.black.withAlphaComponent(0.54)
        bottomView.backgroundColor = .white
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
