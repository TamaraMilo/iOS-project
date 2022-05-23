//
//  AfterNDays+CoreDataProperties.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 01/03/2022.
//
//

import Foundation
import CoreData


extension AfterNDays {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AfterNDays> {
        return NSFetchRequest<AfterNDays>(entityName: "AfterNDays")
    }

    @NSManaged public var days: Int32
    @NSManaged public var id: UUID?
    @NSManaged public var repeatTransaction: NSSet?

}

// MARK: Generated accessors for repeatTransaction
extension AfterNDays {

    @objc(addRepeatTransactionObject:)
    @NSManaged public func addToRepeatTransaction(_ value: Repeat)

    @objc(removeRepeatTransactionObject:)
    @NSManaged public func removeFromRepeatTransaction(_ value: Repeat)

    @objc(addRepeatTransaction:)
    @NSManaged public func addToRepeatTransaction(_ values: NSSet)

    @objc(removeRepeatTransaction:)
    @NSManaged public func removeFromRepeatTransaction(_ values: NSSet)

}

extension AfterNDays : Identifiable {

}
