//
//  C02_7_User.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 17/02/26.
//

import Foundation

struct C02_7_User: Identifiable {
    var id: UUID = UUID()
    var name: String
    var age: Int
    var email: String?
}

extension C02_7_User {
    func canRegister() -> Bool {
        guard age >= 18 else { return false }
        guard let email, !email.isEmpty, email.contains("@") else { return false }
        return true
    }
}

class C02_7_UserViewModel {
    let users: [C02_7_User] = [
        C02_7_User(name: "Ana", age: 22, email: "ana@mail.com"),
        C02_7_User(name: "Luis", age: 17, email: "luis@mail.com"),
        C02_7_User(name: "Carla", age: 30, email: nil),
        C02_7_User(name: "Pedro", age: 25, email: "pedro@mail.com")
    ]
    
    var olderUsersWithEmail: [String] {
        return users.filter({$0.age >= 18 && $0.email != nil}).map(\.name)
    }    
}

