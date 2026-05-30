//
//  DataSource.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

import Foundation

protocol DataSource {
    func execute <E: GithubEndpoint>(endpoint: E) async throws -> Data
}
