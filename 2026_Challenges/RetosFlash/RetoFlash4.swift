//
//  RetoFlash4.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 15/06/26.
//
import Foundation
import Combine

// Data

struct ProductDTO: Decodable {
    let id: Int
    let name: String
    let price: Double
    
    func toEntity() -> ProductEntity {
        ProductEntity(
            id: self.id,
            name: self.name,
            price: self.price
        )
    }
}

final class FavoritesRepositoryImpl: FavoritesRepositoryProtocol {
    
    var favoriteProducts: [ProductEntity] = [
        ProductEntity(id: 1, name: "iPhone 17", price: 25000),
        ProductEntity(id: 2, name: "iPad Pro", price: 15000),
        ProductEntity(id: 3, name: "MacBook Pro", price: 100000)
    
    ]
    
    func getAll() -> [ProductEntity] {
        if favoriteProducts.isEmpty {
            print("Lista de favoritos vacia")
            return []
        } else {
            return favoriteProducts

        }
    }
    
    func add(product: ProductEntity) throws {
        guard !favoriteProducts.contains(where: { $0.id == product.id }) else {
            throw FavoritesError.alreadyExists
        }
        favoriteProducts.append(product)
    }
    
    func remove(id: Int) throws {
        guard let product = favoriteProducts.first(where: { $0.id == id }) else {
            throw FavoritesError.productNotFound
        }
        favoriteProducts.removeAll(where: { $0.id == product.id })
    }
}





// Domain

struct ProductEntity {
    let id: Int
    let name: String
    let price: Double
}

protocol FavoritesRepositoryProtocol {
    func getAll() -> [ProductEntity]
    func add(product: ProductEntity) throws
    func remove(id: Int) throws
}

struct GetFavoritesUseCase {
    
    let repository: FavoritesRepositoryProtocol
    init(repository: FavoritesRepositoryProtocol) {
        self.repository = repository
    }
    func execute() -> [ProductEntity] {
        repository.getAll()
    }
}

struct AddFavoriteUseCase {
    let repository: FavoritesRepositoryProtocol
    init(repository: FavoritesRepositoryProtocol) {
        self.repository = repository
    }
    func execute(product: ProductEntity) throws {
        try repository.add(product: product)
    }
}

struct RemoveFavoriteUseCase {
    let repostiroy: FavoritesRepositoryProtocol
    init(repostiroy: FavoritesRepositoryProtocol) {
        self.repostiroy = repostiroy
    }
    func execute(id: Int) throws {
        try repostiroy.remove(id: id)
    }
}


enum FavoritesError: Error {
    case productNotFound
    case alreadyExists
    
    var description: String {
        switch self {
        case .productNotFound: return "Product not found"
        case .alreadyExists: return "Product already exists"
        }
    }
}


// Presentation

class FavoritesViewModel: ObservableObject {
    
    @Published var favorites: [ProductEntity] = []
    @Published var errorMessage: String = ""
    
    let addFavoriteUseCase: AddFavoriteUseCase
    let removeFavoriteUseCase: RemoveFavoriteUseCase
    let getFavoritesUseCase: GetFavoritesUseCase
    
    init(
        addFavoriteUseCase: AddFavoriteUseCase,
        removeFavoriteUseCase: RemoveFavoriteUseCase,
        getFavoritesUseCase: GetFavoritesUseCase
    ) {
        self.addFavoriteUseCase = addFavoriteUseCase
        self.removeFavoriteUseCase = removeFavoriteUseCase
        self.getFavoritesUseCase = getFavoritesUseCase
    }
    
    func getFavorites() {
        self.favorites = self.getFavoritesUseCase.execute()
    }
    
    func addFavorite(product: ProductEntity) {
        do {
           try self.addFavoriteUseCase.execute(product: product)
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    func removeFavorite(id: Int) {
        do {
            try self.removeFavoriteUseCase.execute(id: id)
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
}
