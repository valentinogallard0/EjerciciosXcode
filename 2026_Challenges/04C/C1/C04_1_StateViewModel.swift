//
//  C04_1_StateViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 07/04/26.
//
import Combine

@MainActor
class C04_1_StateViewModel: ObservableObject {
    @Published var state: C04_1_ViewState = .loading
    var posts: [C04_1_Post] = [
        .init(title: "Post 1"),
        .init(title: "Post 2"),
        .init(title: "Post 3"),
        .init(title: "Post 4"),
    ]
    
    func fetchPosts() {
        Task {
            self.state = .loading
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            let successRate = Int.random(in: 0...10)
            if successRate < 7 {
                self.state = .success(posts)
            } else {
                self.state = .error("Error")
            }
        }
    }
}
