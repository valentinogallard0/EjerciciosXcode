//
//  CartView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/05/26.
//

import SwiftUI

struct CartView: View {
    
    var viewModel: ProductListViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(viewModel.cartItems) { item in
                    CartProductListView(cartItem: item)
                }
                Spacer()
                Text("Total \(self.viewModel.total)")
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
