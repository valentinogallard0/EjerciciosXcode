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
                        Text("github-title".githubLocalizable)
                            .foregroundStyle(.white)
                        Text("github-title2".githubLocalizable)
                            .foregroundStyle(.blue)
                    }
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    GithubAsyncDataView(state: viewModel.repositories) {
                        ProgressView()
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } success: { repos in
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                ForEach(repos, id: \.id) { repo in
                                    RepositoryComponent(repository: repo)
                                }
                            }
                            .padding()
                        }
                    } failure: { error in
                        GithubIconAndText(
                            icon: "exclamationmark.circle.fill",
                            text: "repository-error".githubLocalizable
                        )
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
