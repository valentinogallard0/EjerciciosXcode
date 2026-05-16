//
//  CartItem.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 07/05/26.
//

import SwiftUI

struct CartItem: Identifiable {
    var id: UUID { product.id }
    var product: Product
    var cantidad: Int
    var subTotal: Double {
        product.price * Double(cantidad)
    }
    
    init(
        product: Product,
        cantidad: Int,
    ) {
        self.product = product
        self.cantidad = cantidad
    }
}
