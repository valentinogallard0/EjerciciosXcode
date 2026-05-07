//
//  Category.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 07/05/26.
//

import SwiftUI

enum ProductCategory: String {
    case food
    case tecnology
    case beauty
    case fashion
    case home
    case others
    
    var name: String {
        switch self {
        case .food:
            return "Food"
        case .tecnology:
            return "Tecnology"
        case .beauty:
            return "Beauty"
        case .fashion:
            return "Fashion"
        case .home:
            return "Home"
        case .others:
            return "Others"
        }
    }
    
    var icon: String {
        switch self {
        case .food:
            return "hamburger"
        case .tecnology:
            return "iphone"
        case .beauty:
            return "gem"
        case .fashion:
            return "shoe"
        case .home:
            return "house"
        case .others:
            return "star"
        }
    }
    
    var color: Color {
        switch self {
        case .food:
            return .orange
        case .tecnology:
            return .blue
        case .beauty:
            return .pink
        case .fashion:
            return .red
        case .home:
            return .green
        case .others:
            return .yellow
        }
    }
    
    
}
