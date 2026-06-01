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

    private let getRepositoriesUseCase: GetRepositoryUseCase

    init(
        getRepositoriesUseCase: GetRepositoryUseCase = GithubDependencyInjector.instance.makeGetRepositoriesUseCase()
    ) {
        self.getRepositoriesUseCase = getRepositoriesUseCase
    }

    func loadRepositories() async {
        repositoriesAsyncData = .inProgress()

        do {
            let repos = try await getRepositoriesUseCase.execute(query: "swiftui", page: 1)
            repositoriesAsyncData = .success(data: repos)
        } catch {
            repositoriesAsyncData = .failure(error)
            handleError(error)
        }
    }
}
