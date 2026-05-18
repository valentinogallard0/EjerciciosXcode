//
//  TestView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 15/05/26.
//
import SwiftUI

struct ResumenView: View {
    
    @StateObject var viewModel = BudgetViewModel()
    @State var showBudgetFormView: Bool = false
        
    var body: some View {
        NavigationStack {
            VStack {
                Text("Week of Nov 11")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                HStack {
                    Text("Budget")
                        .font(.title.bold())
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "sun.max")
                    }
                    .buttonStyle(.glass)
                }
                .padding(.horizontal)
                
                SpentWeekComponent(viewModel: viewModel)
                    .padding(.horizontal)
                
                HStack {
                    HighestSpentComponent(viewModel: viewModel)
                    DailyAverageView(viewModel: viewModel)
                }
                .padding(.horizontal)
                .frame(maxWidth:.infinity)

                Spacer()
                
                VStack {
                    ForEach(viewModel.gastosSemana) { gasto in
                        HStack {
                            Text(gasto.title)
                            Spacer()
                            Text("\(gasto.amount, specifier: "%.2f")")
                        }
                    }
                    
                    HStack {
                        Text("Total gastado: ")
                        Spacer()
                        Text("\(viewModel.totalGastado, specifier: "%.2f")")
                    }
                    .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showBudgetFormView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .frame(width: 50, height: 50)
                }
            }
            .navigationDestination(isPresented: self.$showBudgetFormView) {
                BudgetFormView()
            }
        }
    }
}

#Preview {
    ResumenView(viewModel: BudgetViewModel())
}
