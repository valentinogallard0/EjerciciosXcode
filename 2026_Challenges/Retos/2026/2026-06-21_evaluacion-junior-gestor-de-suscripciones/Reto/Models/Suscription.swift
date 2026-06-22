//
//  Suscription.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 21/06/26.
//
import Foundation

struct Suscription: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var price: Decimal
    var cycle: BillingCycle
    var category: SuscriptionCategory
    var newRenewalDate: Date
    var isActive: Bool = true
    
    var monthlyCost: Decimal {
        switch cycle {
        case .monthly:
            return price
        case .annual:
            return price / 12
        }
    }
}

