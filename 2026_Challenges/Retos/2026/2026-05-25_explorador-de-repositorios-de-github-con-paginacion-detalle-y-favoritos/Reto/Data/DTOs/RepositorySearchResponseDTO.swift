//
//  RepositorySearchResponseDRO.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 30/05/26.
//

struct RepositorySearchResponseDTO: Decodable {
    let totalCount: Int
    let items: [RepositoryDTO]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
