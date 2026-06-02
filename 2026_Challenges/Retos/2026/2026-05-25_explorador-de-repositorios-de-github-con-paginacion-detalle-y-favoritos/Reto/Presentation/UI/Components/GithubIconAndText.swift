//
//  GithubIconAndText.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/06/26.
//

import SwiftUI

struct GithubIconAndText: View {
    
    let icon: String?
    let image: String?
    let text: String?
    let description: String?
    let isWarningWithIcon: Bool?
    let isWarningWithImage: Bool?
    let isLabel: Bool?
    let iconColor: Color?
    
    init(
        icon: String? = nil,
        image: String? = nil,
        text: String? = nil,
        description: String? = nil,
        isWarningWithIcon: Bool? = nil,
        isWarningWithImage: Bool? = nil,
        isLabel: Bool? = nil,
        iconColor: Color? = nil
    ) {
        self.icon = icon
        self.image = image
        self.text = text
        self.description = description
        self.isWarningWithIcon = isWarningWithIcon
        self.isWarningWithImage = isWarningWithImage
        self.isLabel = isLabel
        self.iconColor = iconColor
    }
    
    var body: some View {
        if self.isWarningWithIcon == true {
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
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .foregroundStyle(self.iconColor ?? .gray)
                    Text(text)
                        .font(.caption)
                        .foregroundStyle(Color.white)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
                .clipShape(Capsule())
            }
        } else if self.isWarningWithImage == true {
            if let image = self.image, let text = self.text, let description = self.description {
                VStack(alignment: .center, spacing: 15) {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                    
                    Text(text)
                        .font(.title.bold())
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text(description)
                        .font(.body)
                        .foregroundStyle(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        
                }
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
