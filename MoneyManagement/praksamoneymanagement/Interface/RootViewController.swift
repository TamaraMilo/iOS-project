//
//  RootViewController.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 04/03/2022.
//

import UIKit

class RootViewController: UINavigationController
{

    static var shared: RootViewController?
    {
        return UIApplication.shared.windows[0].rootViewController as? RootViewController
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

}
