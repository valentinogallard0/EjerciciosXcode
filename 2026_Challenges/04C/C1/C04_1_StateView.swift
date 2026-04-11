//
//  C04_1_StateView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 07/04/26.
//
import SwiftUI

struct C04_1_StateView: View {
    @StateObject private var viewModel = C04_1_StateViewModel()
    var body: some View {
        content
            .task {
                viewModel.fetchPosts()
            }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .success(let posts):
            List(posts) { post in
                Text(post.title)
            }
        case .error(let error):
            VStack {
                Text(error)
                Button("Reintentar") {
                    viewModel.fetchPosts()
                }
            }
        }
    }
}
