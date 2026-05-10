//
//  ProductListView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 07/05/26.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    @State private var showCartView: Bool = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        HStack {
            Text("Productos")
                .font(.title.bold())
            Spacer()
            
            CartBadgeView(count: viewModel.cartItems.count) {
                self.showCartView.toggle()
            }
        }
        .padding()
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.products) { product in
                    CardProductComponent(product: product) {
                        viewModel.addProductToCart(product: product)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showCartView) {
            CartView(cartItems: viewModel.cartItems)
        }
    }
}

#Preview {
    ProductListView()
}
