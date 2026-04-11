//
//  C03_Carrito.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/03/26.
//

import SwiftUI
import Combine
import Foundation

protocol StorageService {
    func save(item: String)
}

protocol AnalyticsService {
    func track(event: String)
}

struct LocalStorage: StorageService {
    func save(item: String) {
        print("💾Guardado \(item)")
    }
}

struct MockStorage: StorageService {
    func save(item: String) {
        print("🧪Mock guardado \(item)")
    }
}

struct FirebaseAnalytics: AnalyticsService {
    func track(event: String) {
        print("🔥 Firebase: \(event)")
    }
}

struct MockAnalytics: AnalyticsService {
    func track(event: String) {
        print("🧪 Mock track: \(event)")
    }
}


class CartViewModel: ObservableObject {
    @Published var items: [String] = []
    
    private let storage: StorageService
    private let analytics: AnalyticsService
    
    init(storage: StorageService, analytics: AnalyticsService) {
        self.storage = storage
        self.analytics = analytics
    }
    
    func addItem(_ name: String) {
        items.append(name)
        storage.save(item: name)
        analytics.track(event: name)
    }
}

struct CartView: View {
    @StateObject var vm: CartViewModel
    
    var body: some View {
        Button("Agregar Manzana") {
            vm.addItem("Manzana")
        }
    }
}

let prodCart = CartView(vm: CartViewModel(
    storage: LocalStorage(),
    analytics: FirebaseAnalytics()))

let testCart = CartView(vm: CartViewModel(
    storage: MockStorage(),
    analytics: MockAnalytics()))
