//
//  DailyAverageView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 17/05/26.
//

import SwiftUI

struct DailyAverageView: View {
    
    @ObservedObject var viewModel: BudgetViewModel
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Daily avg")
                    .font(.callout)
                    .fontWeight(.semibold)
                Text("$\(viewModel.promedio, specifier: "%.2f")")
                    .font(.title2.bold())
                HStack {
                    Text("\(viewModel.diasTrackeados) days tracked")
                    
                }
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

#Preview {
    DailyAverageView(viewModel: BudgetViewModel())
}
