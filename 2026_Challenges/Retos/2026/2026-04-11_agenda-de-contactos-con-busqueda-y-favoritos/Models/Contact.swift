//
//  Contact.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 11/04/26.
//
import Foundation

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var phone: String
    var isFavorite: Bool = false
    var category: Category_01
    
    func iniciales() -> String {
        let palabras = self.name.split(separator: " ")
        
        return palabras
            .prefix(2)
            .compactMap { $0.first.map { String($0).uppercased()}}
            .joined()
    }
}

enum Category_01: String, CaseIterable {
    case work = "Trabajo"
    case personal = "Personal"
}
