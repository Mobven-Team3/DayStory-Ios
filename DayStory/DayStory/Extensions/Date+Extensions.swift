//
//  Date+Extensions.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 6.06.2024.
//

import Foundation

extension Date {
    func toString(format: String = "dd-MM-yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
