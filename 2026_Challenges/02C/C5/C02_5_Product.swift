//
//  C02_5_Product.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/02/26.
//

import Foundation

struct C02_5_Product: Identifiable {
    var id: UUID = UUID()
    var nombre: String
    var precio: Double
}

struct C02_5_Carrito: Identifiable {
    var id: UUID = UUID()
    var producto: C02_5_Product
    var cantidad: Int
}
