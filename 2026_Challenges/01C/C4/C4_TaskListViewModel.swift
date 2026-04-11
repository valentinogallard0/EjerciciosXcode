//
//  C4_TaskListViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 16/01/26.
//

import Foundation
import Combine

class C4_TaskListViewModel: ObservableObject {
    
    @Published var tasks: [C4_TaskItem] = []
    
    init() {
        tasks = [
            C4_TaskItem(title: "Comprar Cafe"),
            C4_TaskItem(title: "Hacer ejercicio"),
            C4_TaskItem(title: "Leer un libro", isCompleted: true)
        ]
    }
    
    func toggleTask(_ task: C4_TaskItem) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id}) else {
            return
        }
        tasks[index].isCompleted.toggle()
    }
}
