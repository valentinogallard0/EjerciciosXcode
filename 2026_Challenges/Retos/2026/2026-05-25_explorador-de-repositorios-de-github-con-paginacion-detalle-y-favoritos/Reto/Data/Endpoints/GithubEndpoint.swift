//
//  GithubEndpoint.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

protocol GithubEndpoint {
    var path: String { get }
    var method: GithubEndpointMethod { get }
    var queryParams: [String: String]? { get }
    var body: [String: String]? { get }
    var headers: [String: String]? { get }
}

extension GithubEndpoint {
    var queryParams: [String: String]? { nil }
    var body: [String: String]? { nil }
    var headers: [String: String]? { nil }
}

enum GithubEndpointMethod {
    case get
    case post
    case put
    case delete
}
