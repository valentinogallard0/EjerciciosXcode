//
//  TipOption.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/06/26.
//

enum TipOption: Hashable {
    case zero
    case ten
    case fifteen
    case twenty
    case custom(Double)
    
    static let allCases: [TipOption] = [.zero, .ten, .fifteen, .twenty, .custom(0)]
    
    var percentage: Double {
        switch self {
        case .zero:     return 0
        case .ten:      return 10
        case .fifteen:  return 15
        case .twenty:   return 20
        case .custom(let val): return max(0, val)
        }
    }
    
    var description: String {
        switch self {
        case .zero:     return "0%"
        case .ten:      return "10%"
        case .fifteen:  return "15%"
        case .twenty:   return "20%"
        case .custom(let val): return "\(val)%"
        }
    }
}
