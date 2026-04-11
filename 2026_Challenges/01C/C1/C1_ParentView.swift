//
//  C1_ParentView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 11/01/26.
//

import SwiftUI

struct C1_ParentView: View {
    
    @StateObject var viewModel = C1_CounterViewModel()
    @State var isOn: Bool = false
    
    var body: some View {
        VStack {
            Toggle("Mostrar Contador", isOn: $isOn)
            
            
            if isOn {
                C1_CounterView(viewModel: viewModel)
            }
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    C1_ParentView(viewModel: C1_CounterViewModel())
}
