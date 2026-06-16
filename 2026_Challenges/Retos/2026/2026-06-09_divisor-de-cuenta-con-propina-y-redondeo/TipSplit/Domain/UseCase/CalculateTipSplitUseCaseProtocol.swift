//
//  CalculateTipSplitUseCaseProtocol.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/06/26.
//

protocol CalculateTipSplitUseCaseProtocol {
    func execute(
        subTotal: Double,
        tipOption: TipOption,
        people: Int,
        roundUp: Bool
    ) -> TipSplit?
}
