//
//  NotePreviewComponent.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 20/05/26.
//

import SwiftUI

struct NotePreviewComponent: View {
    
    var note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(note.title)
                .fontWeight(.bold)
            HStack {
                Text(note.createdAt.shortDate())
                if note.body.isEmpty {
                    Text("No hay texto adicional")
                } else {
                    Text(note.body)
                }
            }
            .font(.caption)
            .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    NotePreviewComponent(
        note: Note(id: UUID(), title: "Prueba", body: "", tags: [], createdAt: Date())
    )
}
