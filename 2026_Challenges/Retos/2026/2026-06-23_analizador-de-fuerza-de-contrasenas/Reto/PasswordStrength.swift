//
//  PasswordStrength.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 23/06/26.
//
import SwiftUI

enum PasswordStrength: CaseIterable {
    case muyDebil
    case debil
    case media
    case fuerte
    case muyFuerte
    
    var label: String {
        switch self {
        case .muyDebil: return "Muy debil"
        case .debil: return "Debil"
        case .media: return "Media"
        case .fuerte: return "Fuerte"
        case .muyFuerte: return "Muy fuerte"
        }
    }
    
    var colo: Color {
        switch self {
        case .muyDebil: return .red
        case .debil: return .orange
        case .media: return .yellow
        case .fuerte: return .green.opacity(0.5)
        case .muyFuerte: return .green
        }
    }
    
    var strength: Int {
        switch self {
        case .muyDebil: return 20
        case .debil: return 40
        case .media: return 60
        case .fuerte: return 80
        case .muyFuerte: return 100
        }
    }
}
