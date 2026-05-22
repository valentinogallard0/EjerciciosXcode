//
//  NewNoteView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 20/05/26.
//

import SwiftUI

struct NoteFormView: View {
    
    @ObservedObject var viewModel: NotesViewModel
    var note: Note?
    @State var title: String = ""
    @State var textNote: String = ""
    @State private var currentNote: Note? = nil
    
    var body: some View {
        VStack {
            TextFieldComponentHeading(
                viewModel: viewModel,
                title: $title,
                currentNote: $currentNote
            )
            TextEditor(text: $textNote)
                .padding(.horizontal)
                .onChange(of: textNote) { _ in
                    if let current = currentNote {
                        let updated = Note(
                            id: current.id,
                            title: title,
                            body: textNote,
                            tags: current.tags,
                            createdAt: current.createdAt
                        )
                        viewModel.update(note: updated)
                    }
                }
            Spacer()
        }
        .onAppear {
            if let note {
                currentNote = note
                title = note.title
                textNote = note.body
            } else {
                 let newNote = Note(
                    id: UUID(),
                    title: "",
                    body: "",
                    tags: [],
                    createdAt: Date()
                 )
                viewModel.add(note: newNote)
                self.currentNote = newNote
            }
        }
    }
}

#Preview {
    NoteFormView(viewModel: NotesViewModel())
}
