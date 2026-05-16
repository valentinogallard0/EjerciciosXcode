//
//  MockProducts.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 07/05/26.
//

import Foundation

struct MockProducts {
    static let products: [Product] = [
        Product(
            id: UUID(),
            name: "Cafe americano",
            description: "Cafe caliente de sabor intenso, ideal para empezar el dia.",
            category: .food,
            price: 39.00
        ),
        Product(
            id: UUID(),
            name: "Te chai latte",
            description: "Bebida especiada y cremosa con notas de canela y vainilla.",
            category: .food,
            price: 55.00
        ),
        Product(
            id: UUID(),
            name: "Agua mineral",
            description: "Agua con gas ligera y refrescante para acompanar cualquier comida.",
            category: .food,
            price: 24.00
        ),
        Product(
            id: UUID(),
            name: "Sandwich de pollo",
            description: "Pan artesanal con pollo, vegetales frescos y aderezo ligero.",
            category: .food,
            price: 89.00
        ),
        Product(
            id: UUID(),
            name: "Ensalada mediterranea",
            description: "Mezcla fresca de hojas verdes, aceitunas, queso y vegetales.",
            category: .food,
            price: 112.00
        ),
        Product(
            id: UUID(),
            name: "Wrap vegetariano",
            description: "Tortilla suave con vegetales asados, hummus y hojas frescas.",
            category: .food,
            price: 96.00
        ),
        Product(
            id: UUID(),
            name: "Croissant de mantequilla",
            description: "Pan hojaldrado con sabor suave a mantequilla y textura crujiente.",
            category: .food,
            price: 42.00
        ),
        Product(
            id: UUID(),
            name: "Muffin de moras",
            description: "Panquecito esponjoso con moras y un toque dulce.",
            category: .food,
            price: 48.00
        ),
        Product(
            id: UUID(),
            name: "Galleta de chocolate",
            description: "Galleta suave con chispas de chocolate y centro ligeramente humedo.",
            category: .food,
            price: 32.00
        ),
        Product(
            id: UUID(),
            name: "Pastel de zanahoria",
            description: "Rebanada de pastel especiado con betun cremoso.",
            category: .food,
            price: 68.00
        ),
        Product(
            id: UUID(),
            name: "Cheesecake individual",
            description: "Postre cremoso con base crujiente y cobertura dulce.",
            category: .food,
            price: 74.00
        ),
        Product(
            id: UUID(),
            name: "Brownie clasico",
            description: "Brownie denso de chocolate con textura suave por dentro.",
            category: .food,
            price: 52.00
        ),
        Product(
            id: UUID(),
            name: "Manzana roja",
            description: "Fruta fresca, dulce y crujiente para una opcion ligera.",
            category: .food,
            price: 18.00
        ),
        Product(
            id: UUID(),
            name: "Platano",
            description: "Fruta practica y energetica para consumir al momento.",
            category: .food,
            price: 12.00
        ),
        Product(
            id: UUID(),
            name: "Uvas verdes",
            description: "Porcion de uvas frescas con sabor dulce y acido.",
            category: .food,
            price: 46.00
        ),
        Product(
            id: UUID(),
            name: "Yogurt natural",
            description: "Yogurt sin saborizantes, ideal para combinar con fruta o granola.",
            category: .food,
            price: 35.00
        ),
        Product(
            id: UUID(),
            name: "Leche deslactosada",
            description: "Leche ligera sin lactosa para consumo diario.",
            category: .food,
            price: 31.00
        ),
        Product(
            id: UUID(),
            name: "Queso panela",
            description: "Queso fresco de sabor suave para ensaladas o snacks.",
            category: .food,
            price: 64.00
        ),
        Product(
            id: UUID(),
            name: "Papas horneadas",
            description: "Snack crujiente con menos aceite y sabor salado.",
            category: .food,
            price: 29.00
        ),
        Product(
            id: UUID(),
            name: "Mix de nueces",
            description: "Mezcla de nueces y semillas para un snack nutritivo.",
            category: .food,
            price: 58.00
        )
    ]
}
