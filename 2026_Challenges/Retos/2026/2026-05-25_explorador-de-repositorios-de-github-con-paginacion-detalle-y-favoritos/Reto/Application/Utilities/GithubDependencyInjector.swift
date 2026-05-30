//
//  GithubDependencyInjector.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

final class GithubDependencyInjector {
    
    static let instance = GithubDependencyInjector()
    
    private init() {}
    
    func makeGetRepositoriesUseCase() -> GetRepositoryUseCase {
        let dataSource = HttpDataSource(baseUrl: GithubConstants.GithubNetwork.baseURL)
        let repository = RepositoryDataSourceRemoteRepository(dataSource: dataSource)
        
        return GetRepositoryUseCase(repository: repository)
    }
}
