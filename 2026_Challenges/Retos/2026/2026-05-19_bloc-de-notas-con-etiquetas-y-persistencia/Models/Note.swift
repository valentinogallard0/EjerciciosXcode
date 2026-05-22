//
//  Note.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 19/05/26.
//
import Foundation

struct Note: Identifiable, Codable {
    var id: UUID
    var title: String
    var body: String
    var tags: [String]
    var createdAt: Date
}
