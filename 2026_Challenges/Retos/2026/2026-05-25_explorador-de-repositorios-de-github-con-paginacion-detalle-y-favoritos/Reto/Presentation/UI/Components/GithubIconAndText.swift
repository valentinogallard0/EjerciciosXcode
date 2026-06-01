//
//  GithubIconAndText.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/06/26.
//

import SwiftUI

struct GithubIconAndText: View {
    
    let icon: String?
    let text: String?
    let isWarning: Bool?
    let isLabel: Bool?
    let iconColor: Color?
    
    init(icon: String? = nil, text: String? = nil, isWarning: Bool? = nil, isLabel: Bool? = nil, iconColor: Color? = nil) {
        self.icon = icon
        self.text = text
        self.isWarning = isWarning
        self.isLabel = isLabel
        self.iconColor = iconColor
    }
    
    var body: some View {
        if self.isWarning == true {
            if let icon = self.icon, let text = self.text {
                VStack(alignment: .center, spacing: 15) {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(Color.red.opacity(0.7))
                    
                    Text(text)
                        .font(.title.bold())
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                }
            }
        } else if self.isLabel == true {
            if let icon = self.icon, let text = self.text {
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundStyle(self.iconColor ?? .gray)
                    Text(text)
                        .font(.caption)
                        .foregroundStyle(Color.white)
                        .lineLimit(1)
                }
                .clipShape(Capsule())
            }
        }
    }
}

#Preview {
    GithubIconAndText(
        icon: "exclamationmark.circle.fill",
        text: "No pudimos cargar los repositorios",
        isLabel: true
    )
}
