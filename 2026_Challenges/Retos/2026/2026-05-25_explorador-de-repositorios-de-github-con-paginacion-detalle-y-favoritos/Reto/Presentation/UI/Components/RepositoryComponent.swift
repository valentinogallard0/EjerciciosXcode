//
//  RepositoryComponent.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 30/05/26.
//

import SwiftUI
import Kingfisher

struct RepositoryComponent: View {
    
    let repository: RepositoryEntity
    
    var body: some View {
        GithubAppBackground {
            HStack {
                KFImage(URL(string: repository.owner.avatarUrl))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 70, height: 70)
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(repository.fullName)")
                            .foregroundStyle(Color.white)
                            .font(.title3.bold())
                            .lineLimit(1)
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                                .foregroundStyle(Color.red)
                                .font(.title2)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    
                    Text("\(repository.description)")
                        .foregroundStyle(Color.gray)
                        .lineLimit(2)
                    
                    HStack {
                        GithubIconAndText(
                            icon: "circle.fill",
                            text: "\(self.repository.language)",
                            isLabel: true,
                            iconColor: randomColor()
                        )
                        Spacer()
                        
                        GithubIconAndText(
                            icon: "star",
                            text: "\(self.repository.starGazersCount)",
                            isLabel: true,
                            iconColor: .gray
                        )
                        Spacer()
                        
                        GithubIconAndText(
                            icon: "point.3.connected.trianglepath.dotted",
                            text: "\(self.repository.forksCount)",
                            isLabel: true,
                            iconColor: .gray
                        )
                        
                        Spacer()
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial.opacity(0.3))
            )
            .overlay {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.white.opacity(0.25), lineWidth: 1)
            }
            
        }
    }
    
    private func randomColor() -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

#Preview {
    RepositoryComponent(repository: RepositoryEntity.defaultValue)
}
