//
//  ContacsViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 11/04/26.
//

import Foundation
import Combine

class ContacsViewModel: ObservableObject {
    @Published var contacts: [Contact] = [
        .init(name: "John Doe", email: "john@example.com", phone: "+1234567890", isFavorite: true, category: .work),
        .init(name: "Jane Doe", email: "jane@example.com", phone: "+0987654321", isFavorite: false, category: .personal),
        .init(name: "Alice Smith", email: "alice@example.com", phone: "+1122334455", isFavorite: true, category: .work),
        .init(name: "Bob Johnson", email: "bob@example.com", phone: "+6655443322", isFavorite: false, category: .personal)
    ]
    
    func addContact(name: String, email: String, phone: String, category: Category_01) {
        guard !name.isEmpty, !email.isEmpty, !phone.isEmpty else { return }
        let contact = Contact(name: name, email: email, phone: phone, category: category)
        contacts.append(contact)
    }
    
    func deleteContat(id: UUID) {
        let contact = contacts.first(where: { $0.id == id })
        if let contact {
            contacts.removeAll(where: { $0.id == contact.id })
        } else {
            return
        }
    }
}
