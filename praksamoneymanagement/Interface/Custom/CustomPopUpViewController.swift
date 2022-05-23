//
//  CustomPopUpViewController.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 01/03/2022.
//

import UIKit

class CustomPopUpViewController: UIViewController
{
    @IBOutlet weak var containerViewBottom_c: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bgdView: UIView!
    
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(close))
        bgdView.addGestureRecognizer(tapGesture)
        bgdView.isUserInteractionEnabled = true
    }
    
    @objc func close()
    {
        self.dismiss(animated: true, completion: nil)
    }
    

    @objc func keyboardWillShow(_ notification: Notification)
   {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            containerViewBottom_c.constant = keyboardHeight
            
            
            
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()
            }
        }
   }
    
    @objc func keyboardWillHide(_ notification: Notification )
    {
            containerViewBottom_c.constant = 0
            UIView.animate(withDuration: 0.2) {
                self.view.layoutIfNeeded()

        }
    }
    
    // Implementation for Done button on numeric keyboard
    func addDoneButtonOnNumpad(textField: UITextField) {
            
        let keypadToolbar: UIToolbar = UIToolbar()
            
        let done = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: textField, action: #selector(UITextField.resignFirstResponder))
        done.tintColor = .primaryColor
        keypadToolbar.items=[
            done,
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        ]
        keypadToolbar.sizeToFit()

        textField.inputAccessoryView = keypadToolbar
    }
    
//    func embed(embededVC: UIViewController)
//    {
//        self.addChild(embededVC)
//        containerView.addSubview(embededVC.view)
//        
//        embededVC.view.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint(item: embededVC.view!, attribute: .top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: embededVC.view!, attribute: .bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: containerView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: embededVC.view!, attribute: .right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: containerView, attribute: .right, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint(item: embededVC.view!, attribute: .left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: containerView, attribute: .left, multiplier: 1, constant: 0).isActive = true
//        embededVC.didMove(toParent: self)
//    }
}
