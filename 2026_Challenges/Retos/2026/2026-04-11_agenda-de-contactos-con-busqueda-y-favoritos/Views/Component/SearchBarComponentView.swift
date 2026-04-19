//
//  SearchBarComponentView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 19/04/26.
//

import SwiftUI

struct SearchBarComponentView: View {
    @Binding var searchText: String
    @FocusState private var isFocused: Bool
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(self.isFocused ? .blue : .gray)
                    .frame(width: 20)
                    .padding(.horizontal, 5)
                TextField("Search", text: $searchText)
                    .focused(self.$isFocused)
            }
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isFocused ? .blue : .gray, lineWidth: 1)
            }
            .animation(.easeInOut(duration: 0.2), value: isFocused)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchBarComponentView(
        searchText: .constant(""),
    )
}
