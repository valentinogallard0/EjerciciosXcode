//
//  C4_TareasViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/02/26.
//

import Foundation
import Combine

class C4_TareasViewModel: ObservableObject{
    @Published var tareas: [C4_Tareas] = [
        .init(text: "Tender Cama"),
        .init(text: "Tomar agua"),
        .init(text: "Entrenamiento de Basket"),
        .init(text: "Entrenamiento Gym"),
        .init(text: "Lavar los dientes"),
        .init(text: "Lavar platos"),
        .init(text: "Preparar comidas")
    ]
    
    @Published var searchText: String = ""
    
    //Variable computada donde buscamos y retornamos una lista que haga match con nuestra busqueda.
    var filteredTasks: [C4_Tareas] {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return tareas }
        
        return tareas.filter { $0.text.localizedCaseInsensitiveContains(query) }
    }
    
}
