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
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.notes) { note in
                        NotePreviewComponent(note: note)
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
                        self.showNewNoteScreen = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(isPresented: $showNewNoteScreen) {
                NewNoteView(viewModel: viewModel)
            }
            
        }
    }
}

#Preview {
    NotesView(viewModel: NotesViewModel())
}
