//
//  HttpDataSource.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

import Foundation

struct HttpDataSource: DataSource {
    let baseUrl: String
    
    func execute<E: GithubEndpoint>(endpoint: E) async throws -> Data {
        
        let url = try makeURL(endpoint: endpoint)
        
        var request = URLRequest(url: url)
        request.httpMethod = "\(endpoint.method)".uppercased()
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw GithubRepositoryError.invalidResponse
        }
        
        guard(200...299).contains(httpResponse.statusCode) else {
            print(httpResponse.statusCode)
            print(String(data: data, encoding: .utf8) ?? "")
            throw GithubRepositoryError.invalidResponse
        }
        
        return data
    }
    
    private func makeURL <E: GithubEndpoint>(endpoint: E) throws -> URL {
        
        guard let baseURL = URL(string: self.baseUrl + endpoint.path),
              var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            throw GithubRepositoryError.invalidURL
        }
        
        if let queryParams = endpoint.queryParams {
            components.queryItems =  queryParams.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
        }
        
        guard let url = components.url else {
            throw GithubRepositoryError.invalidURL
        }
        
        return url
    }
}
