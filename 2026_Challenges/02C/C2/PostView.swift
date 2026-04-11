//
//  PostView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/02/26.
//

import SwiftUI

struct C2_PostView: View {
    @StateObject private var viewModel = C2_PostViewModel()
    var body: some View {
        VStack {
            Text("Prueba de consola")
                .font(.headline)
            
            if self.viewModel.isLoading {
                ProgressView("Cargando...")
            }
            
            if let error = self.viewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
            }
            
            if let firstPost = self.viewModel.posts.first {
                Text(firstPost.title)
            } else if !self.viewModel.isLoading && self.viewModel.errorMessage == nil {
                Text("Sin posts")
            }
        }
        .task {
            await self.viewModel.load()
        }
    }
}
