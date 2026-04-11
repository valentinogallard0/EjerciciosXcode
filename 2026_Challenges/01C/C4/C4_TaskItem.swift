//
//  C4_TaskItem.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 16/01/26.
//

import Foundation

struct C4_TaskItem: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
}
