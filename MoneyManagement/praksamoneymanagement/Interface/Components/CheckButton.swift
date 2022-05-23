//
//  CheckButton.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 11.3.22..
//

import UIKit

class CheckButton: UIButton
{
    var checkBox: UIButton!
    var label: UILabel!
    
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
        checkBox = UIButton()
        checkBox.isUserInteractionEnabled = false
        checkBox.layer.cornerRadius = 5

        self.addSubview(checkBox)
        checkBox.translatesAutoresizingMaskIntoConstraints = false

         
        NSLayoutConstraint(item: checkBox!, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: checkBox!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
         //NSLayoutConstraint(item: checkBox!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -15).isActive = true
        NSLayoutConstraint(item: checkBox!, attribute: .width, relatedBy: .equal, toItem: checkBox!, attribute: .height, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: checkBox!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20).isActive = true
        
        
        label = UILabel()
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint(item: label!, attribute: .left, relatedBy: .equal, toItem: checkBox!, attribute: .right, multiplier: 1, constant: 5).isActive = true
         NSLayoutConstraint(item: label!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0).isActive = true
         NSLayoutConstraint(item: label!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
         NSLayoutConstraint(item: label!, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -10).isActive = true
    }
}
