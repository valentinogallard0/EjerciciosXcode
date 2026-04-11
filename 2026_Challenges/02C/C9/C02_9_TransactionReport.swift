//
//  C02_9_TransactionReport.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 21/02/26.
//

import Foundation

struct C02_9_TransactionReport {
    let totalPostedByCurrency: [Currency: Decimal]
    let pendingCount: Int
    let suspicious: [C02_9_Transaction]
    let topCategoryMXNPosted: (category: Category, total: Decimal)?
    
    /*
     func makeReport(from txs: [C02_9_Transaction]) -> C02_9_TransactionReport {
         let pendingCount = txs.reduce(into: 0) { count, tx in
             if tx.status == .pending {
                 count += 1
             }
         }
         
         let totalPostedByCurrency = txs.reduce(into: [Currency: Decimal]()) { result, tx in
             if tx.isPosted {
                 result[tx.currency, default: 0] += tx.amount
             }
         }
         
         let suspicious = txs.filter { $0.isSuspicious }
         
         let totalsByCategoryMXN = txs.reduce(into: [Category: Decimal]()) {count, tx in
             if tx.isPosted && tx.currency == .MXN {
                 count[tx.category, default: 0] += tx.amount
             }
         }
         
         let top = totalsByCategoryMXN.max(by: { $0.value < $1.value})
         
         return C02_9_TransactionReport(
             totalPostedByCurrency: totalPostedByCurrency,
             pendingCount: pendingCount,
             suspicious: suspicious,
             topCategoryMXNPosted: <#T##(category: Category, total: Decimal)?#>
         )
     }
     */
}
