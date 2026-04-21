//
//  FiltersSectionView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 20/04/26.
//

import SwiftUI

struct FiltersSectionView: View {
    @Binding var showOnlyFavorites: Bool
    @Binding var selectedCategory: Category_01?
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                FilterChipComponent(
                    label: "Favorites",
                    isSelected: showOnlyFavorites
                ) {
                    showOnlyFavorites.toggle()
                }
                
                FilterChipComponent(
                    label: "All",
                    isSelected: selectedCategory == nil
                ) {
                    selectedCategory = nil
                }
                
                ForEach(Category_01.allCases, id: \.self) { category in
                    FilterChipComponent(
                        label: category.rawValue,
                        isSelected: selectedCategory == category
                    ) {
                        selectedCategory = selectedCategory == category ? nil : category
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    FiltersSectionView(showOnlyFavorites: .constant(true), selectedCategory: .constant(.personal))
}
