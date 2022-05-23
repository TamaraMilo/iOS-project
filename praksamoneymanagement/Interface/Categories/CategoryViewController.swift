//
//  CollectionViewController.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 03/03/2022.
//

import UIKit
import CoreData

class CategoryViewController: UIViewController
{
    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var categoryChooseCollectionView: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    
    var transaction: Transaction?
    
    lazy var categories: [Category] =
    {
        var _categories = [Category]()
        do
        {
            _categories = try AppController.controller.persistentContainer.viewContext.fetch(Category.fetchRequest())
                
        }
        catch{}
        return _categories
    }()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        addButton.setTitle("Add", for: .normal)
        addButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        addButton.semanticContentAttribute = .forceLeftToRight
        addButton.tintColor = UIColor.primaryColor
        addButton.setTitleColor(.primaryColor, for: .normal)
        addButton.backgroundColor = UIColor.lightPurple
        
        
        okButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        okButton.tintColor = .primaryColor
        okButton.setTitle("", for: .normal)
        okButton.backgroundColor = UIColor.lightPurple
        
        categoryLbl.text = "Category"
        categoryLbl.font = UIFont.boldSystemFont(ofSize: 22)
        categoryLbl.textColor = .black
        
        addButton.layer.cornerRadius = 40 * 0.5
        okButton.layer.cornerRadius = 40 * 0.5
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(UpdateCategories(_:)), name: Notification.Name("UpdateCategories"), object: nil)
   
      
    }
    
    @objc func UpdateCategories(_ notification: Notification)
    {
        do{
            categories = try AppController.controller.persistentContainer.viewContext.fetch(Category.fetchRequest())
            print(categories)
            categoryChooseCollectionView.performBatchUpdates
            {
                let indexPath =
                    [IndexPath(item: categories.count - 1, section: 0)]
                self.categoryChooseCollectionView.insertItems(at: indexPath)
            } completion: { (_) in

            }

        }
        catch{}
    }
    
    @IBAction func closeView(_ sender: Any)
    {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func newCategory(_ sender: Any)
    {
        if let vc = self.storyboard?.instantiateViewController(identifier: "NewCategoryViewController") as? NewCategoryViewController
        {
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }

}

extension CategoryViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryChooseCollectionViewCell", for: indexPath) as! CategoryChooseCollectionViewCell
        let category = categories[indexPath.item]
        cell.set(text: category.name ?? "category" , image: category.icon ?? "square", isCustom: category.isCustom, index: indexPath.item)
        cell.delegate = self
        return cell
    }
  
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        transaction?.category = categories[indexPath.item]
        //self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name("UpdateTransactionNotification"), object: nil)
  
        let cell = collectionView.cellForItem(at:  indexPath) as! CategoryChooseCollectionViewCell
        cell.nameOfCategory.textColor = UIColor.hexStringToUIColor(hex: categories[indexPath.item].color ?? "000000")
        cell.cellImage.tintColor = UIColor.hexStringToUIColor(hex: categories[indexPath.item].color ?? "000000")
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at:  indexPath) as! CategoryChooseCollectionViewCell
        cell.nameOfCategory.textColor = .darkGray
        cell.cellImage.tintColor = .darkGray
    }

}
extension CategoryViewController : CategoryChooseCellDelegate
{
    func deleteCategory(cell: CategoryChooseCollectionViewCell)
    {
        if cell.isCustom == true
        {
            if let index = categoryChooseCollectionView.indexPath(for: cell)
            {
                cell.imageLeft_c.constant = 5
                cell.deleteBtn_c.constant = 0
                cell.cellImage.tintColor = .darkGray
                categoryChooseCollectionView.deleteItems(at: [index])
                
                AppController.controller.deleteContext(obj: categories[index.item])
                categories.remove(at: index.item)
                categoryChooseCollectionView.performBatchUpdates(nil, completion: nil)
                AppController.controller.saveContext()
            }
        }
//
        
    }
}
