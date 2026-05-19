//
//  TextFieldComponent2.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 18/05/26.
//

import SwiftUI

struct TextFieldComponent2: View {
    
    let placeholder: String
    @Binding var text: String
    @Binding var number: Double?
    var isNumber: Bool
    var isNote: Bool
    
    init(
        placeholder: String,
        text: Binding<String> = .constant(""),
        number: Binding<Double?> = .constant(nil),
        isNumber: Bool = false,
        isNote: Bool = false
    ) {
        self.placeholder = placeholder
        self._text = text
        self._number = number
        self.isNumber = isNumber
        self.isNote = isNote
    }
    
    var body: some View {
        VStack {
            if isNumber {
                TextField(placeholder, value: $number, format: .number)
                    .keyboardType(.numberPad)
            } else if isNote {
                TextEditor(text: $text)
                    .frame(minHeight: 100)
            }else {
                TextField(placeholder, text: $text)

            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    TextFieldComponent2(
        placeholder: "Prueba", text: .constant("Nombre")
    )
}
