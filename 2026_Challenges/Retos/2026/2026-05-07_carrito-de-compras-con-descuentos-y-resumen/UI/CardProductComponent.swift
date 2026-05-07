//
//  CardProductComponent.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 07/05/26.
//

import SwiftUI
import Foundation

struct CardProductComponent: View {
    
    @Binding var product: Product
    
    var body: some View {
        Text(product.name)
            .font(.title)
        
        categoryPill
        
        Text(product.description)
            .font(.caption)
    }
    
    private var categoryPill: some View {
        HStack {
            Image(systemName: product.category.icon)
            Text(product.category.name)
        }
    }
}

#Preview {
    CardProductComponent(
        product: .constant(Product(
            id: UUID(),
            name: "iPhone 17 Pro",
            description: "Lo ultimo en tecnologia, el iPhone 17 Pro es lo que ofrece en la gamma mas alta de la empresa de Apple",
            category: .tecnology,
            price: 35000
        ))
    )
}
