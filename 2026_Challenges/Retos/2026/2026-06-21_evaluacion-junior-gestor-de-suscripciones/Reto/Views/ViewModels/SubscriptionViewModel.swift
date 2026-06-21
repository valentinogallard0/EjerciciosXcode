//
//  SubscriptionViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 21/06/26.
//

import Foundation
import Combine

class SubscriptionViewModel: ObservableObject {
    @Published var subscriptions: [Suscription] = [
        Suscription(name: "Netflix", price: 200, cycle: .monthly, category: .movies, newRenewalDate: Date(), isActive: true),
        Suscription(name: "Disney+", price: 200, cycle: .monthly, category: .movies, newRenewalDate: Date(), isActive: true),
        Suscription(name: "HBO Max", price: 1500, cycle: .annual, category: .movies, newRenewalDate: Date(), isActive: true),
        Suscription(name: "Spotify", price: 200, cycle: .monthly, category: .music, newRenewalDate: Date(), isActive: true),
        Suscription(name: "Apple Music", price: 999, cycle: .annual, category: .music, newRenewalDate: Date(), isActive: true)

    ]
    
    var totalSubsMontlyCost: Decimal {
        return subscriptions.reduce(0) { $0 + $1.monthlyCost }
    }
}
