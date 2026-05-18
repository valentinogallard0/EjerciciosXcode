//
//  SpentWeekComponent.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 17/05/26.
//

import SwiftUI

struct SpentWeekComponent: View {
    
    @ObservedObject var viewModel: BudgetViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Spent this Week")
                    .font(.callout)
                    .fontWeight(.semibold)
                Spacer()
                budgetStatus
                    .fontWeight(.bold)
            }
            
            HStack {
                Text("\(viewModel.restante, specifier: "%.0f")")
                    .font(.title.bold())
                Text("/ \(viewModel.presupuesto, specifier: "%.0f")")
            }
            
            restBar
                .padding(.vertical)
            
            HStack {
                Text("Remaining")
                Spacer()
                Text("$\(viewModel.totalGastado, specifier: "%.0f")")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.gray.opacity(0.2))
        )
    }
    
    private var budgetStatus: some View {
        HStack {
            Image(systemName: viewModel.status.icon)
            Text("\(viewModel.porcentajeGastado, specifier: "%.0f")%")
        }
        .foregroundStyle(viewModel.status.color)
    }
    
    private var restBar: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.gray)
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(viewModel.status.color)
                    .frame(width: geometry.size.width * (viewModel.porcentajeGastado/100))
            }
        }
        .frame(height: 10)
        .animation(.easeInOut, value: viewModel.porcentajeGastado)
    }
}

#Preview {
    SpentWeekComponent(viewModel: BudgetViewModel())
}
