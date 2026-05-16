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
            if viewModel.cartItems.isEmpty {
                emptyViewState
            } else {
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
                    
                    if viewModel.total > 0 {
                        Picker("Descuento", selection: $viewModel.discountSelected) {
                            ForEach(Discount.allCases) { discount in
                                Text(discount.title)
                                    .tag(discount)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding()
                    }
                    
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
    
    private var emptyViewState: some View {
        VStack(spacing: 16) {
            Image(systemName: "cart.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            Text("No hay productos en el carrito")
                .font(.title)
                .foregroundColor(.secondary)
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
