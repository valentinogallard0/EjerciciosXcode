//
//  RetoFlash5.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 15/06/26.
//
import Foundation
import Combine 

// MARK: Data
struct OrderDTO: Decodable {
    let id: Int
    let total: Double
    var status: OrderStatus
    
    func toEntity() -> OrderEntity {
        OrderEntity(
            id: self.id,
            total: self.total,
            status: self.status
        )
    }
}

protocol OrderDataSourceProtocol {
    func getAll() async throws -> [OrderDTO]
    func cancel(id: Int) async throws
}

final class OrdersRepositoryImpl: OrdersRepositoryProtocol {
    
    let dataSource: OrderDataSourceProtocol
    init(dataSource: OrderDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    func getAll() async throws -> [OrderEntity] {
        try await self.dataSource.getAll().map { $0.toEntity() }
    }
    
    func cancel(id: Int) async throws {
        try await self.dataSource.cancel(id: id)
    }
}

final class OrderRemoteDataSource: OrderDataSourceProtocol {
    var orders: [OrderDTO] = [
        OrderDTO(id: 1, total: 10, status: .delivered),
        OrderDTO(id: 2, total: 20, status: .pending),
        OrderDTO(id: 3, total: 30, status: .cancelled)
    ]
    
    func getAll() async throws -> [OrderDTO] {
        try await Task.sleep(for: .seconds(3))
        return self.orders
    }
    
    func cancel(id: Int) async throws {
        try await Task.sleep(for: .seconds(3))
        guard let index = self.orders.firstIndex(where: { $0.id == id }) else { return }
        orders[index].status = .cancelled
    }
    
}




// MARK: Domain

struct OrderEntity {
    let id: Int
    let total: Double
    var status: OrderStatus
}


enum OrderStatus: Decodable {
    case pending
    case delivered
    case cancelled
}


protocol OrdersRepositoryProtocol {
    func getAll() async throws -> [OrderEntity]
    func cancel(id: Int) async throws
}

struct GetOrdersUseCase {
    let repository: OrdersRepositoryProtocol
    init(repository: OrdersRepositoryProtocol) {
        self.repository = repository
    }
    func call() async throws -> [OrderEntity] {
        try await self.repository.getAll()
    }
}

struct CancelOrderUseCase {
    let repository: OrdersRepositoryProtocol
    init(repository: OrdersRepositoryProtocol) {
        self.repository = repository
    }
    func call(id: Int) async throws {
        let orders = try await self.repository.getAll()
        guard let orderIndex = orders.firstIndex(where: { $0.id == id }) else { throw OrderError.orderNotFound }
        let order = orders[orderIndex]
        guard order.status != .delivered else { throw OrderError.alreadyDelivered }
        try await self.repository.cancel(id: id)
    }
}

enum OrderError: Error {
    case alreadyDelivered
    case orderNotFound
    
    var description: String {
        switch self {
        case .alreadyDelivered: return "Order already delivered"
        case .orderNotFound: return "Order not found"
        }
    }
}


// MARK: Presentation

class OrderViewModel: ObservableObject {
    @Published var orders: [OrderEntity] = []
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    
    let getOrderUseCase: GetOrdersUseCase
    let cancelOrderUseCase: CancelOrderUseCase
    
    init(getOrderUseCase: GetOrdersUseCase, cancelOrderUseCase: CancelOrderUseCase) {
        self.getOrderUseCase = getOrderUseCase
        self.cancelOrderUseCase = cancelOrderUseCase
    }
    
    func getOrders() {
        Task {
            defer { isLoading = false }
            isLoading = true
            do {
                self.orders = try await self.getOrderUseCase.call()
            } catch {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func cancelOrder(id: Int) {
        Task {
            defer { self.isLoading = false }
            self.isLoading = true
            do {
                try await self.cancelOrderUseCase.call(id: id)
            } catch {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
}
