//
//  OwnerDTO.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

struct OwnerDTO: Decodable {
    let login: String
    let id: Int
    let avatarUrl: String
    let userViewType: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
        case userViewType = "type"
    }
    
    func toEntity() -> OwnerEntity {
        OwnerEntity(
            login: self.login,
            id: self.id,
            avatarUrl: self.avatarUrl,
            userViewType: self.userViewType
        )
    }
}
