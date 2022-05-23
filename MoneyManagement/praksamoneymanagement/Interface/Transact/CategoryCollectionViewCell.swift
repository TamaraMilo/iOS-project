//
//  CategoryCollectionViewCell.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 02/03/2022.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    

    @IBOutlet weak var leftCategoryImage: UIImageView!
    @IBOutlet weak var rightCategoryImage: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        categoryLbl.font = UIFont.systemFont(ofSize: 18)
        categoryLbl.textColor = .primaryColor
        
        leftCategoryImage.image = UIImage(systemName: "square")
        leftCategoryImage.tintColor = UIColor.primaryColor
        
        rightCategoryImage.image = UIImage(systemName: "chevron.right")
        rightCategoryImage.tintColor = UIColor.primaryColor
        
        self.backgroundColor = UIColor.backgroundGrey
        
        
    }
}
