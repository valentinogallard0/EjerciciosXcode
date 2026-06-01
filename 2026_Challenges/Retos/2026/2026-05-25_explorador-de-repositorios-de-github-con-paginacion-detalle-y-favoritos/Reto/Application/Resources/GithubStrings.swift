//
//  GithubStrings.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/06/26.
//}
import Foundation

extension String {
    var githubLocalizable: String {
        NSLocalizedString(self, tableName: "GithubLocalizable", bundle: .main, value: self, comment: "")
    }
}
