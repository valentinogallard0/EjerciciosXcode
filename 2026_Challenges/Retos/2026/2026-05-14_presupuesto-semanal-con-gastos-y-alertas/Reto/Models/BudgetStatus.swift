//
//  BudgetStatus.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 17/05/26.
//
import SwiftUI


enum BudgetStatus: String, CaseIterable, Identifiable {
    case normal
    case warning
    case exceeded
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .normal:
            return "Normal"
        case .warning:
            return "Warning"
        case .exceeded:
            return "Exceeded"
        }
    }
    
    var color: Color {
        switch self {
        case .normal:
            return .green
        case .warning:
            return .yellow
        case .exceeded:
            return .red
        }
    }
    
    var icon: String {
        switch self {
        case .normal:
            return "checkmark.circle"
        case .warning:
            return "exclamationmark.circle"
        case .exceeded:
            return "xmark.circle"
        }
    }
}
