//
//  C2_ Servicios.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/02/26.
//
import Foundation

struct C2_Servicios {
    private let urlPostsString =  "https://jsonplaceholder.typicode.com/posts"
    private let urlUsersSTring = "https://jsonplaceholder.typicode.com/users"
    private let urlCommentsString = "https://jsonplaceholder.typicode.com/comments"
    
    func fetchPosts() async throws -> [C2_Post] {
        guard let url = URL(string: self.urlPostsString) else {
            throw C2_NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse else {
            throw C2_NetworkError.invalidResponse
        }
        
        print("HTTP Status: \(http.statusCode)")
        
        guard (200...299).contains(http.statusCode) else {
            throw C2_NetworkError.httpStatus(http.statusCode)
        }
        
        do {
            let decode = try JSONDecoder().decode([C2_Post].self, from: data)
            return decode
        } catch {
            throw C2_NetworkError.decodingError(error)
        }
    }
}
