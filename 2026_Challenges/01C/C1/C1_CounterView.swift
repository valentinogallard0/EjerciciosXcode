//
//  C1_CounterView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 11/01/26.
//

import SwiftUI

struct C1_CounterView: View {
    
    @ObservedObject var viewModel: C1_CounterViewModel
    
    var body: some View {
        VStack {
            Text("\(self.viewModel.count)")
            
            HStack {
                Button("-"){
                    self.viewModel.decremente()
                }
                .buttonStyle(.glass)
                
                Button("+"){
                    self.viewModel.incremente()
                }
                .buttonStyle(.glass)
            }
        }
    }
}
