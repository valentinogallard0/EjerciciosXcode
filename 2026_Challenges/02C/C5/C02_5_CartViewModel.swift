//
//  C02_5_CartViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/02/26.
//

import Foundation
import Combine

class C02_5_CartViewModel: ObservableObject {
    
    @Published var articulos: [C02_5_Carrito] = [
        C02_5_Carrito(producto: C02_5_Product(nombre: "iPhone 17 pro", precio: 28999), cantidad: 0),
        C02_5_Carrito(producto: C02_5_Product(nombre: "iPad Pro 12.9", precio: 12999), cantidad: 0),
        C02_5_Carrito(producto: C02_5_Product(nombre: "MacBook Air M1", precio: 13999), cantidad: 0),
        C02_5_Carrito(producto: C02_5_Product(nombre: "Apple Watch Series 9", precio: 3999), cantidad: 0)
    ]
    var subTotal: Double {
        articulos.reduce(0) { $0 + (Double($1.cantidad) * $1.producto.precio)}
    }
    var total: Double {
        subTotal + (subTotal * taxes)
    }
    
    var articulosTotales: Int {
        articulos.reduce(0) { $0 + $1.cantidad}
    }
    
    let taxes: Double = 0.16
    
    
    func incrementar(id: C02_5_Carrito) {
        guard let index = articulos.firstIndex(where: {$0.id == id.id}) else { return }
        articulos[index].cantidad += 1
    }
    
    func decrementar(id: C02_5_Carrito) {
        guard let index = articulos.firstIndex(where: {$0.id == id.id}) else { return }
        if articulos[index].cantidad > 0 && subTotal != 0 {
            articulos[index].cantidad -= 1
        }
    }
    
    func clear() {
        for index in articulos.indices {
            articulos[index].cantidad = 0
        }
    }
}

