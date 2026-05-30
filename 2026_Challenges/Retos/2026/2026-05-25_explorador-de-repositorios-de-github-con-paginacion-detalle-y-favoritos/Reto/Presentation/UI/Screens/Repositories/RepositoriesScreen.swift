//
//  RepositoriesScreen.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 30/05/26.
//

import SwiftUI

struct RepositoriesScreen: View {
    @StateObject var viewModel = RepositoryViewModel()
    var body: some View {
        VStack {
            switch viewModel.repositories {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .success(let repos):
                ForEach(repos, id: \.id) { repo in
                    Text(repo.name)
                }
            case .failure(let error):
                Text(error.localizedDescription)
            }
        }
        .task {
            await viewModel.loadRepositories()
        }
    }
}

#Preview {
    RepositoriesScreen(viewModel: RepositoryViewModel())
}
