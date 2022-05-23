//
//  Transaction+CoreDataClass.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 8.3.22..
//
//

import Foundation
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject {

    
    convenience init()
    {
        self.init(context: AppController.controller.persistentContainer.viewContext)
        
        name = ""
        amount = 0.0
        transactionDate = Date()
        dueDate = Date().addingTimeInterval(86400)
        transactionType = "income"
        id = UUID()
    }
    
    func save()
    {
//        let new = Transaction(context: AppController.controller.persistentContainer.viewContext)
//        new.name = self.name
//        new.amount = self.amount
//        new.transactionDate = self.transactionDate
//        new.transactionType = self.transactionType
//        new.id = self.id
//        new.category = self.category
//        new.repeatTransaction = self.repeatTransaction
//        new.account = self.account
//
        AppController.controller.saveContext()
    }
}
