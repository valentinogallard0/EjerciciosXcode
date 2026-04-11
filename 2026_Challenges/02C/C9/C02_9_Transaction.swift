//
//  C02_9_Transaction.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 19/02/26.
//

import Foundation

struct C02_9_Transaction: Identifiable {
    let id: String
    let date: Date
    let merchant: String
    let category: Category
    let amount: Decimal
    let currency: Currency
    let status: Status
    let note: String?
}

enum Category: String, CaseIterable {
    case groceries, coffee, transport, subscriptions, eatingOut, shopping, utilities, unknown
}

enum Status: String {
    case posted, pending, reversed
}

enum Currency: String {
    case MXN, USD
}

extension C02_9_Transaction {
    var isPosted: Bool {
        self.status == .posted
    }
    
    var isExpense: Bool {
        self.amount > 0
    }
    
    var isHighValueMXN: Bool {
        self.currency == .MXN && self.isPosted && self.amount > 1000
    }
    
    var isSuspicious: Bool {
        if self.isHighValueMXN || (self.currency == .USD && self.isPosted && self.amount > 40) || (self.merchant.contains("Uber") && self.status == .pending) {
            return true
        } else { return false }
    }
}

extension C02_9_Transaction {
    var monthKey: String {
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "yyyy-MM"
        return f.string(from: date)
    }
}

func d(_ iso: String) -> Date {
    let f = ISO8601DateFormatter()
    f.formatOptions = [.withFullDate]
    return f.date(from: iso) ?? .distantPast
}
