//
//  HabitEntry.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 21/04/26.
//

import SwiftData
import Foundation

@Model
final class HabitEntry {
    var id: UUID
    var date: Date
    var completedCount: Int
    var habit: Habit?
    
    init(date: Date, completedCount: Int = 1, habit: Habit) {
        self.id = UUID()
        self.date = date
        self.completedCount = completedCount
        self.habit = habit
    }
}
