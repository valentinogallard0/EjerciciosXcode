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
    @Published var repositories: GithubAsyncData<[RepositoryEntity]> = .idle
    
    private let getRepositoriesUseCase: GetRepositoryUseCase
    
    init(
        getRepositoriesUseCase: GetRepositoryUseCase = GithubDependencyInjector.instance.makeGetRepositoriesUseCase()
    ) {
        self.getRepositoriesUseCase = getRepositoriesUseCase
    }
    
    func loadRepositories() async {
        self.repositories = .loading
        
        do {
            let repos = try await self.getRepositoriesUseCase.execute()
            self.repositories = .success(repos)
        } catch {
            self.repositories = .failure(error)
            self.handleError(error)
        }
    }
}
