//
//  OnMonthDay+CoreDataProperties.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 1  on 01/03/2022.
//
//

import Foundation
import CoreData


extension OnMonthDay {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OnMonthDay> {
        return NSFetchRequest<OnMonthDay>(entityName: "OnMonthDay")
    }

    @NSManaged public var date: Int32
    @NSManaged public var id: UUID?
    @NSManaged public var repeatTransaction: NSSet?

}

// MARK: Generated accessors for repeatTransaction
extension OnMonthDay {

    @objc(addRepeatTransactionObject:)
    @NSManaged public func addToRepeatTransaction(_ value: Repeat)

    @objc(removeRepeatTransactionObject:)
    @NSManaged public func removeFromRepeatTransaction(_ value: Repeat)

    @objc(addRepeatTransaction:)
    @NSManaged public func addToRepeatTransaction(_ values: NSSet)

    @objc(removeRepeatTransaction:)
    @NSManaged public func removeFromRepeatTransaction(_ values: NSSet)

}

extension OnMonthDay : Identifiable {

}
