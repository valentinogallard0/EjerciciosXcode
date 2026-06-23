//
//  SubscriptionListView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 21/06/26.
//

import SwiftUI

struct SubscriptionListView: View {
    @StateObject var viewModel = SubscriptionViewModel()
    @State private var showForm: Bool = false
    @State private var selectedButton: Bool = false
    @State private var filterSheetPresented: Bool = false
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Total mensual: \(self.viewModel.totalSubsMontlyCost.formatted(.currency(code: "MXN")))")
                    .font(.title.bold())
                    .padding(.horizontal)
                
                self.filterCategories
                
                List(self.viewModel.searchResult()) { subs in
                    VStack {
                        Text(subs.name)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.thinMaterial)
                    )
                }
                .searchable(text: self.$viewModel.searchText)
                .scrollContentBackground(.hidden)
            }
            .navigationDestination(isPresented: self.$showForm) {
                AddSubscriptionView(viewModel: self.viewModel)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button {
                        self.showForm.toggle()
                    } label: {
                        Image(systemName: "plus")

                    }
                })
            }
            .sheet(isPresented: self.$filterSheetPresented, content: {
                self.filterPriceAndDate
            })
        }
    }
    
    private var filterPriceAndDate: some View {
        VStack(alignment: .leading) {
            Text("Price filter")
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading )
            Toggle("Mayor a menor", isOn: self.$viewModel.filterGreaterToLower )
                .toggleStyle(.automatic)
            Spacer()
        }
        .padding()
    }
    
    private var filterCategories: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {
                    self.filterSheetPresented.toggle()
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.system(size: 35))
                }
                Button("All"){
                    self.viewModel.selectedCategory = nil
                }
                .buttonStyle(.borderedProminent)
                .tint(self.viewModel.selectedCategory == nil ? .accentColor : .gray.opacity(0.5))
                ForEach(SuscriptionCategory.allCases, id: \.self) { category in
                    Button {
                        self.viewModel.selectedCategory = category
                        print(self.viewModel.selectedCategory ?? "")
                    } label: {
                        Text(category.name)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(self.viewModel.selectedCategory == category ? .accentColor : .gray.opacity(0.5))
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SubscriptionListView(viewModel: SubscriptionViewModel())
}
