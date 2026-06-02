//
//  RespositoriesViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

import Foundation
import Combine

@MainActor
final class RepositoryViewModel: GithubViewModel {
    @Published var repositoriesAsyncData: GithubAsyncData<[RepositoryEntity]> = .initial
    @Published var searchText: String = ""
    @Published var favoritesRepositories: [RepositoryEntity] = []

    private let getRepositoriesUseCase: GetRepositoryUseCase
    private var cancellables = Set<AnyCancellable>()

    init(
        getRepositoriesUseCase: GetRepositoryUseCase = GithubDependencyInjector.instance.makeGetRepositoriesUseCase()
    ) {
        self.getRepositoriesUseCase = getRepositoriesUseCase
        super.init()
        search()
    }

    private func search() {
        self.$searchText
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines)}
            .debounce(for: .milliseconds(900), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] query in
                Task {
                    guard !query.isEmpty else {
                        await MainActor.run {
                            self?.repositoriesAsyncData = .initial
                        }
                        return
                    }
                    
                    await self?.loadRepositories(query: query)

                }
            }
            .store(in: &cancellables)
    }

    func loadRepositories(query: String) async {
        repositoriesAsyncData = .inProgress()

        do {
            let repos = try await getRepositoriesUseCase.execute(query: query, page: 1)
            repositoriesAsyncData = .success(data: repos)
        } catch {
            repositoriesAsyncData = .failure(error)
            handleError(error)
        }
    }
    
    func addToFavorites(repository: RepositoryEntity) {
        if favoritesRepositories.contains(where: { $0.id == repository.id }) {
            favoritesRepositories.removeAll() { $0.id == repository.id }
        } else {
            favoritesRepositories.append(repository)
        }
    }
    
    func isFavorite(repository: RepositoryEntity) -> Bool {
        favoritesRepositories.contains(where: { $0.id == repository.id})
    }
}
