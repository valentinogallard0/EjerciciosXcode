//
//  RepositoryComponent.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 30/05/26.
//

import SwiftUI

struct RepositoryComponent: View {
    
    let repository: RepositoryEntity
    
    var body: some View {
        GithubAppBackground {
            HStack {
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
}

#Preview {
    RepositoryComponent(repository: RepositoryEntity.defaultValue)
}
