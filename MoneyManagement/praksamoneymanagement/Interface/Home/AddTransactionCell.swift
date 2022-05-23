//
//  AddTransactionCell.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 7.3.22..
//

import UIKit

class AddTransactionCell: UICollectionViewCell
{
  
    @IBOutlet weak var bgdView: UIView!
    @IBOutlet weak var addTransactionImg: UIImageView!
   // @IBOutlet weak var bgdView: UIView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        addTransactionImg.tintColor = .white
        addTransactionImg.backgroundColor = .primaryColor
        //bgdView.backgroundColor = UIColor.white

    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        self.bgdView.layer.cornerRadius = self.bounds.height * 0.5
        
    }
}
