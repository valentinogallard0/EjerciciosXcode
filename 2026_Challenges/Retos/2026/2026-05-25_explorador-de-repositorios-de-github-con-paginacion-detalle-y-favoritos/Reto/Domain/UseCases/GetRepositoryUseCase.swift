//
//  GetRepositoryUseCase.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

struct GetRepositoryUseCase {
    let repository: RepositoryRepository
    
    func execute(query: String, page: Int) async throws -> [RepositoryEntity] {
        try await self.repository.getRepositories(query: query, page: page)
    }
}
