//
//  NotesViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 20/05/26.
//
import Foundation
import Combine
import SwiftUI

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = [
        Note(id: UUID(), title: "Nota prueba", body: "", tags: [], createdAt: Date())
    ]
    
    private let key = "notas_guardadas"
    
    init() {
        load()
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decode = try? JSONDecoder().decode([Note].self, from: data) {
            notes = decode
        }
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func add(note: Note) {
        notes.append(note)
        save()
    }
    
    func remove(note: Note) {
        notes.removeAll(where: { $0.id == note.id })
    }
}
