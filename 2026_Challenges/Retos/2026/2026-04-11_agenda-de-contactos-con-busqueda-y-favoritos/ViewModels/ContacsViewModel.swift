//
//  ContacsViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 11/04/26.
//

import Combine
import SwiftUI

class ContacsViewModel: ObservableObject {
    @Published var contacts: [Contact] = [
        .init(name: "John Doe", email: "john@example.com", phone: "1234567890", isFavorite: true, category: .work),
        .init(name: "Jane Doe", email: "jane@example.com", phone: "0987654321", isFavorite: false, category: .personal),
        .init(name: "Alice Smith", email: "alice@example.com", phone: "1122334455", isFavorite: true, category: .work),
        .init(name: "Bob Johnson", email: "bob@example.com", phone: "6655443322", isFavorite: false, category: .personal)
    ]
    @Published var nameError: String? = nil
    @Published var emailError: String? = nil
    @Published var phoneError: String? = nil
    @Published var isFiltersActive: Bool = false
    @Published var selectedCategory: Category_01? = nil
    @Published var showOnlyFavorites: Bool = false

    func filteredContacts(searchText: String, category: Category_01?, onlyFavorites: Bool) -> [Contact] {
        contacts.filter { contact in
            let textMatch: Bool
            if searchText.isEmpty {
                textMatch = true
            } else {
                let query = searchText.lowercased()
                textMatch = contact.name.lowercased().contains(query)
                || contact.email.lowercased().contains(query)
                || contact.phone.lowercased().contains(query)
            }
            
            let categoryMatch = category == nil || contact.category == category
            let favoriteMatch = !onlyFavorites || contact.isFavorite
            
            return textMatch && categoryMatch && favoriteMatch
        }
    }
    
    func toggleFavorite(contact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index].isFavorite.toggle()
        }
    }
    
    func addContact(name: String, email: String, phone: String, category: Category_01, favorite: Bool) -> Bool {
        nameError = nil
        emailError = nil
        phoneError = nil

        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPhone = phone.trimmingCharacters(in: .whitespacesAndNewlines)

        var hasErrors = false

        if trimmedName.isEmpty {
            nameError = CreateContactError.emptyName.description
            hasErrors = true
        }

        if trimmedEmail.isEmpty {
            emailError = CreateContactError.emptyEmail.description
            hasErrors = true
        } else if !trimmedEmail.contains("@") {
            emailError = CreateContactError.invalidEmail.description
            hasErrors = true
        }

        if trimmedPhone.isEmpty {
            phoneError = CreateContactError.emptyPhone.description
            hasErrors = true
        } else if trimmedPhone.count != 10 {
            phoneError = CreateContactError.invalidNumberLength.description
            hasErrors = true
        }

        if hasErrors { return false }

        let contact = Contact(
            name: trimmedName,
            email: trimmedEmail,
            phone: trimmedPhone,
            isFavorite: favorite,
            category: category
        )

        contacts.append(contact)
        return true
    }

    
    func deleteContat(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
}
