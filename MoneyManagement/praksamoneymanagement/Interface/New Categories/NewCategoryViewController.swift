//
//  NewCategoryViewController.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 04/03/2022.
//

import UIKit
import CoreData


class NewCategoryViewController: CustomPopUpViewController
{


   
    @IBOutlet weak var newCategoryLbl: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    var category = Category()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //category = Category()
        
        self.view.layer.cornerRadius = 20

        okButton.setTitle("", for: .normal)
        okButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        okButton.tintColor = .primaryColor
        
        newCategoryLbl.text = "New Category"
        newCategoryLbl.font = UIFont.boldSystemFont(ofSize: 18)
        newCategoryLbl.textColor = .primaryColor
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @IBAction func ok(_ sender: Any)
    {
        category.isCustom = true
        category.save()
        
        NotificationCenter.default.post(name: NSNotification.Name("UpdateCategories"), object: nil)
        
        self.dismiss(animated: true, completion: nil)
    }
  
}

extension NewCategoryViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if indexPath.item == 0
        {
            let cell =
                collectionView.dequeueReusableCell(withReuseIdentifier: "NameCategoryCollectionViewCell", for: indexPath) as! NameCategoryCollectionViewCell
            cell.delegate = self
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorsCollectionViewCell", for: indexPath) as! ColorsCollectionViewCell
            cell.setIndex(indexPath.item)
            if indexPath.item == 1
            {
                cell.setName(name: "Color")
                cell.delegate = self
                
            }
            else
            {
                cell.setName(name: "Icon")
                cell.delegate = self
            }
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if indexPath.item == 0
        {
            return CGSize(width: collectionView.frame.width, height: 60)
        }
        else
        {
            return CGSize(width: collectionView.frame.width, height: 200)
        }
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    
}

extension NewCategoryViewController: NameFieldCellDelegate
{
    func fieldCell(_ fieldCell: NameCategoryCollectionViewCell, textDidChangeTo text: String)
    {
        category.name = text
        
    }
}
extension NewCategoryViewController: InnerColectinViewCellDelegate
{
    func innerCell( change: String, index: Int)
    {
        if index == 1
        {
            category.color = change
          
        }
        else
        {
            category.icon = change
      
        }
    }
    
    func showPicker(picker: UIColorPickerViewController)
    {
        self.present(picker, animated: true, completion: nil)
   
    }
    
}

