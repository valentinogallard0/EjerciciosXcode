//
//  C02_6_TaskViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 16/02/26.
//

import Foundation
import Combine

class C02_6_TaskViewModel: ObservableObject {
    
    @Published var tasks: [C02_6_Task] = []
    
    var expiredTasks: [C02_6_Task] {
        tasks.filter{ $0.isOverdue }
    }
    
    var hasExpiredTasks: Bool {
        tasks.contains { $0.isOverdue }
    }
    
    var expiredCount: Int {
        tasks.reduce(0) { $1.isOverdue ? $0 + 1: $0}
    }
    

    
    func completedTask(id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id}) else { return }
        tasks[index].isCompleted.toggle()
    }
    
    func createTask(
        title: String,
        description: String,
        priority: C02_6_Priority = .medium,
        dueDate: Date? = nil
    ) {
        let task = C02_6_Task.create(
            title: title,
            description: description,
            priority: priority,
            dueDate: dueDate
        )
        
        tasks.append(task)
    }
    
    func deleteTask(id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks.remove(at: index)
    }
    
}
