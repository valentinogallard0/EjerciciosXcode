//
//  MockData.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 15/05/26.
//

import Foundation

struct MockData {
    static let expenses: [Expense] = [
        Expense(id: UUID(), title: "Comida", amount: 130, category: .food, weekday: .friday, createdAt: Date()),
        Expense(id: UUID(), title: "Gasolina", amount: 500, category: .transport, weekday: .thursday, createdAt: fecha(14, 5, 2026)),
        Expense(id: UUID(), title: "Helado de la michoacana", amount: 130, category: .food, weekday: .thursday, createdAt: fecha(14, 5, 2026))
    ]
    
    static func fecha(_ dia: Int, _ mes: Int, _ año: Int) -> Date {
        var components = DateComponents()
        components.day = dia
        components.month = mes
        components.year = año
        return Calendar.current.date(from: components)!
    }
}
