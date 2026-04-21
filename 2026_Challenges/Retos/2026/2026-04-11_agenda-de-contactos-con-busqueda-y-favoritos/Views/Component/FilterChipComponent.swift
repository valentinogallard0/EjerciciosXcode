//
//  FilterChipComponent.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 20/04/26.
//

import SwiftUI

struct FilterChipComponent: View {
    
    let label: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            Text(self.label)
                .font(.subheadline)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(self.isSelected ? Color.green : Color(.systemGray6))
                .foregroundStyle(isSelected ? .white : .primary)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    FilterChipComponent(label: "Filter", isSelected: true, action: {})
}
