//
//  AddSubscriptionView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 22/06/26.
//

import SwiftUI
import Combine

struct AddSubscriptionView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: SubscriptionViewModel
    @State var name: String = ""
    @State var price: Decimal = 0
    @State var cycle: BillingCycle = .monthly
    @State var category: SuscriptionCategory = .movies
    @State var date: Date = Date()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    TextFieldComponente3(
                        label: "Subscription Name",
                        placeholder: "Netflix, Spotify...",
                        errorMessage: self.viewModel.errorNameIsEmpty,
                        fieldType: .text(self.$name)
                    )
                    
                    TextFieldComponente3(
                        label: "Price",
                        placeholder: "0.00",
                        errorMessage: self.viewModel.errorPriceIsCero,
                        fieldType: .number(self.$price)
                    )
                    
                    label("Billing Cycle")
                        .padding(.top)
                    VStack {
                        Picker("Billing Cyle", selection: $cycle) {
                            ForEach(BillingCycle.allCases, id: \.self) { billing in
                                Text(billing.name)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.systemGray6), lineWidth: 2)
                    }
                    
                    label("Subscription Category")
                        .padding(.top)
                    VStack {
                        Picker("Category", selection: $category) {
                            ForEach(SuscriptionCategory.allCases, id: \.self) { subs in
                                Text("\(subs.name)")
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.systemGray6), lineWidth: 2)
                    }
                    
                    
                    label("Pay Date")
                        .padding(.top)
                    VStack {
                        DatePicker("Select the date", selection: $date, in: Date.now..., displayedComponents: [.date])
                            .datePickerStyle(.graphical)
                    }
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.systemGray6), lineWidth: 2)
                    }
                    
                } // VStack
                .padding()
                .navigationTitle("New Subscription")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add") {
                            do {
                                try self.viewModel.addSubscription(
                                    name: self.name,
                                    price: self.price,
                                    cycle: self.cycle,
                                    category: self.category,
                                    date: self.date
                                )
                                print("Se guardo la subscripcion")
                                self.dismiss()
                            } catch {
                                print(error)
                            }
                        }
                        .disabled(self.name.isEmpty || self.price.isZero)
                    }
                }
            } // ScrollView
        }
    }
    
    private func label(_ text: String) -> some View {
        Text(text)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    AddSubscriptionView(
        viewModel: SubscriptionViewModel(),
        name: "",
        price: 190,
        cycle: .monthly,
        category: .movies,
        date: Date()
    )
}
