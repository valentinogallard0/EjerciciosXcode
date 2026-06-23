//
//  SubscriptionViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 21/06/26.
//

import Foundation
import Combine

@MainActor
class SubscriptionViewModel: ObservableObject {
    @Published var subscriptions: [Suscription] = [
        Suscription(name: "Netflix", price: 200, cycle: .monthly, category: .movies, newRenewalDate: Date()),
        Suscription(name: "Disney+", price: 200, cycle: .monthly, category: .movies, newRenewalDate: Date()),
        Suscription(name: "HBO Max", price: 1500, cycle: .annual, category: .movies, newRenewalDate: Date()),
        Suscription(name: "Spotify", price: 200, cycle: .monthly, category: .music, newRenewalDate: Date()),
        Suscription(name: "Apple Music", price: 999, cycle: .annual, category: .music, newRenewalDate: Date())

    ]
    @Published var selectedCategory: SuscriptionCategory? = nil
    @Published var filterGreaterToLower: Bool = false
    @Published var errorNameIsEmpty: String? = nil
    @Published var errorPriceIsCero: String? = nil
    @Published var searchText: String = ""
    
    var totalSubsMontlyCost: Decimal {
        return subscriptions.reduce(0) { $0 + $1.monthlyCost }
    }
    
    func addSubscription(name: String, price: Decimal, cycle: BillingCycle, category: SuscriptionCategory, date: Date) throws {
        guard !name.isEmpty else {
            self.errorNameIsEmpty = "Name is required"
            throw CreateContactError2.nameIsEmpty
        }
        guard price > 0  else {
            self.errorPriceIsCero = "Price must be greater than 0"
            throw CreateContactError2.priceIsCero
        }
        
        let newSub = Suscription(
            name: name,
            price: price,
            cycle: cycle,
            category: category,
            newRenewalDate: date,
        )
        
        self.subscriptions.append(newSub)
        self.errorNameIsEmpty = nil
        self.errorPriceIsCero = nil
    }
    
    func searchResult(category: String? = nil) -> [Suscription] {
        var subs = subscriptions
        
        if selectedCategory != nil {
            subs = subs.filter { $0.category == selectedCategory }
        }
        
        if self.filterGreaterToLower {
            subs = subs.sorted { $0.price > $1.price }
        }
        
        if searchText.isEmpty {
            return subs
        } else {
            return subs.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
}
