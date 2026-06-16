//
//  TipConfigRepositoryImpl.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/06/26.
//

final class TipConfigRepositoryImpl: TipConfigRepositoryProtocol {
    
    private var lasTipOption: TipOption?
    private var lastPeople: Int?
    
    func saveLastConfig(tipOption: TipOption, people: Int) {
        lasTipOption = tipOption
        lastPeople = people
    }
    
    func loadLastConfig() -> (tipOption: TipOption, people: Int)? {
        guard let tipOption = lasTipOption,
              let people = lastPeople else { return nil }
        return (tipOption, people)
    }
}
