//
//  C04_2_ListViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 08/04/26.
//

import Combine

class C04_2_ListViewModel: ObservableObject {
    @Published var items: [C04_2_List] = [
        /*
         .init(title: "Item 1"),
         .init(title: "Item 2"),
         .init(title: "Item 3")
         */
    ]
    
    func addItem(text: String) {
        guard !text.isEmpty else { return }
        let item = C04_2_List(title: text)
        items.append(item)
    }
}
