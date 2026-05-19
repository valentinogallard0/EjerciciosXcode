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
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Week of Nov 11")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    HStack {
                        Text("Budget")
                            .font(.title.bold())
                        Spacer()
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
                    
                    VStack {
                        Text("BY CATEGORY")
                            .font(.callout)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    
                    CategoryExpendComponent(viewModel: viewModel)
                    
                    VStack {
                        Text("EXPENSES")
                            .font(.callout)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    
                    ExpenseListComponent(viewModel: viewModel)
                    
                    Spacer()
                }//Vstack
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
                    BudgetFormView(viewModel: viewModel)
                }
            } //ScrollView
        } //NavigationStack
    }
}

#Preview {
    ResumenView(viewModel: BudgetViewModel())
}
