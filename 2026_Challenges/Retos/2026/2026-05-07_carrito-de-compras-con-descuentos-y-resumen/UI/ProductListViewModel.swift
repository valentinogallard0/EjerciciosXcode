//
//  ProductListViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 07/05/26.
//
import Foundation
import Combine
import SwiftUI

class ProductListViewModel: ObservableObject {
    @Published var products: [Product]
    @Published var cartItems: [Product] = []
    
    init(
        products: [Product] = MockProducts.products
    ) {
        self.products = products
    }
    
    func addProductToCart(product: Product) {
        cartItems.append(product)
    }
    
    /*
     func deleteProductFromCart(at offsets: IndexSet) {
         guard cartItems.isEmpty == false else { return }
         products.remove(atOffsets: offsets)
     }
     */
}
