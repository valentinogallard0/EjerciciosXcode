//
//  C02_9_TransactionsViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 19/02/26.
//

import Foundation

class C02_9_TransactionsViewModel {
    let transactions: [C02_9_Transaction] = [
        .init(id: "t001", date: d("2026-01-02"), merchant: "OXXO", category: .groceries, amount: 185.50, currency: .MXN, status: .posted, note: nil),
        .init(id: "t002", date: d("2026-01-02"), merchant: "Starbucks", category: .coffee, amount: 98.00, currency: .MXN, status: .posted, note: "latte"),
        .init(id: "t003", date: d("2026-01-03"), merchant: "Uber", category: .transport, amount: 120.00, currency: .MXN, status: .pending, note: nil),
        .init(id: "t004", date: d("2026-01-04"), merchant: "Netflix", category: .subscriptions, amount: 219.00, currency: .MXN, status: .posted, note: "monthly"),
        .init(id: "t005", date: d("2026-01-06"), merchant: "CFE", category: .utilities, amount: 650.00, currency: .MXN, status: .posted, note: nil),
        .init(id: "t006", date: d("2026-01-10"), merchant: "Amazon", category: .shopping, amount: 1499.00, currency: .MXN, status: .posted, note: "headphones"),
        .init(id: "t007", date: d("2026-01-12"), merchant: "Uber", category: .transport, amount: 130.00, currency: .MXN, status: .reversed, note: "driver canceled"),
        .init(id: "t008", date: d("2026-01-14"), merchant: "Taquería El Güero", category: .eatingOut, amount: 240.00, currency: .MXN, status: .posted, note: nil),
        .init(id: "t009", date: d("2026-01-18"), merchant: "Apple", category: .subscriptions, amount: 3.99, currency: .USD, status: .posted, note: "iCloud"),
        .init(id: "t010", date: d("2026-01-20"), merchant: "H-E-B", category: .groceries, amount: 980.75, currency: .MXN, status: .posted, note: "weekly"),
        .init(id: "t011", date: d("2026-02-01"), merchant: "Starbucks", category: .coffee, amount: 110.00, currency: .MXN, status: .posted, note: nil),
        .init(id: "t012", date: d("2026-02-02"), merchant: "Uber", category: .transport, amount: 89.00, currency: .MXN, status: .posted, note: nil),
        .init(id: "t013", date: d("2026-02-03"), merchant: "Spotify", category: .subscriptions, amount: 129.00, currency: .MXN, status: .posted, note: nil),
        .init(id: "t014", date: d("2026-02-04"), merchant: "Amazon", category: .shopping, amount: 49.99, currency: .USD, status: .posted, note: "ebook"),
        .init(id: "t015", date: d("2026-02-05"), merchant: "OXXO", category: .groceries, amount: 75.00, currency: .MXN, status: .posted, note: "snacks"),
        .init(id: "t016", date: d("2026-02-06"), merchant: "Uber", category: .transport, amount: 140.00, currency: .MXN, status: .pending, note: nil),
    ]
    
    /*
     func totalMXNPosted(txs: [C02_9_Transaction]) -> Decimal {
         return txs
             .filter { $0.status == .posted && $0.currency == .MXN }
             .reduce(0) { $0 + $1.amount}
     }
     */
    
    func totalMXNPosted(txs: [C02_9_Transaction]) -> Decimal {
        txs.reduce(into: 0){ total, tx in
            if tx.status == .posted && tx.currency == .MXN {
                total += tx.amount
            }
        }
    }
    
    func pendingTransactions(txs: [C02_9_Transaction]) -> Int {
        txs.reduce(into: 0) { total, tx in
            if tx.status == .pending {
                total += 1
            }
        }
    }
    
    func hasPendingOver(amount: Decimal, in txs: [C02_9_Transaction]) -> Bool {
        txs.contains(where: { $0.status == .pending && $0.amount > amount})
    }
    
    
    func totalsByCurrency(txs: [C02_9_Transaction]) -> [Currency: Decimal] {
        let posted = txs.filter {$0.status == .posted}
        let totals = posted.reduce(into: [Currency: Decimal]()) { result, transaction in
            result[transaction.currency, default: 0] += transaction.amount
        }
        return totals
    }
    
}
