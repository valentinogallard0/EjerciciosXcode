//
//  CartProductListView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/05/26.
//

import SwiftUI

struct CartProductListView: View {
    
    var cartItem: CartItem
    
    var body: some View {
        VStack {
            Text("\(self.cartItem.product.name)")
            Text("Cantidad: \(self.cartItem.cantidad)")
            Text("\(self.cartItem.product.price)")
        }
    }
}

#Preview {
    CartProductListView(cartItem: CartItem(product: Product(id: UUID(), name: "iPhone 17 Pro", description: "Celular de ultima generacion", category: .tecnology, price: 30999), cantidad: 3))
}
