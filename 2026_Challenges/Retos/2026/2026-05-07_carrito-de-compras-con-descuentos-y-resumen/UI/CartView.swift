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
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                viewModel.removeCartItem(item)
                            } label: {
                                Label("Eliminar", systemImage: "trash")
                            }
                        }
                    }
                    Spacer()
                    Text("Total \(self.viewModel.total, specifier: "%.0f")")
                }                
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
