//
//  C02_8_CounterView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 19/02/26.
//

import SwiftUI

struct C02_8_CounterView: View {
    @State private var count: Int = -3
    
    var body: some View {
        VStack{
            C02_8_IncremenButton(count: $count)
        }
        .onAppear(){
            count = 0
        }
    }
}

struct C02_8_IncremenButton: View {
    @Binding var count: Int
    var body: some View {
        VStack {
            Text("\(self.count)")
            
            C02_8_StepperButton(count: $count, min: 0, max: 10)
        }
    }
}

struct C02_8_StepperButton: View {
    @Binding var count: Int
    
    var min: Int
    var max: Int
    
    var isAtMin: Bool { count <= min }
    var isAtMax: Bool { count >= max}
    
    var body: some View {
        HStack {
            Button {
                count -= 1
            }label: {
                Image(systemName: "minus")
            }
            .disabled(isAtMin)
            
            Button {
                count += 1
            }label: {
                Image(systemName: "plus")
            }
            .disabled(isAtMax)
        }
    }
}

#Preview {
    VStack {
        C02_8_CounterView()
    }
}
