//
//  TipSplitView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/06/26.
//

import SwiftUI

struct TipSplitView: View {
    
    @StateObject var viewModel: TipSplitViewModel
    
    var body: some View {
        VStack {
            customTextField
            tipsFieldComponent
        }
    }
    
    private var customTextField: some View {
        VStack(alignment: .leading){
            Text("Monto de la cuenta")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            HStack {
                Text("$")
                    .foregroundStyle(.secondary)
                TextField("0.00", text: self.$viewModel.subtotalInput)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue.opacity(0.05))
            )
        }
        .padding()
    }
    
    private var tipsFieldComponent: some View {
        VStack {
            HStack {
                Text("Propina")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Spacer()
                Text("\(self.viewModel.selectedTipOption.description)")
                    .font(.callout)
                    .foregroundStyle(.green)
            }
            
            Picker("Tips", selection: self.$viewModel.selectedTipOption) {
                ForEach(TipOption.allCases, id: \.self){ option in
                    Text(option.description).tag(option)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}

#Preview {
    TipSplitView(
        viewModel: TipSplitViewModel(
            calculateUseCase: MockCalculateTipSplitUseCase(),
            configRepository: MockTipConfigRepository()
        )
    )
}


// Solo para previews y tests
final class MockCalculateTipSplitUseCase: CalculateTipSplitUseCaseProtocol {
    func execute(subTotal subtotal: Double, tipOption: TipOption, people: Int, roundUp: Bool) -> TipSplit? {
        TipSplit(
            subtotal: 100,
            tip: 15,
            total: 115,
            perPerson: 57.5,
            roundedPerPerson: 58,
            roundingExtra: 1
        )
    }
}

final class MockTipConfigRepository: TipConfigRepositoryProtocol {
    func saveLastConfig(tipOption: TipOption, people: Int) {}
    func loadLastConfig() -> (tipOption: TipOption, people: Int)? { nil }
}
