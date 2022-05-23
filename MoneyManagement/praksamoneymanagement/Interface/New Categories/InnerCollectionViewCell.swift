//
//  InnerCollectionViewCell.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 08/03/2022.
//

import UIKit
protocol InnerColectinViewCellDelegate: AnyObject
{
    func innerCell(change: String, index: Int)
    
    func showPicker(picker: UIColorPickerViewController)
    
}
class InnerCollectionViewCell: UICollectionViewCell
{

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var selectImage: UIImageView!

    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.backgroundColor = .backgroundGrey
        

        
    }
    
    func setImage(imageName: String, imageColor: String)
    {
        image.image = UIImage(systemName: imageName)
        image.tintColor = UIColor.hexStringToUIColor(hex: imageColor)
    }
    func setSelection(selected: Bool)
    {
        
        selectImage.image = UIImage(systemName: "circle")
        selectImage.tintColor = .black
        selectImage.isHidden = !selected
    }

}


