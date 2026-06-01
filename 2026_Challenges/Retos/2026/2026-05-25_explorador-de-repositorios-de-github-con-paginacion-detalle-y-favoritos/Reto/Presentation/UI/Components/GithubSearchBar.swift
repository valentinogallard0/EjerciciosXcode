//
//  GithubSearchBar.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/06/26.
//

import SwiftUI

struct GithubSearchBar: View {
    
    let icon: String = "magnifyingglass"
    let placeholder: String = "Buscar repositorios..."
    @Binding var input: String
    
    var body: some View {
        HStack {
            Image(systemName: self.icon)
                .foregroundColor(.gray)
                .padding()
                
            TextField(self.placeholder, text: self.$input, prompt: Text(self.placeholder).foregroundColor(.gray))
                .foregroundStyle(.gray)
        }
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.ultraThinMaterial.opacity(0.3))
        )
        .overlay {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.white.opacity(0.25), lineWidth: 1)
        }
    }
}

#Preview {
    GithubSearchBar(input: .constant(""))
}
