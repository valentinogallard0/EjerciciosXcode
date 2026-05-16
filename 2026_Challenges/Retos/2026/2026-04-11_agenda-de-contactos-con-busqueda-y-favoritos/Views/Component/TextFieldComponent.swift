//
//  TextFieldComponent.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 12/04/26.
//

import SwiftUI

struct TextFieldComponent: View {
    var title: String
    var placeholder: String
    var icon: String
    var error: String?
    
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var overLineColor: Color {
        if isFocused {
            return .blue
        } else if error != nil {
            return .red
        } else {
            return .gray
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: self.icon)
                    .foregroundStyle(overLineColor)
                    .frame(width: 20)
                    .padding(.horizontal, 5)
                
                VStack(alignment: .leading) {
                    Text(self.title)
                        .fontWeight(.bold)
                    TextField(placeholder, text: $text)
                        .focused(self.$isFocused)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(overLineColor)
            }
            .animation(.easeInOut(duration: 0.2), value: isFocused)
            VStack(alignment: .leading) {
                if let error = self.error {
                    Text(error)
                        .font(.subheadline.italic())
                        .foregroundColor(.red.opacity(0.7))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    TextFieldComponent(
        title: "Text Field",
        placeholder: "Placeholder",
        icon: "person",
        error: "Error",
        text: .constant(""))
}
