//
//  NewCategoryCollectionViewCell.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 07/03/2022.
//

import UIKit
protocol NameFieldCellDelegate: AnyObject
{
    func fieldCell(_ fieldCell: NameCategoryCollectionViewCell, textDidChangeTo text: String)
}

class NameCategoryCollectionViewCell: UICollectionViewCell
{
    
    weak var delegate: NameFieldCellDelegate?
   
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lbl: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        lbl.textColor = .primaryColor
        lbl.text = "Name"
        
        self.backgroundColor = .backgroundGrey
        
        nameField.textColor = .black
        nameField.delegate = self
        
   
    }
    

}


extension NameCategoryCollectionViewCell : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        delegate?.fieldCell(self, textDidChangeTo: textField.text ?? "")
        return true
    }
}
