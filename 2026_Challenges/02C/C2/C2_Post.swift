//
//  C2_Post.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/02/26.
//

struct C2_Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
}
