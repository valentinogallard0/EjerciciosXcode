//
//  C03_2_User.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 12/03/26.
//

struct C03_2_User {
    let name: String
    let age: Int?
    
    func printUserAge(user: C03_2_User?) {
        guard let user = user, let age = user.age else {
            print("Age not available")
            return
        }
        
        print("User \(user.name) is \(age) years old")
    }
}
