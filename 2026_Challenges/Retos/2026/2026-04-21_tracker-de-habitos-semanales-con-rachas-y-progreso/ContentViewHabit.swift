//
//  ContentViewHabit.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 21/04/26.
//

import SwiftUI
import SwiftData

struct ContentViewHabit: View {
    @Environment(\.modelContext) private var context
    @Query var habits: [Habit]
    
    var body: some View {
        VStack {
            Text("Habits: \(habits.count)")
            Button("Agregar prueba") {
                let habit = Habit(
                    title: "Ejercicio",
                    category: "Salud",
                    targetDaysPerWeek: 5,
                    activeDaysOfWeek: [.monday, .wednesday, .friday]
                )
                context.insert(habit)
            }
        }
    }
}
