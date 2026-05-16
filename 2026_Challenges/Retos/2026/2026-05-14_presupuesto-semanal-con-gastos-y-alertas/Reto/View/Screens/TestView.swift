//
//  TestView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 15/05/26.
//
import SwiftUI

struct TestView: View {
    
    @StateObject var viewModel = BudgetViewModel()
    @State var showBudgetFormView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("Presupuesto Inicial: \(viewModel.presupuesto, specifier: "%.2f")")
                        .font(.title2)
                    Text("Presupuesto despues de gastos: \(viewModel.restante, specifier: "%.2f")")
                        .font(.title2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Spacer()
                
                VStack {
                    ForEach(viewModel.gastos) { gasto in
                        HStack {
                            Text(gasto.title)
                            Spacer()
                            Text("\(gasto.amount, specifier: "%.2f")")
                        }
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        Text("Total gastado: ")
                        Spacer()
                        Text("\(viewModel.totalGastado, specifier: "%.2f")")
                    }
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Presupuesto")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showBudgetFormView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(isPresented: self.$showBudgetFormView) {
                BudgetFormView()
            }
        }
    }
}

#Preview {
    TestView(viewModel: BudgetViewModel())
}
