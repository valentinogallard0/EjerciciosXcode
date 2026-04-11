//
//  ViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/02/26.
//
import Foundation
import Combine

final class C2_PostViewModel: ObservableObject {
    private var service = C2_Servicios()
    
    @Published private(set) var posts: [C2_Post] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?
    
    func load() async {
        self.isLoading = true
        self.errorMessage = nil
        do {
            let posts = try await self.service.fetchPosts()
            self.posts = posts
            print("Numero de posts: ", posts.count)
            // print("Posts: ", posts.first)
            
        } catch {
            self.errorMessage = (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
            print("Error: ", errorMessage ?? "Desconocido")
        }
        self.isLoading = false
    }
}
