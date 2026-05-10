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
        VStack(alignment: .leading, spacing: 10) {
            Text("\(self.cartItem.product.name)")
                .font(.title3.bold())
            Text("Cantidad: \(self.cartItem.cantidad)")
                .font(.caption)
            Text("Subtotal - $\(self.cartItem.subTotal, specifier: "%.0f")")
                .font(.footnote.bold())
            
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    CartProductListView(cartItem: CartItem(product: Product(id: UUID(), name: "iPhone 17 Pro", description: "Celular de ultima generacion", category: .tecnology, price: 30999), cantidad: 3))
}
