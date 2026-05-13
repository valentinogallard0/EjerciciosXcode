//
//  CartProductListView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/05/26.
//

import SwiftUI

struct CartProductListView: View {
    
    @Binding var cartItem: CartItem
    @ObservedObject var viewModel: ProductListViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(self.cartItem.product.name)")
                    .font(.title3.bold())
                Text("Cantidad: \(self.cartItem.cantidad)")
                    .font(.caption)
                Text("Subtotal - $\(self.cartItem.subTotal, specifier: "%.0f")")
                    .font(.footnote.bold())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            HStack {
                Button {
                    self.viewModel.removeQuantity(cartItem: cartItem)
                } label: {
                    Image(systemName: "minus")
                }
                
                Button {
                    self.viewModel.addProductToCart(product: cartItem.product)
                } label: {
                    Image(systemName: "plus")
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CartProductListView(cartItem: .constant(CartItem(product: Product(id: UUID(), name: "iPhone 17 Pro", description: "Celular de ultima generacion", category: .tecnology, price: 30999), cantidad: 3)), viewModel: ProductListViewModel())
}
