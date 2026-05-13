//
//  CartView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/05/26.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var viewModel: ProductListViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach($viewModel.cartItems) { $item in
                        CartProductListView(
                            cartItem: $item,
                            viewModel: viewModel
                        )
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                viewModel.removeCartItem(item)
                            } label: {
                                Label("Eliminar", systemImage: "trash")
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                
                Spacer()
                
                Text("Total \(self.viewModel.total, specifier: "%.0f")")
                    .font(.headline)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        self.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var cartItem = CartItem(
        product: Product(
            id: UUID(),
            name: "Café americano",
            description: "Café caliente recién preparado",
            category: .food,
            price: 45
        ),
        cantidad: 3
    )
    
    CartProductListView(
        cartItem: $cartItem,
        viewModel: ProductListViewModel()
    )
    .padding()
    .background(Color(.systemGroupedBackground))
}
