//
//  C6_LoaderViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 22/01/26.
//

import Foundation
import Combine

@MainActor
final class C6_LoaderViewModel: ObservableObject {
    
    @Published var statusText: String = "Esperando..."
    @Published var isLoading: Bool = false
    
    func loadData() async {
            isLoading = true
            statusText = "Cargando datos..."

            try? await Task.sleep(nanoseconds: 2_000_000_000)

            statusText = "Datos cargados ✅"
            isLoading = false
        }
}
