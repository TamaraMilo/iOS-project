//
//  ColorsCollectionViewCell.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 08/03/2022.
//

import UIKit



class ColorsCollectionViewCell: UICollectionViewCell
{
    
    var index: Int!
    
    weak var delegate: InnerColectinViewCellDelegate?

    @IBOutlet weak var innerCollectionView: UICollectionView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        
        innerCollectionView.delegate = self
        innerCollectionView.dataSource = self
        nameLbl.textColor = .primaryColor
        self.backgroundColor = .backgroundGrey
        innerCollectionView.backgroundColor = .backgroundGrey
        
    }
    
}

extension   ColorsCollectionViewCell : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if index == 1
        {
            return AppController.controller.colors.count + 1
        }
        else
        {
            return AppController.controller.icons.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InnerCollectionViewCell", for: indexPath) as! InnerCollectionViewCell
        if index == 1
        {
            if indexPath.item == 0
            {
                cell.setImage(imageName: "plus.circle", imageColor: "000000")
            }
            else
            {
                cell.setImage(imageName: "circle.fill", imageColor: AppController.controller.colors[indexPath.item - 1])
            }
        }
        else
        {
            cell.setImage(imageName: AppController.controller.icons[indexPath.item], imageColor: "000000")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 35, height: 35)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath) as? InnerCollectionViewCell
        
        if index == 1
        {
            if indexPath.item == 0
            {
                
                let picker = UIColorPickerViewController()
                delegate?.showPicker(picker: picker)
                delegate?.innerCell(change: picker.selectedColor.hexString ?? "000000", index: index)
                
            }
            else
            {
                delegate?.innerCell(change:  AppController.controller.colors[indexPath.item-1], index: index)
                cell?.setSelection(selected: true)
            }
        }
        else
        {
            delegate?.innerCell(change: AppController.controller.icons[indexPath.item], index: index)
            cell?.setSelection(selected: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    {
        (collectionView.cellForItem(at: indexPath) as? InnerCollectionViewCell)?.setSelection(selected: false)
    }
    func setName(name: String)
    {
        nameLbl.text = name
    }
    func setIndex(_ indexNum: Int)
    {
        index = indexNum
    }
}


