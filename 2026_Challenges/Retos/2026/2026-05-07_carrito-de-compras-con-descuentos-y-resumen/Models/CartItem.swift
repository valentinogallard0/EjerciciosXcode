//
//  CartItem.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 07/05/26.
//

import SwiftUI

struct CartItem {
    var product: Product
    var cantidad: Int
    var subTotal: Double
    
    init(
        product: Product,
        cantidad: Int,
        subTotal: Double
    ) {
        self.product = product
        self.cantidad = cantidad
        self.subTotal = subTotal
    }
}
