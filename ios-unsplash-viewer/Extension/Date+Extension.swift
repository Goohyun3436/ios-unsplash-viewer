//
//  Date+Extension.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/19/25.
//

import Foundation

extension Date {
    
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    func toStringKST(format: String) -> String {
        return self.toString(dateFormat: format)
    }
    
}
