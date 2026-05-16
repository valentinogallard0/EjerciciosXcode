//
//  Expense.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 15/05/26.
//
import Foundation

struct Expense: Identifiable {
    var id: UUID = UUID()
    var title: String
    var amount: Double
    var category: ExpenseCategory
    var weekday: Weekday
    var note: String?
    var createdAt: Date
    
    init(
        id: UUID,
        title: String,
        amount: Double,
        category: ExpenseCategory,
        weekday: Weekday, note: String? = nil,
        createdAt: Date
    ) {
        self.id = id
        self.title = title
        self.amount = amount
        self.category = category
        self.weekday = weekday
        self.note = note
        self.createdAt = createdAt
    }
    
    func fecha(_ dia: Int, _ mes: Int, _ año: Int) -> Date {
        var components = DateComponents()
        components.day = dia
        components.month = mes
        components.year = año
        return Calendar.current.date(from: components)!
    }
    
}
