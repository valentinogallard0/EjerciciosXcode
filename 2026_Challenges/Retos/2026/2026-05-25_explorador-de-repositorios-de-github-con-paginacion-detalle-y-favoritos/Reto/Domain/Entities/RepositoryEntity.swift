//
//  RepositoryEntity.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

struct RepositoryEntity {
    let id: Int
    let name: String
    let fullName: String
    let description: String
    let isPrivate: Bool
    let language: String
    let owner: OwnerEntity
}

extension RepositoryEntity: Defaultable {
    static var defaultValue: RepositoryEntity { .init(
        id: 0,
        name: "Name test",
        fullName: "Full name test",
        description: "This is a description test for deafult value",
        isPrivate: false,
        language: "Swift",
        owner: .defaultValue
    )}
}
