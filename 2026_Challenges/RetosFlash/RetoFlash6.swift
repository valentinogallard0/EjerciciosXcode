//
//  RetoFlash6.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 17/06/26.
//
import Foundation
import Combine

// Data
class DependencyInjector {
    static let instance = DependencyInjector()
    private var dependencies: [String: Any] = [:]
    private init() {}
    
    func register<T>(_ factory: () -> T, key: String? = nil) {
        let key: String = key ?? "\(T.self)"
        self.dependencies[key] = factory()
    }
    
    func get<T>() -> T? {
        let key = "\(T.self)"
        return self.dependencies[key] as? T
    }
}

struct ArticleDTO: Decodable {
    let id: Int
    let title: String
    let url: String
    var isFavorite: Bool
    
    func toEntity() -> ArticleEntity {
        ArticleEntity(
            id: self.id,
            title: self.title,
            url: self.url,
            isFavorite: self.isFavorite
        )
    }
}

final class NewsRemoteDataSource: NewsDataSourceProtocol {
    var news: [ArticleDTO] = [
        ArticleDTO(id: 1, title: "Hat Trick de Messi", url: "url1", isFavorite: true),
        ArticleDTO(id: 2, title: "SpaceX en la bolsa", url: "url2", isFavorite: false),
        ArticleDTO(id: 3, title: "Samuel planta 1 millon de arboles", url: "url3", isFavorite: false)
    ]
    
    func getAll() async throws -> [ArticleDTO] {
        return self.news
    }
    
    func saveFavoriteNews(id: Int) async throws {
        guard let index = news.firstIndex(where: { $0.id == id }) else { return }
        news[index].isFavorite = true
    }
}

final class NewsRepositoryImp: NewsRepositoryProtocol {
    let dataSource: NewsDataSourceProtocol
    init(dataSource: NewsDataSourceProtocol) {
        self.dataSource = dataSource
    }
    func getNews() async throws -> [ArticleEntity] {
        return try await self.dataSource.getAll().map{ $0.toEntity() }
    }
    func saveFavoriteNews(id: Int) async throws {
        try await self.dataSource.saveFavoriteNews(id: id)
    }
}




// Domain
struct ArticleEntity {
    let id: Int
    let title: String
    let url: String
    var isFavorite: Bool
}

enum NewsError: Error {
    case alreadyFavorite
    case idDontExists
}

protocol NewsDataSourceProtocol {
    func getAll() async throws -> [ArticleDTO]
    func saveFavoriteNews(id: Int) async throws
}

protocol NewsRepositoryProtocol {
    func getNews() async throws -> [ArticleEntity]
    func saveFavoriteNews(id: Int) async throws
}

struct GetNewsUseCase {
    let repository: NewsRepositoryProtocol
    init(repository: NewsRepositoryProtocol) {
        self.repository = repository
    }
    func call() async throws -> [ArticleEntity] {
        let news = try await self.repository.getNews()
        return news
    }
}

struct SaveFavoriteUseCase {
    let repostiroy: NewsRepositoryProtocol
    init(repostiroy: NewsRepositoryProtocol) {
        self.repostiroy = repostiroy
    }
    func call(article: ArticleEntity) async throws {
        guard !article.isFavorite else { throw NewsError.alreadyFavorite }
        try await self.repostiroy.saveFavoriteNews(id: article.id)
    }
}


// Presentation

@MainActor
class NewsViewModel: ObservableObject {
    @Published var news: [ArticleEntity] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    let getNewsUseCase: GetNewsUseCase
    let saveFavoriteNewsUseCase: SaveFavoriteUseCase
    
    init(getNewsUseCase: GetNewsUseCase, saveFavoriteNewsUseCase: SaveFavoriteUseCase) {
        self.getNewsUseCase = getNewsUseCase
        self.saveFavoriteNewsUseCase = saveFavoriteNewsUseCase
        self.getAll()
    }
    
    func getAll() {
        Task {
            self.isLoading = true
            defer { self.isLoading = false }
            do {
                self.news = try await self.getNewsUseCase.call()
            } catch {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func saveFavoritesNews(id: Int) {
        guard let article = news.first(where: { $0.id == id }) else { return }
        Task {
            self.isLoading = true
            defer { self.isLoading = false }
            do {
                try await self.saveFavoriteNewsUseCase.call(article: article)
            } catch {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
