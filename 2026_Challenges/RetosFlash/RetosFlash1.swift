//
//  RetosFlash1.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 12/06/26.
//
import Foundation

//Data =======================
struct TaskDTO: Decodable {
    let id: UUID
    let title: String
    let isCompleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isCompleted = "is_completed"
    }
    
    func toEntity() -> TaskEntity {
        TaskEntity(
            id: self.id,
            title: self.title,
            isCompleted: self.isCompleted
        )
    }
}

final class TaskRepositoryImpl: TaskRepositoryProtocol {
    
    private var tasks: [TaskEntity] = []
    
    func getAllTasks() async throws -> [TaskEntity] {
        return self.tasks
    }
    
    func saveNewTask(task: TaskEntity) {
        tasks.append(task)
    }
}

// Domain ====================

struct TaskEntity {
    let id: UUID
    let title: String
    let isCompleted: Bool
}

protocol TaskRepositoryProtocol {
    
    func getAllTasks() async throws -> [TaskEntity]
    
    func saveNewTask(task: TaskEntity)
}


final class GetTaskUseCase {
    
    private let repository: TaskRepositoryProtocol
    
    init(repository: TaskRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [TaskEntity] {
        return try await repository.getAllTasks()
    }
}

// Presentation ==============


