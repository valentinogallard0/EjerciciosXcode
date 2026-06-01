//
//  GithubAsyncData.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 29/05/26.
//

import SwiftUI

enum GithubAsyncData<Value> {
    case idle
    case loading
    case success(Value)
    case failure(Error)
}

struct GithubAsyncDataView<Value, Content: View, LoadingContent: View, FailureContent: View>: View {
    
    let state: GithubAsyncData<Value>
    let loading: () -> LoadingContent
    let success: (Value) -> Content
    let failure: (Error) -> FailureContent
    
    var body: some View {
        switch state {
        case .idle:
            EmptyView()
        case .loading:
            loading()
        case .success(let value):
            success(value)
        case .failure(let error):
            failure(error)
        }
    }
}
