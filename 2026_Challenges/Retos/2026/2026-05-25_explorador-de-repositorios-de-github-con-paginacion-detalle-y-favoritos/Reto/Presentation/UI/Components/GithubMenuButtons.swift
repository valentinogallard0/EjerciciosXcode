//
//  GithubMenuButtons.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/06/26.
//

import SwiftUI

struct GithubMenuButtons: View {
    
    let text: String
    @Binding var isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button {
            self.onTap()
        } label: {
            Text(self.text)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(self.isSelected ? .blue : .gray.opacity(0.4))
                )
        }
    }
}

#Preview {
    GithubMenuButtons(text: "Buscar", isSelected: .constant(true)) {
        
    }
}
