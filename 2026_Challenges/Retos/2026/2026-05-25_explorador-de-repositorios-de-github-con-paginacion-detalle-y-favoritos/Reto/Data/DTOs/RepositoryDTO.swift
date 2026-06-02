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
    let description: String?
    let isPrivate: Bool
    let language: String?
    let owner: OwnerDTO
    let starGazersCount: Int
    let forksCount: Int
    let htmlURL: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case description
        case isPrivate = "private"
        case language
        case owner
        case starGazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case htmlURL = "html_url"
    }
    
    func toEntity() -> RepositoryEntity {
        RepositoryEntity(
            id: self.id,
            name: self.name,
            fullName: self.fullName,
            description: self.description ?? "",
            isPrivate: self.isPrivate,
            language: self.language ?? "",
            owner: self.owner.toEntity(),
            starGazersCount: self.starGazersCount,
            forksCount: self.forksCount,
            htmlURL: self.htmlURL ?? ""
        )
    }
}
