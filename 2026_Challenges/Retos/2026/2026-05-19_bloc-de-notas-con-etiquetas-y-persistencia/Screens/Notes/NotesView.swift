//
//  NotesView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 20/05/26.
//

import SwiftUI

struct NotesView: View {
    
    @StateObject var viewModel = NotesViewModel()
    @State var showNewNoteScreen: Bool = false
    @State var selectedNote: Note? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.notes) { note in
                        NotePreviewComponent(note: note)
                            .onTapGesture {
                                self.selectedNote = note
                                self.showNewNoteScreen = true
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    self.viewModel.remove(note: note)
                                } label: {
                                    Image(systemName: "trash")
                                    Text("Eliminar")
                                }
                            }
                    }
                }
            } //VStack
            .navigationTitle("Notes")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        selectedNote = nil
                        self.showNewNoteScreen = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(isPresented: $showNewNoteScreen) {
                NoteFormView(viewModel: viewModel, note: selectedNote)
            }
            
        }
    }
}

#Preview {
    NotesView(viewModel: NotesViewModel())
}
