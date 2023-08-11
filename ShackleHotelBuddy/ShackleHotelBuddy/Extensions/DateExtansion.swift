//
//  DateExtansion.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/6/23.
//

import Foundation

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> Int {
        return calendar.dateComponents(Set(components), from: self).hashValue
    }
}
