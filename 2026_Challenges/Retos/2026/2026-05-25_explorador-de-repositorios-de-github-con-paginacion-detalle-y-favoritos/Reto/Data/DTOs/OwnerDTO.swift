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
    
    func toEntity() -> OwnerEntity {
        OwnerEntity(
            login: self.login,
            id: self.id,
            avatarUrl: self.avatarUrl,
            userViewType: self.userViewType
        )
    }
}
