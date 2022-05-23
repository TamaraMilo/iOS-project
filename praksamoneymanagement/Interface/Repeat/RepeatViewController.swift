//
//  RepeatViewController.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 14/03/2022.
//

import UIKit
import SwiftUI
class RepeatViewController: CustomPopUpViewController
{

    let cells = ["Never", "After N days", "On day in month", "On day in weak"]
    
    
    
    @IBOutlet weak var AfterNDays: UIView!
    @IBOutlet weak var ANDTextField: UITextField!
    @IBOutlet weak var ANDForeverlbl: UILabel!
    @IBOutlet weak var ANDRepeatLbl: UILabel!
    
    @IBOutlet weak var descriptLbl: UILabel!
    @IBOutlet weak var repeatLbl: UILabel!
    @IBOutlet weak var okBtn: UIButton!
    
    @IBOutlet weak var repeatPicker: UIPickerView!
    
    @IBAction func okPressed(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.clipsToBounds = true
        self.view.layer.cornerRadius = 20
        self.view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        okBtn.setTitle("", for: .normal)
        okBtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        okBtn.tintColor = .primaryColor
        okBtn.backgroundColor = .lightPurple
        okBtn.layer.cornerRadius = 20
        
        repeatLbl.text  = "Repeat"
        repeatLbl.textColor = .primaryColor
        repeatLbl.textAlignment = .center
        repeatLbl.font = UIFont.systemFont(ofSize: 20)
        
        descriptLbl.text = "Do not repeat this transaction."
        descriptLbl.textColor = .primaryColor
        descriptLbl.font = UIFont.systemFont(ofSize: 18)
        descriptLbl.layer.masksToBounds = true
        descriptLbl.layer.cornerRadius = 8
        descriptLbl.textAlignment = .center
        
        AfterNDaysSet()
        
        
        
    }

    
    func AfterNDaysSet()
    {
        AfterNDays.isHidden = true
        
        ANDRepeatLbl.text = "Repeat in days:"
        ANDRepeatLbl.textColor = .primaryColor
        ANDRepeatLbl.font = UIFont.systemFont(ofSize: 18)
        
        ANDForeverlbl.text = "Forever"
        ANDForeverlbl.textColor = .primaryColor
        ANDForeverlbl.font = UIFont.systemFont(ofSize: 18)
        
        ANDTextField.keyboardType = .numberPad
        addDoneButtonOnNumpad(textField: ANDTextField)
        
        
    }
}

extension RepeatViewController : UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return cells.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) ->    CGFloat
    {
        return 200
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 40.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let label = UILabel()
        label.text = cells[row]
        label.textAlignment = .center
        label.textColor = .primaryColor
        label.font = UIFont.systemFont(ofSize: 25)
        pickerView.backgroundColor = .lightPurple
        pickerView.layer.cornerRadius = 10
        pickerView.layer.masksToBounds = true
        return label
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        switch row
        {
        case 0:
            descriptLbl.text = "Do not repeat this transaction."
            AfterNDays.isHidden = true
        case 1:
            descriptLbl.text = "After how many days do you wish this transaction to be repeated?"
            AfterNDays.isHidden = false
        case 2:
            descriptLbl.text = "On which days in month do you wish this transaction to be repeated?"
            AfterNDays.isHidden = true
        case 3:
            descriptLbl.text = "On which weekday do you wish this transaction to be repeated?"
            AfterNDays.isHidden = true
        default:
            descriptLbl.text = ""
        }
        





    }
    
}
