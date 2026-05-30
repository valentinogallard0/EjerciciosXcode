//
//  GetRepositoryUseCase.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

struct GetRepositoryUseCase {
    let repository: RepositoryRepository
    
    func execute() async throws -> [RepositoryEntity] {
        try await self.repository.getRepositories(query: "", page: 0)
    }
}
