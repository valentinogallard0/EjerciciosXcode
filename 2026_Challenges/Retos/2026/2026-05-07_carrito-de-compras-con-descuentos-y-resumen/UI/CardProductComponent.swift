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
        GlassEffectContainer {
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.title.bold())
                Text(product.description)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                categoryPill
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
        )
    }
    
    private var categoryPill: some View {
        HStack {
            Image(systemName: product.category.icon)
            Text(product.category.name)
        }
        .padding(8)
        .font(.caption)
        .background(
            Capsule()
                .fill(product.category.color.opacity(0.15))
        )
        .foregroundStyle(product.category.color)
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
