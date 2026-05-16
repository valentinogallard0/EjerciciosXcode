//
//  ExpenseCategory.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 15/05/26.
//

import SwiftUI

enum ExpenseCategory: String, CaseIterable {
    case food
    case transport
    case entertainment
    case other
    
    var name: String {
        switch self {
        case .food: return "Food"
        case .transport: return "Transport"
        case .entertainment: return "Entertainment"
        case .other: return "Other"
        }
    }
    
    var icon: String {
        switch self {
        case .food: return "🍚"
        case .transport: return "🚌"
        case .entertainment: return "🎬"
        case .other: return "🤔"
        }
    }
    
    var color: Color {
        switch self {
        case .food: return .red
        case .transport: return .blue
        case .entertainment: return .yellow
        case .other: return .gray
        }
    }
}
