//
//  HighestSpentComponent.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 17/05/26.
//

import SwiftUI

struct HighestSpentComponent: View {
    
    @ObservedObject var viewModel: BudgetViewModel
    
    var body: some View {
        if let highest = viewModel.highestSpend {
            VStack(alignment: .leading) {
                Text("Highest")
                    .font(.callout)
                    .fontWeight(.semibold)
                Text("$\(highest.amount, specifier: "%.2f")")
                    .font(.title2.bold())
                HStack {
                    Text("\(highest.category.name) - \(highest.weekday.shortName)")
                    
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.gray.opacity(0.2))
            )
        }
    }
}

#Preview {
    HighestSpentComponent(viewModel: BudgetViewModel())
}
