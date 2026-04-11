//
//  C02_10_BookDashboard.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 22/02/26.
//

import Foundation

struct LibraryDashboard {
    let activeLoansCount: Int
    let overdueLoansCount: Int
    let topBorrowers: [(member: Member, activeLoans: Int)]
    let mostPopularGenres: [(genre: Genre, loans: Int)]
    let booksMissingMetadata: [C02_10_Book]
    
    /*
     func makeDashboard(books: [C02_10_Book], members: [Member], loans: [Loan], today: Date) -> LibraryDashboard {
         
         let activeLoans = loans.filter({ $0.returnDate == nil && $0.dueDate >= Date()}).count
         
         let overdueLoan = loans.filter({ $0.returnDate == nil && $0.dueDate < Date()}).count
         
         let activeCountByMemberId = loans.reduce(into: [String: Int]()) { count, loan in
             if loan.returnDate == nil && loan.dueDate >= Date() {
                 count[loan.memberId, default: 0] += 1
             }
         }
         let membersById = Dictionary(uniqueKeysWithValues: members.map {($0.id, $0)})
         
         let topBorrowers = activeCountByMemberId.compactMap { (memberId, count) -> (member: Member, activeLoans: Int)? in
             guard let member = membersById[memberId] else { return nil }
             return (member: member, activeLoans: count)
         }
             .sorted { $0.activeLoans > $1.activeLoans}
             .prefix(2)
         let topBorrowersArray = Array(topBorrowers)
         
         
         
         return LibraryDashboard(
             activeLoansCount: activeLoans,
             overdueLoansCount: overdueLoan,
             topBorrowers: [topBorrowersArray],
             mostPopularGenres: [],
             booksMissingMetadata: []
         )
     }
     */
}
