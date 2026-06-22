//
//  TextFieldComponente3.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 22/06/26.
//
import SwiftUI

enum FieldType {
    case text(Binding<String>)
    case number(Binding<Decimal>)
}

struct TextFieldComponente3: View {
    let label: String
    let placeholder: String
    let errorMessage: String?
    let fieldType: FieldType
    var body: some View {
        Text(self.label)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(errorMessage != nil ? .red : .secondary)
        
        Group {
            switch self.fieldType {
            case .text(let binding):
                TextField(self.placeholder, text: binding)
            case .number(let binding):
                TextField(self.placeholder, value: binding, format: .currency(code: "MXN"))
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(self.errorMessage != nil ? .red : Color(.systemGray6)), lineWidth: 2)
        }
        
        if let error = self.errorMessage {
            Text(error)
                .font(.caption)
                .foregroundStyle(.red)
        }
    }
}
