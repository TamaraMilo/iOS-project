//
//  AccountCell.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 2.3.22..
//

import UIKit

class AccountCell: UICollectionViewCell
{
    @IBOutlet weak var nameLbl: UILabel!
    
    override var isSelected: Bool
    {
        didSet
        {
            setupSelected(selected: isSelected)
        }
    }
    
    func set(text: String)
    {
        nameLbl.text = text
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        
        nameLbl.font = UIFont.systemFont(ofSize: 18)
        nameLbl.textColor = UIColor.black
        nameLbl.layer.masksToBounds = true
        self.backgroundColor = .clear
    }
    
    func setupSelected(selected: Bool)
    {
        if selected
        {
            nameLbl.textColor = UIColor.primaryColor
            nameLbl.backgroundColor = UIColor.white
            nameLbl.layer.cornerRadius = 10
        }
        else
        {
            nameLbl.textColor = UIColor.black
            nameLbl.backgroundColor = .clear
        }
    }
}
