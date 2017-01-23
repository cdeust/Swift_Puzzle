//
//  Date+Format.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation

extension Date {
    
    public func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "ddMMyyyy"
        let formattedString = formatter.string(from: date)
        return formattedString
    }
    
    public func formatString(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "ddMMyyyy"
        let formattedDate = formatter.date(from: string)
        return formattedDate!
    }
}
