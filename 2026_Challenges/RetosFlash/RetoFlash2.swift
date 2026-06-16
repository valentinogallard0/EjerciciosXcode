//
//  RetoFlash2.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 13/06/26.
//
import Foundation

// Data ==========================
struct CartItemDTO: Decodable {
    let id: Int
    let name: String
    let price: Double
    
    func toEntity() -> CartItemEntity {
        CartItemEntity(
            id: self.id,
            name: self.name,
            price: self.price
        )
    }
}

final class CartRepositoryImpl: CartRepositoryProtocol {
    
    var items: [CartItemEntity] = []
    
    func save(item: CartItemEntity) {
        items.append(item)
    }
    
    func getAll() -> [CartItemEntity] {
        return items
    }
}




// Domain ========================

struct CartItemEntity {
    let id: Int
    let name: String
    let price: Double
}

protocol CartRepositoryProtocol {
    func getAll() -> [CartItemEntity]
    func save(item: CartItemEntity)
}

final class GetCartUseCase {
    
    let repository: CartRepositoryProtocol
    
    init(repository: CartRepositoryProtocol) {
        self.repository = repository
    }

    func execute() -> [CartItemEntity] {
        repository.getAll()
    }
}

final class SaveCartUseCase {
    
    let repository: CartRepositoryProtocol
    
    init(repository: CartRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(item: CartItemEntity) {
        guard item.price > 200 else { return }
        repository.save(item: item)
    }
}




// Presentation ==================

import Combine

class CartViewModel: ObservableObject {
    let getCartUseCase: GetCartUseCase
    let saveCartUseCase: SaveCartUseCase
    
    init(getCartUseCase: GetCartUseCase, saveCartUseCase: SaveCartUseCase) {
        self.getCartUseCase = getCartUseCase
        self.saveCartUseCase = saveCartUseCase
    }
    
    func getCart() -> [CartItemEntity] {
        getCartUseCase.execute()
    }
    
    func save(item: CartItemEntity) {
        saveCartUseCase.execute(item: item)
    }
    
}
