//
//  SuscriptionCategory.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 21/06/26.
//

enum SuscriptionCategory: CaseIterable, Codable {
    case music
    case gym
    case streaming
    case books
    case courses
    case movies
    case videogames
    case others
    
    var name: String {
        switch self {
        case .music: return "Music"
        case .gym: return "Gym"
        case .streaming: return "Streaming"
        case .books: return "Books"
        case .courses: return "Courses"
        case .movies: return "Movies"
        case .videogames: return "Video Games"
        case .others: return "Others"
        }
    }
}
