//
//  Category+CoreDataClass.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 4.3.22..
//
//

import Foundation
import CoreData

@objc(Category)
public class Category: NSManagedObject {

    func saldo()-> (Double, Double)
    {
        var incomeSaldo: Double = 0
        var expenseSaldo: Double = 0
        
        if let transactions = self.transaction?.allObjects as? [Transaction]
        {
            for _transcastion in transactions
            {
                if _transcastion.isIncome
                {
                    incomeSaldo += _transcastion.amount
                }
                else
                {
                    expenseSaldo -= _transcastion.amount
                }
            }
        }
        return (incomeSaldo, expenseSaldo)
    }
    
    
    convenience init()
        {
            self.init(context: AppController.controller.persistentContainer.viewContext)
            
            isCustom = false
            id = UUID()
            name = ""
        }
        
        func save()
        {
    //        let new = Category(context: AppController.controller.persistentContainer.viewContext)
    //        new.name = self.name
    //        new.isCustom = self.isCustom
    //        new.id = self.id
    //        new.icon = self.icon
    //        new.color = self.color
    //        new.transaction = self.transaction
            
            AppController.controller.saveContext()
        }
}
