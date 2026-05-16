//
//  Discount.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 13/05/26.
//

enum Discount: CaseIterable, Identifiable {
    case none
    case twentyFivePercent
    case theriePercent
    case fiftyPercent
    
    var id: Self { self }
    
    var value: Double {
        switch self {
        case .none:
            return 0
        case .twentyFivePercent:
            return 0.25
        case .theriePercent:
            return 0.30
        case .fiftyPercent:
            return 0.5
        }
    }
    
    var title: String {
        switch self {
        case .none:
            return "None"
        case .twentyFivePercent:
            return "25%"
        case .theriePercent:
            return "30%"
        case .fiftyPercent:
            return "50%"
        }
    }
}
