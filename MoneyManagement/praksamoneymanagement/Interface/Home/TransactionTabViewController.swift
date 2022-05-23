//
//  TransactionTabViewController.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 4.3.22..
//

import UIKit

class TransactionTabViewController: UIViewController
{
    @IBOutlet weak var incomeSegmentedControl: CustomSegmentControl!
    @IBOutlet weak var transactionCategoryCV: UICollectionView!
    @IBOutlet weak var transactionListCV: UICollectionView!
    @IBOutlet weak var balanceLbl: UILabel!
    @IBOutlet weak var leftPerDayLbl: UILabel!
    
    var categories = [Category]()
    var transactions = [Transaction]() //Nema jos u bazi ali sam napravila kao da ima
    var filteredTransactionIndices = [Transaction]()
    var numberOfDaysLeft = 0// Napravi jedan case koji ce ovo da resava
    //var day = Calendar.current.dateComponents([.day], from: <#T##Date#>)
   
    
    //let formatter = DateFormatter()
    //formatter.dateFormat = "MMMM"
    //let string = formatter.string(from: Date())
    //let formatter = DateFormatter()
    //formatter.dateFormat = "MMMM yyyy"
    //let string = formatter.string(from: Date())
    
    //let date = Date()
    //let calendar = NSCalendar.current
    //let month = calendar.component(.month, from: date)

    enum TransactionFilter: Int
    {
        case all = -1
        case income = 0
        case expense = 1
    }
    
    var filter = TransactionFilter.all

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        do
        {
            categories = try AppController.controller.persistentContainer.viewContext.fetch(Category.fetchRequest())
        }
        catch{}
        
        let account = Account(context: AppController.controller.persistentContainer.viewContext)
        account.balance = 290
        
        let tr = Transaction(context: AppController.controller.persistentContainer.viewContext)
        tr.name = "Transaction name"
        tr.amount = 100.00
        tr.isIncome = true
        
        let tr2 = Transaction(context: AppController.controller.persistentContainer.viewContext)
        tr2.name = "Transaction name"
        tr2.amount = 50.00
        tr.isIncome = true

        let tr3 = Transaction(context: AppController.controller.persistentContainer.viewContext)
        tr3.name = "Transaction name"
        tr3.amount = 190.00
        tr3.isIncome = false
        
        transactions.insert(tr, at:0)
        transactions.insert(tr2, at: 1)
        transactions.insert(tr3, at: 2)
        
        filteredTransactionIndices = transactions
        
        //do
        //{
        //    transactions = try AppController.controller.persistentContainer.viewContext.fetch(Transaction.fetchRequest())
        //}
        //catch{}
       
        //let tr : Transaction
        
        
        //transactions.insert(<#T##newElement: Transaction##Transaction#>, at: <#T##Int#>)
        transactionCategoryCV.backgroundColor = .backgroundGrey

        //incomeSegmentedControl.layer.backgroundColor = UIColor.clear.cgColor
        incomeSegmentedControl.selectedSegmentTintColor = .primaryColor
        incomeSegmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        incomeSegmentedControl.selectedSegmentIndex = -1
        transactionCategoryCV.allowsMultipleSelection = true
        
        
        //let date = Date()
        //let calendar = Calendar.current
        //let day = calendar.component(.day, from: date)
        //let daysLeft = calendar.component(.month, from: date)

        let date = Date()

        let daysInMonth = date.numberOfdaysInMonth
        let currentDay = Calendar.current.component(.day, from: date)
        
        let leftDays = daysInMonth - currentDay
        let dayBalance = account.balance / Double(leftDays)
        
        balanceLbl.text = "$" + String(account.balance)
        leftPerDayLbl.text = "$" + String(dayBalance)
        
        
    }

    
    @IBAction func selectSegmentedCtrl(_ sender: Any)
    {
        if incomeSegmentedControl.selectedSegmentIndex == filter.rawValue && incomeSegmentedControl.selectedSegmentIndex != -1
        {
            filter = .all
            incomeSegmentedControl.selectedSegmentIndex = -1
        }
        else
        {
            filter = TransactionFilter(rawValue: incomeSegmentedControl.selectedSegmentIndex) ?? .all
        }

        switch filter
        {
        case .all:
            filteredTransactionIndices = transactions
        case .income:
            filteredTransactionIndices = transactions.filter({ _transaction in
                return _transaction.isIncome
            })
        case .expense:
            filteredTransactionIndices = transactions.filter({ _transaction in
                return !_transaction.isIncome
            })
        }
        
        transactionListCV.reloadData()
    }
    
    @objc func deleteCell(_ notification: Notification)
    {
        if let cell = notification.object as? TransactionCell
        {
            if let indexPath = transactionListCV.indexPath(for: cell)
            {
                transactionListCV.performBatchUpdates {
                    let removed = self.filteredTransactionIndices.remove(at: indexPath.item)
                    if let index = self.transactions.firstIndex(where: { _transaction in
                        return _transaction.id == removed.id
                    })
                    {
                        self.transactions.remove(at: index)
                    }
                    self.transactionListCV.deleteItems(at: [indexPath])
                } completion: { _ in
                    
                }
            }
        }
    }


}

extension TransactionTabViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == transactionCategoryCV
        {
            return categories.count
        }
        else
        {
            return filteredTransactionIndices.count + 1
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == transactionCategoryCV
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.set(text: categories[indexPath.item].name ?? "" )
            return cell
        }
        else
        {
            if indexPath.item == filteredTransactionIndices.count
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddTransactionCell", for: indexPath) as! AddTransactionCell
                return cell
            }
            else
            {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
                
                let transaction = filteredTransactionIndices[indexPath.item]
                cell.set(text: transaction.name ?? "" , text1: String(transaction.amount), isIncome: transaction.isIncome )
                    //Promeniti da bude kao u transakciji kada se doda!!!
                return cell
            }
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == transactionCategoryCV
        {
            if indexPath.item == categories.count + 1
            {
                return CGSize(width: collectionView.frame.height, height: collectionView.frame.height)
            }
            else
            {
                return CGSize(width: getCellWidth(for: categories[indexPath.item].name ?? "") , height: collectionView.frame.height)
            }
        }
        else
        {
            
            return CGSize(width: collectionView.frame.width , height: 50.0)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        if collectionView == transactionCategoryCV
        {
            return 10
        }
        else
        {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        if collectionView == transactionCategoryCV
        {
            return 10
        }
        else
        {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if collectionView == transactionCategoryCV
        {
            print("CLICK category \(indexPath.item)")
        }
        else
        {
            print("CLICK transaction \(indexPath.item)")
        }
    }
    func getCellWidth(for text: String)-> CGFloat
    {
        let attributedString = NSAttributedString(string: text, attributes: [.font: UIFont.systemFont(ofSize: 18)])
        let size = attributedString.size()
        
        return size.width
    }

}
