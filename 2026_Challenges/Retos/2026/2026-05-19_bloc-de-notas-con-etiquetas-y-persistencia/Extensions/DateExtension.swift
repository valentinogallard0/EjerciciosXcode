//
//  DateExtension.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 20/05/26.
//

import Foundation

extension Date {
    func shortDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: self)
    }
}
