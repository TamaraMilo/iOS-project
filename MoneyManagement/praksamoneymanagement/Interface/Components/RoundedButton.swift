//
//  RoundedButton.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 1.3.22..
//

import UIKit

class RoundedButton: UIButton
{
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.height * 0.5
    }
}
