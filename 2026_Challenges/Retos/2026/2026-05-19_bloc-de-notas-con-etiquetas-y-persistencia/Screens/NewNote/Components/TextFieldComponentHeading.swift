//
//  TextFieldComponentHeading.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 22/05/26.
//
import SwiftUI

struct TextFieldComponentHeading: View {
    
    @ObservedObject var viewModel: NotesViewModel
    @Binding var title: String
    @Binding var currentNote: Note?
    
    var body: some View {
        VStack {
            TextField("", text: $title)
                .font(.system(size: 35, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
                .onChange(of: title) { _ in
                    if let current = currentNote {
                        let updated = Note(
                            id: current.id,
                            title: title,
                            body: current.body,
                            tags: current.tags,
                            createdAt: current.createdAt
                        )
                        viewModel.update(note: updated)
                    }
                }
        }
        .padding()
    }
}

#Preview {
    TextFieldComponentHeading(
        viewModel: NotesViewModel(),
        title: .constant(""),
        currentNote: .constant(nil)
    )
}
