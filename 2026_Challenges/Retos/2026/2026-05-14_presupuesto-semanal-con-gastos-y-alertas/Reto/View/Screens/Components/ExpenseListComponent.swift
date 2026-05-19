//
//  ExpenseListComponent.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 19/05/26.
//

import SwiftUI

struct ExpenseListComponent: View {
    
    @ObservedObject var viewModel: BudgetViewModel
    
    var body: some View {
        VStack(spacing: 25) {
            ForEach(viewModel.gastosSemana.reversed()) { gasto in
                HStack {
                    iconComponent(icon: gasto.category.icon, color: gasto.category.color)
                    
                    VStack(alignment: .leading) {
                        Text(gasto.title)
                            .fontWeight(.semibold)
                        Text("\(gasto.weekday.shortName) - \(gasto.category.name)")
                            .font(.callout)
                    }
                    
                    Spacer()
                    
                    Text("$\(gasto.amount, specifier: "%.2f")")
                }
                Divider()
                    .padding(.horizontal, 25)
            }
        }
        .padding()
    }
}

#Preview {
    ExpenseListComponent(viewModel: BudgetViewModel())
}
