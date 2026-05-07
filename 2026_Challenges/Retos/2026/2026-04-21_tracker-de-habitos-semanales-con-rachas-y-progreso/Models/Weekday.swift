//
//  Weekday.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 21/04/26.
//

enum Weekday: Int, Codable, CaseIterable, Identifiable {
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
    case sunday = 1
    
    var id: Int { rawValue }
    
    var shortName: String {
        switch self {
        case .monday: return "Lu"
        case .tuesday: return "Mar"
        case .wednesday: return "Mi"
        case .thursday: return "Jue"
        case .friday: return "View"
        case .saturday: return "Sab"
        case .sunday: return "Dom"
        }
    }
    
    static var ordered: [Weekday] {
        [.monday, .tuesday, .wednesday, .thursday, .friday, .saturday, .sunday]
    }
}
