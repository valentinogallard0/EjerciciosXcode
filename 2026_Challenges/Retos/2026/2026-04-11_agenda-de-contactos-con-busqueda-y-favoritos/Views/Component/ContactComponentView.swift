//
//  ContactComponentView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 12/04/26.
//

import SwiftUI

struct ContactComponentView: View {
    let contact: Contact
    var onToggleFavorite: () -> Void
    var size: CGFloat = 50
    var color: Color = .blue

    var body: some View {
        HStack {
            Circle()
                .fill(color.opacity(0.2))
                .frame(width: size, height: size)
                .overlay(
                    Text(contact.iniciales())
                        .font(.system(size: size * 0.35, weight: .medium))
                        .foregroundColor(color)
                )
            
            VStack(alignment: .leading) {
                Text(self.contact.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(self.contact.category.rawValue)
                    .font(.caption)
                    .fontWeight(.light)
            }
            
            Spacer()
            
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                    onToggleFavorite()
                }
            } label: {
                Image(systemName: contact.isFavorite ? "star.fill" : "star")
                    .foregroundStyle(contact.isFavorite ? .yellow : .gray)
            }
        }
    }
}
