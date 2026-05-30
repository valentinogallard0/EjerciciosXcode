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
        let response = try JSONDecoder().decode(RepositorySearchResponseDTO.self, from: data)
        
        return response.items.map { $0.toEntity() }
    }
}
