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
        NavigationStack {
            GithubAppBackground {
                VStack {
                    HStack {
                        Text("Github")
                            .foregroundStyle(.white)
                        Text("Explorer")
                            .foregroundStyle(.blue)
                    }
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    switch viewModel.repositories {
                    case .idle:
                        EmptyView()
                    case .loading:
                        ProgressView()
                    case .success(let repos):
                        ScrollView {
                            ForEach(repos, id: \.id) { repo in
                                RepositoryComponent(repository: repo)
                            }
                            .padding()
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
    }
}

#Preview {
    RepositoriesScreen()
}
