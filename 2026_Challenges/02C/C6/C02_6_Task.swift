//
//  C02_6_Task.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 16/02/26.
//

import Foundation

struct C02_6_Task: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var priority: C02_6_Priority = .medium
    var isCompleted: Bool
    var dueDate: Date?
    var isOverdue: Bool {
        guard !isCompleted else { return false }
        guard let dueDate else { return false }
        return dueDate < Date()
    }
}

extension C02_6_Task {
    static func create(
        title: String,
        description: String,
        priority: C02_6_Priority = .medium,
        dueDate: Date? = nil
    ) -> C02_6_Task {
        C02_6_Task(
            title: title,
            description: description,
            priority: priority,
            isCompleted: false,
            dueDate: dueDate
        )
    }
}

enum C02_6_Priority: String {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}
