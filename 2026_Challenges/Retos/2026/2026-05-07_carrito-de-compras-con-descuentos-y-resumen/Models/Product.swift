//
//  Product.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 07/05/26.
//

import Foundation

struct Product: Identifiable {
    var id: UUID
    var name: String
    var description: String
    var category: ProductCategory
    var price: Double
    
    init(
        id: UUID,
        name: String,
        description: String,
        category: ProductCategory,
        price: Double
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.category = category
        self.price = price
    }
}
