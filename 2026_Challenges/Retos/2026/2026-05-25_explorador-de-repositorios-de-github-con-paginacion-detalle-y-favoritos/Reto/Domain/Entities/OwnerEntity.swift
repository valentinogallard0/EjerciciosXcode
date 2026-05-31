//
//  OwnerEntity.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

struct OwnerEntity {
    let login: String
    let id: Int
    let avatarUrl: String
    let userViewType: String
}

extension OwnerEntity: Defaultable {
    static var defaultValue: OwnerEntity { .init(
        login: "Login Test",
        id: 001,
        avatarUrl: "",
        userViewType: "User type test"
    )}
}
