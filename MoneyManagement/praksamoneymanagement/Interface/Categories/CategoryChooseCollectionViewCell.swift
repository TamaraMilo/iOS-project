//
//  CategoryChooseCollectionViewCell.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 03/03/2022.
//

import UIKit

protocol  CategoryChooseCellDelegate : AnyObject
{
    func deleteCategory(cell: CategoryChooseCollectionViewCell)
}
class CategoryChooseCollectionViewCell: UICollectionViewCell
{
  
    var isCustom : Bool?

    var indexInCategories : Int?
    
    weak var delegate : CategoryChooseCellDelegate?

    @IBOutlet weak var deleteBtn_c: NSLayoutConstraint!
    @IBOutlet weak var imageLeft_c: NSLayoutConstraint!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var nameOfCategory: UILabel!
    

    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        nameOfCategory.font = UIFont.systemFont(ofSize: 17)
        nameOfCategory.textColor  = .darkGray
        cellImage.tintColor = .darkGray
        
        self.backgroundColor = UIColor.backgroundGrey
    
        cellImage.tintColor = .darkGray
        
        deleteBtn.setTitle("", for: .normal)
        deleteBtn.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        deleteBtn.tintColor = .red
        
        let leftSwipeGesture  = UISwipeGestureRecognizer(target: self, action: #selector(swipeRecognized(_ :)))
        leftSwipeGesture.direction = .left
        self.addGestureRecognizer(leftSwipeGesture)
        let rightSwipeGesture  = UISwipeGestureRecognizer(target: self, action: #selector(swipeRecognized(_ :)))
        rightSwipeGesture.direction = .right
        self.addGestureRecognizer(rightSwipeGesture)
        
    }
    @IBAction func deleteBtn(_ sender: Any)
    {
        if indexInCategories != nil
        {
            delegate?.deleteCategory(cell: self)
        }
    }
    
    
    
    @objc func swipeRecognized(_ gesture: UISwipeGestureRecognizer)
    {
        if isCustom == true
        {
            if gesture.direction == .left
            {
                imageLeft_c.constant = -50
                deleteBtn_c.constant = -50
                self.layoutIfNeeded()
            }
            else
            {
                imageLeft_c.constant = 5
                deleteBtn_c.constant = 0
            }
        }
    
    }
    
    func set(text: String, image: String, isCustom: Bool, index: Int)
    {
        nameOfCategory.text = text
        cellImage.image = UIImage(systemName: image)
        self.isCustom = isCustom
        indexInCategories = index
    }

}

