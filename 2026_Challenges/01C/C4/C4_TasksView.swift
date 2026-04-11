//
//  C4_TasksView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 16/01/26.
//

import SwiftUI

struct C4_TasksView: View {
    
    @StateObject private var viewModel = C4_TaskListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    C4_TaskRow(task: task)
                }
            }
        }
        .navigationTitle("Tareas")
    }
}

private struct C4_TaskRow: View {
    let task: C4_TaskItem
    var body: some View {
        HStack{
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isCompleted ? .green : .primary)
            Text(task.title)
                .foregroundStyle(task.isCompleted ? .secondary: .primary)
                .strikethrough(task.isCompleted)
        }
        .padding(.vertical, 4)
    }
}
