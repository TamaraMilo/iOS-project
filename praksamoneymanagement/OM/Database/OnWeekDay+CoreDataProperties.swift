//
//  OnWeekDay+CoreDataProperties.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 10.3.22..
//
//

import Foundation
import CoreData


extension OnWeekDay {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OnWeekDay> {
        return NSFetchRequest<OnWeekDay>(entityName: "OnWeekDay")
    }

    @NSManaged public var date: String?
    @NSManaged public var id: UUID?
    @NSManaged public var repeatTransaction: NSSet?

}

// MARK: Generated accessors for repeatTransaction
extension OnWeekDay {

    @objc(addRepeatTransactionObject:)
    @NSManaged public func addToRepeatTransaction(_ value: Repeat)

    @objc(removeRepeatTransactionObject:)
    @NSManaged public func removeFromRepeatTransaction(_ value: Repeat)

    @objc(addRepeatTransaction:)
    @NSManaged public func addToRepeatTransaction(_ values: NSSet)

    @objc(removeRepeatTransaction:)
    @NSManaged public func removeFromRepeatTransaction(_ values: NSSet)

}

extension OnWeekDay : Identifiable {

}
