//
//  Account+CoreDataProperties.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 01/03/2022.
//
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var name: String?
    @NSManaged public var currency: String?
    @NSManaged public var balance: Double
    @NSManaged public var id: UUID?
    @NSManaged public var transaction: NSSet?

}

// MARK: Generated accessors for transaction
extension Account {

    @objc(addTransactionObject:)
    @NSManaged public func addToTransaction(_ value: Transaction)

    @objc(removeTransactionObject:)
    @NSManaged public func removeFromTransaction(_ value: Transaction)

    @objc(addTransaction:)
    @NSManaged public func addToTransaction(_ values: NSSet)

    @objc(removeTransaction:)
    @NSManaged public func removeFromTransaction(_ values: NSSet)

}

extension Account : Identifiable {

}
