//
//  HomeViewController.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 1.3.22..
//

import UIKit

class HomeViewController: UIViewController
{

    let account = ["Account 1", "Account 2", "Account 3"]
    let segment = ["Transactions", "Stats"]
    @IBOutlet weak var accountsCV: UICollectionView!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.backgroundColor = .backgroundGrey
        // Do any additional setup after loading the view.
        accountsCV.backgroundColor = UIColor.backgroundGrey
        let ind =  IndexPath(item: 0, section: 0)
        self.accountsCV.selectItem(at:ind, animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
    }
    
    
    

    @IBAction func openSettings(_ sender: Any)
    {
        
    }
}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return account.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if indexPath.item == account.count
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddCell", for: indexPath) as! AddCell
            return cell
        }
        else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountCell", for: indexPath) as! AccountCell
            cell.set(text: account[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if indexPath.item == account.count
        {
           // collectionView.sizeToFit()
            return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
           
        }
        else
        {
            return CGSize(width: getCellWidth(for: account[indexPath.item]) + 15, height: collectionView.frame.height)
        }
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
        print("CLICK \(indexPath.item)")

        
    }
    
    func getCellWidth(for text: String)-> CGFloat
    {
        let attributedString = NSAttributedString(string: text, attributes: [.font: UIFont.systemFont(ofSize: 18)])
        let size = attributedString.size()
        
        return size.width
    }
}
