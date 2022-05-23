//
//  TransactionCell.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 4.3.22..
//

import UIKit

class TransactionCell: UICollectionViewCell
{
    @IBOutlet weak var imageTransaction: UIImageView!
    @IBOutlet weak var transactionNameLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var imageIncomeArrow: UIImageView!
    @IBOutlet weak var swipeDeleteBtn: UIButton!
    @IBOutlet weak var deleteBtnLeft_c: NSLayoutConstraint!
    
    @IBAction func deleteCell(_ sender: Any)
    {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "DeleteTransactionCell"), object: self)
    }
    
    @IBOutlet weak var leftImageReference: NSLayoutConstraint!
    /*@IBAction func deleteSwipeDetected(_ sender: Any)
    {
        print("Swipe detected!")
    }*/
    
    func set(text: String, text1: String, isIncome: Bool)
    {
        transactionNameLbl.text = text
        amountLbl.text = "$" + text1
        if(isIncome == true)
        {
            imageIncomeArrow.image = UIImage(systemName: "arrow.up")
        }
        else
        {
            imageIncomeArrow.image = UIImage(systemName: "arrow.down")
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        transactionNameLbl.font = UIFont.boldSystemFont(ofSize: 16)
        transactionNameLbl.textColor = UIColor.black
    
        amountLbl.font = UIFont.systemFont(ofSize: 16)
        amountLbl.textColor = UIColor.black
        //transactionNameLbl.layer.masksToBounds = true
       // self.backgroundColor = .clear
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeRecognized(_:)))
        swipeGesture.direction = .left
        self.addGestureRecognizer(swipeGesture)
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeRecognized(_:)))
        rightSwipeGesture.direction = .right
        self.addGestureRecognizer(rightSwipeGesture)
    }
    
    @objc func swipeRecognized(_ gesture: UISwipeGestureRecognizer)
    {
        if(gesture.direction == .left)
        {
       // print("SWIPE")
        leftImageReference.constant = -50
        deleteBtnLeft_c.constant = -50
        self.layoutIfNeeded()
        }
        else
        {
            leftImageReference.constant = 0
            deleteBtnLeft_c.constant = 0
            self.layoutIfNeeded()
        }
    }
}
