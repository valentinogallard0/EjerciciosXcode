//
//  RepositoryRepository.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

protocol RepositoryRepository {
    
    func getRepositories(query: String, page: Int) async throws -> [RepositoryEntity]
}
