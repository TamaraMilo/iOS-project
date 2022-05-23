//
//  DateButton.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 1.3.22..
//

import UIKit

class DateButton: RoundedButton
{
  
    var iconImg: UIImageView!
    var dateLbl: UILabel!
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        customInit()
        
        
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        customInit()
        
    }
    
    private func customInit()
    {
        iconImg = UIImageView()
        iconImg.image = UIImage(systemName: "calendar")
        iconImg.tintColor = .primaryColor
        
        self.addSubview(iconImg)
        
        iconImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: iconImg!, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: iconImg!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: iconImg!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -5).isActive = true
        NSLayoutConstraint(item: iconImg!, attribute: .width, relatedBy: .equal, toItem: iconImg!, attribute: .height, multiplier: 1, constant: 0).isActive = true
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        
        let string = formatter.string(from: Date())
        
        dateLbl = UILabel()
        dateLbl.text = string
        dateLbl.textColor = .primaryColor
        dateLbl.font = UIFont.systemFont(ofSize: 14)
        
        self.addSubview(dateLbl)
        
        dateLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: dateLbl!, attribute: .left, relatedBy: .equal, toItem: iconImg!, attribute: .right, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: dateLbl!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: dateLbl!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: dateLbl!, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10).isActive = true
        
        self.backgroundColor = .lightPurple
    }
    
    
}
