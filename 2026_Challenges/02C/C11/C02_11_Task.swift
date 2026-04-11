//
//  C02_11_Task.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 22/02/26.
//

import Foundation
import Combine
import SwiftUI

struct C02_11_Task: Identifiable {
    var id: UUID = UUID()
    var title: String
    var isDone: Bool
    
}

enum C02_11_Status: Equatable, CaseIterable {
    case all, pending, done
    
    var description: String {
        switch self {
        case .all: return "All"
        case .pending: return "Pendind"
        case .done: return "Done"
        }
    }
}

class C02_11_TaskViewModel: ObservableObject {
    
    @Published var tasks_11: [C02_11_Task] = [
        .init(title: "Buy groceries", isDone: false),
        .init(title: "Read a book", isDone: false),
        .init(title: "Workout", isDone: false),
        .init(title: "Call mom", isDone: false),
        .init(title: "Cook dinner", isDone: false)
    ]
    @Published var selectedStatus: C02_11_Status = .all
    
    func addTask(taskTitle: String) {
        let title: String = taskTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !title.isEmpty else { return }
        let newTask = C02_11_Task(title: title, isDone: false)
        tasks_11.append(newTask)
    }
    
    func deleteTask(at offset: IndexSet) {
        let idsToDelete = offset.map { filteredTasks[$0].id}
        tasks_11.removeAll() { idsToDelete.contains($0.id) }
    }
    
    func toggleDone(taskID: UUID) {
        guard let index = tasks_11.firstIndex(where: { $0.id == taskID}) else { return }
        tasks_11[index].isDone.toggle()
    }
    
    var filteredTasks: [C02_11_Task] {
        switch selectedStatus {
        case .all: return tasks_11
        case .pending: return tasks_11.filter { !$0.isDone }
        case .done: return tasks_11.filter { $0.isDone }
        }
    }
    
    var pendingTasksCount: Int {
        tasks_11.filter { !$0.isDone }.count
    }
    
    var doneTasksCount: Int {
        tasks_11.filter{ $0.isDone }.count
    }
}

struct C02_11_TodoListView: View {
    @StateObject private var vm = C02_11_TaskViewModel()
    @State private var newTaskTitle: String = ""
    var body: some View {
        VStack {
            Text("Pendientes: \(vm.pendingTasksCount) - Completadas: \(vm.doneTasksCount)")
            
            HStack {
                TextField("Nueva tarea...", text: $newTaskTitle)
                
                Button {
                    vm.addTask(taskTitle: newTaskTitle)
                }label: {
                    Image(systemName: "plus")
                }
            }
            
            
            /*
             Picker("Estado", selection: $vm.selectedStatus) {
                 ForEach(C02_11_Status.allCases) { priority in
                     Text(priority.rawValue).tag(priority)
                 }
             }
             */
            
            ForEach(vm.filteredTasks){ task in
                HStack {
                    Text(task.title)
                    if task.isDone {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "square")
                    }
                }
                
            }
            
        }
        .padding()
    }
}

#Preview {
    C02_11_TodoListView()
}
