//
//  C02_10_Book.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 22/02/26.
//

import Foundation

enum Genre: String, CaseIterable { case fiction, nonfiction, scifi, fantasy, mystery, biography, kids, unknown }
enum LoanStatus: String { case active, returned, overdue }

struct C02_10_Book: Identifiable, Hashable {
    let id: String
    let title: String
    let author: String
    let genre: Genre
    let pages: Int
    let publishedYear: Int
}

struct Member: Identifiable, Hashable {
    let id: String
    let name: String
    let email: String?
}

struct Loan: Identifiable {
    let id: String
    let memberId: String
    let bookId: String
    let startDate: Date
    let dueDate: Date
    let returnDate: Date?
}

func dd(_ iso: String) -> Date {
    let f = ISO8601DateFormatter()
    f.formatOptions = [.withFullDate]
    return f.date(from: iso) ?? .distantPast
}




let books: [C02_10_Book] = [
    .init(id: "b001", title: "Dune", author: "Frank Herbert", genre: .scifi, pages: 412, publishedYear: 1965),
    .init(id: "b002", title: "The Hobbit", author: "J.R.R. Tolkien", genre: .fantasy, pages: 310, publishedYear: 1937),
    .init(id: "b003", title: "Sapiens", author: "Yuval Noah Harari", genre: .nonfiction, pages: 498, publishedYear: 2011),
    .init(id: "b004", title: "Sherlock Holmes", author: "Arthur Conan Doyle", genre: .mystery, pages: 307, publishedYear: 1892),
    .init(id: "b005", title: "Harry Potter 1", author: "J.K. Rowling", genre: .fantasy, pages: 223, publishedYear: 1997),
    .init(id: "b006", title: "Clean Code", author: "Robert C. Martin", genre: .nonfiction, pages: 464, publishedYear: 2008),
    .init(id: "b007", title: "The Martian", author: "Andy Weir", genre: .scifi, pages: 369, publishedYear: 2011),
    .init(id: "b008", title: "Steve Jobs", author: "Walter Isaacson", genre: .biography, pages: 656, publishedYear: 2011),
    .init(id: "b009", title: "Matilda", author: "Roald Dahl", genre: .kids, pages: 240, publishedYear: 1988),
    .init(id: "b010", title: "Unknown Title", author: "Unknown", genre: .unknown, pages: 120, publishedYear: 0),
]

let members: [Member] = [
    .init(id: "m001", name: "Ana", email: "ana@mail.com"),
    .init(id: "m002", name: "Luis", email: nil),
    .init(id: "m003", name: "Carla", email: "carla@mail.com"),
    .init(id: "m004", name: "Pedro", email: "pedro@mail.com"),
]



let loans: [Loan] = [
    .init(id: "l001", memberId: "m001", bookId: "b001", startDate: d("2026-02-01"), dueDate: d("2026-02-10"), returnDate: d("2026-02-08")),
    .init(id: "l002", memberId: "m001", bookId: "b006", startDate: d("2026-02-05"), dueDate: d("2026-02-15"), returnDate: nil),
    .init(id: "l003", memberId: "m002", bookId: "b002", startDate: d("2026-01-10"), dueDate: d("2026-01-20"), returnDate: d("2026-01-25")),
    .init(id: "l004", memberId: "m003", bookId: "b003", startDate: d("2026-02-02"), dueDate: d("2026-02-12"), returnDate: nil),
    .init(id: "l005", memberId: "m003", bookId: "b007", startDate: d("2026-01-01"), dueDate: d("2026-01-10"), returnDate: d("2026-01-09")),
    .init(id: "l006", memberId: "m004", bookId: "b009", startDate: d("2026-02-10"), dueDate: d("2026-02-17"), returnDate: nil),
    .init(id: "l007", memberId: "m004", bookId: "b010", startDate: d("2026-01-15"), dueDate: d("2026-01-25"), returnDate: nil),
]

extension Loan {
    var activeLoans: Int {
        loans.filter({ $0.dueDate >= Date() && $0.returnDate == nil }).count
    }
}
