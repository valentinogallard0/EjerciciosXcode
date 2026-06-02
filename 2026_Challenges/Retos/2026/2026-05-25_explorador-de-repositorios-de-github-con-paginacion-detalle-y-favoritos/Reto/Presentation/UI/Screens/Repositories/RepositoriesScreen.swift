//
//  RepositoriesScreen.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 30/05/26.
//

import SwiftUI

struct RepositoriesScreen: View {
    
    @StateObject var viewModel = RepositoryViewModel()
    @State var isSelectedSearch: Bool = true
    @State var isSelectedFavorites: Bool = false

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
                    
                    GithubSearchBar(input: self.$viewModel.searchText)
                        .padding(.horizontal)
                    
                    HStack{
                        GithubMenuButtons(text: "Buscar", isSelected: self.$isSelectedSearch) {
                            self.isSelectedSearch = true
                            self.isSelectedFavorites = false
                        }
                        GithubMenuButtons(text: "Favoritos", isSelected: self.$isSelectedFavorites) {
                            self.isSelectedFavorites = true
                            self.isSelectedSearch = false
                        }
                    }
                    .padding()
                    if isSelectedSearch {
                        let repos = viewModel.repositoriesAsyncData.data ?? []

                        if viewModel.repositoriesAsyncData.isLoading {
                            ProgressView()
                                .foregroundStyle(Color.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        } else if viewModel.repositoriesAsyncData.hasError {
                            GithubIconAndText(
                                icon: "exclamationmark.circle.fill",
                                text: "repository-error".githubLocalizable
                            )
                        } else if viewModel.repositoriesAsyncData.isInitial {
                            GithubIconAndText(
                                image: "emptyStateGithub",
                                text: "No encontramos repositorios.",
                                description: "Intenta con otro termino de busqueda.",
                                isWarningWithImage: true
                            )
                        }  else {
                            ScrollView {
                                LazyVStack(spacing: 12) {
                                    ForEach(repos, id: \.id) { repo in
                                        NavigationLink{
                                            DetailRepositoryScreen(repository: repo)
                                        } label: {
                                            RepositoryComponent(
                                                repository: repo,
                                                isFavorite: self.viewModel.isFavorite(repository: repo)
                                            ) {
                                                self.viewModel.addToFavorites(repository: repo)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    } else if isSelectedFavorites {
                        if self.viewModel.favoritesRepositories.isEmpty {
                            GithubIconAndText(
                                image: "empty-state-favorites",
                                text: "Aun no tienes favoritos",
                                description: "Marca repositorios que te interesen para verlos aqui.",
                                isWarningWithImage: true
                            )
                        } else {
                            let favoritesRepos = self.viewModel.favoritesRepositories
                            ScrollView {
                                LazyVStack(spacing: 12) {
                                    ForEach(favoritesRepos, id: \.id) { repo in
                                        NavigationLink{
                                            DetailRepositoryScreen(repository: repo)
                                        } label: {
                                            RepositoryComponent(
                                                repository: repo,
                                                isFavorite: self.viewModel.isFavorite(repository: repo)
                                            ) {
                                                self.viewModel.addToFavorites(repository: repo)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}



#Preview {
    RepositoriesScreen()
}
