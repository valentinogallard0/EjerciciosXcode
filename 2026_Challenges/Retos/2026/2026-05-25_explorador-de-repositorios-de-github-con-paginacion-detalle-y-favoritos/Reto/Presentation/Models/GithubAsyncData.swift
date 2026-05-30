//
//  GithubAsyncData.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//



enum GithubAsyncData<Value> {
    case idle
    case loading
    case success(Value)
    case failure(Error)
}
