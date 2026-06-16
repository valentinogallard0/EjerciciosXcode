//
//  TipSplitViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/06/26.
//

import Combine

@MainActor
final class TipSplitViewModel: ObservableObject {
    
    // MARK: Dependencias inyectadas
    private let calculateUseCase: CalculateTipSplitUseCaseProtocol
    private let configRepository: TipConfigRepositoryProtocol
    
    // MARK: Sources of truth (lo que el usuario controla)
    @Published var subtotalInput: String = ""
    @Published var selectedTipOption: TipOption = .fifteen
    @Published var numberOfPeople: Int = 2
    @Published var roundUp: Bool = false
    
    init(
        calculateUseCase: CalculateTipSplitUseCaseProtocol,
        configRepository: TipConfigRepositoryProtocol
    ) {
        self.calculateUseCase = calculateUseCase
        self.configRepository = configRepository
        
        if let last = configRepository.loadLastConfig() {
            self.selectedTipOption = last.tipOption
            self.numberOfPeople = last.people
        }
    }
    
    var resutl: TipSplit? {
        guard let subtotal = Double(subtotalInput) else { return nil }
        return calculateUseCase.execute(
            subTotal: subtotal,
            tipOption: selectedTipOption,
            people: numberOfPeople,
            roundUp: roundUp
        )
    }
    
    var subtotalIsValid: Bool {
        guard let subtotal = Double(self.subtotalInput) else { return false }
        return subtotal > 0
    }
    
    // MARK: Intenciones del usuario
    func tipOtionalChange(_ option: TipOption) {
        selectedTipOption = option
        persistConfig()
    }
    
    func numberOfPeopleChange(_ count: Int) {
        numberOfPeople = max(1, count)
        persistConfig()
    }
    
    func reset() {
        self.subtotalInput = ""
        self.selectedTipOption = .fifteen
        self.numberOfPeople = 2
        self.roundUp = false
    }
    
    private func persistConfig() {
        configRepository.saveLastConfig(
            tipOption: self.selectedTipOption,
            people: self.numberOfPeople
        )
    }
}
