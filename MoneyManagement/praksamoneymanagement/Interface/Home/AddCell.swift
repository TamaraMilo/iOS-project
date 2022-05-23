//
//  AddCell.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 2.3.22..
//

import UIKit

class AddCell: UICollectionViewCell
{
    @IBOutlet weak var plusImage: UIImageView!
    @IBOutlet weak var bgdView: UIView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        bgdView.backgroundColor = UIColor.white
        
        //self.backgroundColor = UIColor.white
        //self.layer.cornerRadius = self.bounds.height * 0.5
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        bgdView.layer.cornerRadius = bgdView.frame.height * 0.5
    }
}
