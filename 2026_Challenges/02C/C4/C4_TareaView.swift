//
//  C4_TareaView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/02/26.
//

import SwiftUI
import Foundation

struct C4_TareaView: View {
    
    @StateObject var viewModel = C4_TareasViewModel()
    
    var body: some View {
        VStack {
            TextField("Buscar", text: self.$viewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            List {
                ForEach(self.viewModel.filteredTasks) { task in
                    Text(task.text)
                }
            }
        }
    }
}
