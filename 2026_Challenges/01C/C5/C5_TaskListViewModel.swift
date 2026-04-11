//
//  C5_TaskListViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 16/01/26.
//

import Foundation
import Combine

class C5_TaskListViewModel: ObservableObject {
    
    @Published var tasks: [C5_Task] = []
    
    func addTask(title: String){
        let newTask = C5_Task(title: title)
        tasks.append(newTask)
    }
    
    func deleteTask(task: C5_Task){
        
    }
}
