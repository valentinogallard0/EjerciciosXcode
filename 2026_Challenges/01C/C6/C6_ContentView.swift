//
//  C6_ContentView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 22/01/26.
//

import SwiftUI

struct C6_ContentView: View {
    @StateObject private var viewModel = C6_LoaderViewModel()
    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.statusText)
                .font(.title3)
            
            Button(viewModel.isLoading ? "Cargando..." : "Cargar datos") {
                Task {
                    await viewModel.loadData()
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isLoading)
        }
    }
}
