//
//  CategoryCell.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 3.3.22..
//

import UIKit

class CategoryCell: UICollectionViewCell
{
    @IBOutlet weak var categoryNameLbl: UILabel!
    
    override var isSelected: Bool
    {
        didSet
        {
            setupSelected(selected: isSelected)
        }
    }
    
    func set(text: String)
    {
        categoryNameLbl.text = text
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        categoryNameLbl.font = UIFont.systemFont(ofSize: 12)
        categoryNameLbl.textColor = UIColor.black
        categoryNameLbl.layer.masksToBounds = true
        self.backgroundColor = .clear
    }

    
   func setupSelected(selected: Bool)
    {
        if selected
        {
            
            categoryNameLbl.backgroundColor = .white
            categoryNameLbl.layer.cornerRadius = categoryNameLbl.bounds.height * 0.2
            categoryNameLbl.textColor = .primaryColor
        }
        else
        {
            categoryNameLbl.backgroundColor = .backgroundGrey
            categoryNameLbl.textColor = .black
        }
    }
    
}
