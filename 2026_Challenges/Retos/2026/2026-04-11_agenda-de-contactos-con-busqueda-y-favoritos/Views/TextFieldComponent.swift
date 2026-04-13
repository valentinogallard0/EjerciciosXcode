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
    
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            Image(systemName: self.icon)
                .foregroundStyle(isFocused ? .blue : .gray)
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
                .stroke(isFocused ? Color.blue : Color.clear, lineWidth: 1.5)
        }
        .animation(.easeInOut(duration: 0.2), value: isFocused)

    }
}

#Preview {
    TextFieldComponent(title: "Text Field", placeholder: "Placeholder", icon: "person", text: .constant(""))
}
