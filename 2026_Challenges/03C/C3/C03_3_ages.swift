//
//  C03_3_ages.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 12/03/26.
//

struct C03_3_ages {
    let ages: [Int?] = [21, nil, 30, nil, 18]
    
    func validAges(from ages: [Int?]) -> [Int] {
        return ages.compactMap { $0 }
    }
}
