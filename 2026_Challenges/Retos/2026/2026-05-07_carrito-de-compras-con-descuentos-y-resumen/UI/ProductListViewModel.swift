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
    @Published var cartItems: [CartItem] = []
    
    var badgeCount: Int {
        cartItems.reduce(0) { $0 + $1.cantidad }
    }
    
    var total: Double {
        cartItems.reduce(0) { $0 + ($1.subTotal)}
    }
    
    init(
        products: [Product] = MockProducts.products
    ) {
        self.products = products
    }
    
    func addProductToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id}) {
            cartItems[index].cantidad += 1
        } else {
            cartItems.append(CartItem(product: product, cantidad: 1))
        }
    }
    
    func removeQuantity(cartItem: CartItem) {
        if let index = cartItems.firstIndex(where: {$0.id == cartItem.id}) {
            if cartItems[index].cantidad > 1 {
                cartItems[index].cantidad -= 1
            } else {
                cartItems.remove(at: index)
            }
        }
    }
    
    func removeCartItem(_ cartItem: CartItem) {
        cartItems.removeAll { $0.id == cartItem.id}
    }

     
}
