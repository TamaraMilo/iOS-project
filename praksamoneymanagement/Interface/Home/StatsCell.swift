//
//  StatsCell.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 9.3.22..
//

import UIKit

class StatsCell: UICollectionViewCell
{
    @IBOutlet weak var statsImage: UIImageView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    @IBOutlet weak var percentageLbl: UILabel!
    
    func set(text: String, text1: String, imageName: String , imageColor: String, percentage: String)
    {
        categoryNameLbl.text = text
        percentageLbl.text = "%" + text1
        statsImage.image = UIImage(systemName: imageName)
        statsImage.tintColor = UIColor.hexStringToUIColor(hex: imageColor)
        percentageLbl.text = percentage
    }
}

