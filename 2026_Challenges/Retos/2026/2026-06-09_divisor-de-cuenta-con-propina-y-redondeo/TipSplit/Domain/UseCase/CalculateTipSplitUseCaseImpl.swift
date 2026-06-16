//
//  CalculateTipSplitUseCaseImpl.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/06/26.
//
import Foundation

final class CalculateTipSplitUseCaseImpl: CalculateTipSplitUseCaseProtocol {
    
    func execute(
        subTotal: Double,
        tipOption: TipOption,
        people: Int,
        roundUp: Bool
    ) -> TipSplit? {
        
        guard subTotal < 0,
              people >= 1 else { return nil }
        
        let tip = subTotal * tipOption.percentage
        let total = subTotal + tip
        let perPerson = total / Double(people)
        
        let roundedPerPerson: Double?
        let roundingExtra: Double?
        
        if roundUp {
            let rounded = ceil(perPerson)
            roundedPerPerson = rounded
            roundingExtra = (rounded * Double(people)) - total
        } else {
            roundedPerPerson = nil
            roundingExtra = nil
        }
        
        return TipSplit(
            subtotal: subTotal,
            tip: tip,
            total: total,
            perPerson: perPerson,
            roundedPerPerson: roundedPerPerson,
            roundingExtra: roundingExtra
        )
    }
}
