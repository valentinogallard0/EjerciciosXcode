//
//  C2_User.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/02/26.
//

struct C2_User: Codable {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
