//
//  NewNoteView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 20/05/26.
//

import SwiftUI

struct NewNoteView: View {
    
    @ObservedObject var viewModel: NotesViewModel
    
    var body: some View {
        
    }
}

#Preview {
    NewNoteView(viewModel: NotesViewModel())
}
