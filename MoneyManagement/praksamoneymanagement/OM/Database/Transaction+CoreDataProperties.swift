//
//  Transaction+CoreDataProperties.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 8.3.22..
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var amount: Double
    @NSManaged public var dueDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var transactionDate: Date?
    @NSManaged public var transactionType: String?
    @NSManaged public var isIncome: Bool
    @NSManaged public var account: Account?
    @NSManaged public var category: Category?
    @NSManaged public var repeatTransaction: Repeat?

}

extension Transaction : Identifiable {

}
