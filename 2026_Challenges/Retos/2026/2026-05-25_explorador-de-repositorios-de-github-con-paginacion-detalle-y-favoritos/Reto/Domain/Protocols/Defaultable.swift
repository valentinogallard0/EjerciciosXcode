//
//  Defaultable.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 31/05/26.
//

import Foundation

protocol Defaultable {
    static var defaultValue: Self { get }

    static func getDefaultValues(count: Int) -> [Self]
}

extension Defaultable {
    static func getDefaultValues(count: Int = 10) -> [Self] {
        let count: Int = count >= 1 ? count : 1
        let values: [Self] = (1...count).map { _ in self.defaultValue }
        return values
    }
}
