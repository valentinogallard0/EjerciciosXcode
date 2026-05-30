//
//  GetRepositoryEndpoint.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

struct GetRepositoryEndpoint: GithubEndpoint {
    let query: String
    let page: Int
    
    var path: String {
        "/search/repositories"
    }
    
    var method: GithubEndpointMethod {
        .get
    }
    
    var queryParams: [String : String]? {
        var params: [String : String] = [
            "q": "\(self.query)",
            "page": "\(self.page)"
        ]
        
        return params
    }
}
