//
//  TipConfigRepositoryProtocol.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/06/26.
//

protocol TipConfigRepositoryProtocol {
    func saveLastConfig(tipOption: TipOption, people: Int)
    func loadLastConfig() -> (tipOption: TipOption, people: Int)?
}
