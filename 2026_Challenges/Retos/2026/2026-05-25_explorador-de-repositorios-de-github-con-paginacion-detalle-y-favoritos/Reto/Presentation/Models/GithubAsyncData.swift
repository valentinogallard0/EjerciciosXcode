//
//  GithubAsyncData.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

import Foundation

struct GithubAsyncData<T> {
    let data: T?
    let error: Error?
    let status: AsyncDataStatus

    var isInitial: Bool  { status == .initial }
    var isLoading: Bool  { status == .inProgress }
    var hasData: Bool    { data != nil }
    var hasError: Bool   { error != nil }

    static var initial: GithubAsyncData<T> {
        .init(data: nil, error: nil, status: .initial)
    }

    static func inProgress(data: T? = nil) -> GithubAsyncData<T> {
        .init(data: data, error: nil, status: .inProgress)
    }

    static func success(data: T) -> GithubAsyncData<T> {
        .init(data: data, error: nil, status: .success)
    }

    static func failure(_ error: Error) -> GithubAsyncData<T> {
        .init(data: nil, error: error, status: .failure)
    }
}

enum AsyncDataStatus {
    case initial
    case inProgress
    case success
    case failure
}
