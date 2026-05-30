//
//  RepositoryDataSourceRemoteRepository.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

import Foundation

struct RepositoryDataSourceRemoteRepository: RepositoryRepository {
    
    let dataSource: DataSource
    
    func getRepositories(query: String, page: Int) async throws -> [RepositoryEntity] {
        
        let endpoint = GetRepositoryEndpoint(
            query: query,
            page: page
        )
        
        let data = try await self.dataSource.execute(endpoint: endpoint)
        let dtos = try JSONDecoder().decode([RepositoryDTO].self, from: data)
        
        return dtos.map { $0.toEntity() }
    }
}
