//
//  C1_CounterViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 11/01/26.
//
import Combine

class C1_CounterViewModel: ObservableObject {
    
    @Published var count: Int = 0
    
    func incremente(){
        count = count + 1
    }
    
    func decremente(){
        count = count - 1
    }
}
