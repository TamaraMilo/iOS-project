//
//  Date.swift
//  praksamoneymanagement
//
//  Created by Webelinx Praksa 2 on 11.3.22..
//

import Foundation

extension Date {

    var year: Int { Calendar.current.component(.year, from: self) }
    var month: Int { Calendar.current.component(.month, from: self) }

    var numberOfdaysInMonth: Int
    {
        let range = Calendar.current.range(of: .day, in: .month, for: self)!
        let numDays = range.count
        print(numDays) // 31
        return numDays
    }
}
