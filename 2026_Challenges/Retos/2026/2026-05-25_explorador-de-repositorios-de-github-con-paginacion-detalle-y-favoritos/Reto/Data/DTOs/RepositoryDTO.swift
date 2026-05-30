//
//  RepositoryDTO.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

struct RepositoryDTO: Decodable {
    let id: Int
    let name: String
    let fullName: String
    let isPrivate: Bool
    let owner: OwnerDTO
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case isPrivate = "private"
        case owner
    }
    
    func toEntity() -> RepositoryEntity {
        RepositoryEntity(
            id: self.id,
            name: self.name,
            fullName: self.fullName,
            isPrivate: self.isPrivate,
            owner: self.owner.toEntity()
        )
    }
}
