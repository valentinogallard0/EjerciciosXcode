//
//  CategoryExpendComponent.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 17/05/26.
//

import SwiftUI

struct CategoryExpendComponent: View {
    
    @ObservedObject var viewModel: BudgetViewModel
    
    var body: some View {
        VStack(spacing: 25) {
            ForEach(viewModel.totalByCatgory, id: \.category.name) { item in
                HStack {
                    iconComponent(
                        icon: item.category.icon,
                        color: item.category.color
                    )
                    
                    ProgressBarComponent(
                        categoryName: item.category.name,
                        total: item.total,
                        presupuesto: viewModel.presupuesto,
                        color: item.category.color
                    )
                }
            }
        }
        .padding()
    }
}

struct iconComponent: View {
    var icon: String
    var color: Color
    var body: some View {
        VStack {
            Image(systemName: self.icon)
                .foregroundStyle(self.color)
        }
        .frame(width: 10, height: 10)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(self.color.opacity(0.3))
        )
    }
}


#Preview {
    CategoryExpendComponent(viewModel: BudgetViewModel())
}
