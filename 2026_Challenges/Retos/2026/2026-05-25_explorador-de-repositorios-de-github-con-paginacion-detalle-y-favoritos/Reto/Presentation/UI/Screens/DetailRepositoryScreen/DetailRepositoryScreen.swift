//
//  DetailRepositoryScreen.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/06/26.
//

import SwiftUI
import Kingfisher

struct DetailRepositoryScreen: View {
    
    let repository: RepositoryEntity
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        GithubAppBackground {
            VStack(alignment: .leading, spacing: 15) {
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
                        Text(self.repository.fullName)
                            .font(.title)
                            .foregroundStyle(.white)
                        HStack {
                            Image(systemName: "person.2.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .foregroundStyle(.gray)
                            Text(self.repository.owner.login)
                                .font(.body)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                HStack {
                    GithubInfoComponent(
                        icon: "star.fill",
                        numbers: repository.starGazersCount,
                        title: "Stars",
                        color: .yellow
                    )
                    
                    GithubInfoComponent(
                        icon: "point.3.connected.trianglepath.dotted",
                        numbers: repository.forksCount,
                        title: "Forks",
                        color: .blue
                    )
                    
                    GithubInfoComponent(
                        icon: "circle.fill",
                        info: repository.language,
                        title: "Stars",
                        color: .orange,
                        isLanguageEmpty: repository.language.isEmpty
                    )
                    
                }
                
                Divider()
                
                Text(repository.description)
                    .foregroundStyle(.gray)
                
                Button {
                    if let url = URL(string: repository.htmlURL ?? "") {
                        openURL(url)
                    }
                } label: {
                    VStack(alignment: .center) {
                        HStack {
                            Text("Abrir en Github")
                                .font(.title3.bold())
                                .frame(maxWidth: .infinity, alignment: .center)


                            Image(systemName: "square.and.arrow.up")
                                .font(.title3.bold())
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundStyle(.white)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                    )

                }
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                    }
                    .foregroundStyle(Color.red)

                    
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .foregroundStyle(Color.white)

                }
            }
        }
    }
}

struct GithubInfoComponent: View {
    let icon: String
    let numbers: Int?
    let info: String?
    let title: String
    let color: Color
    let isLanguageEmpty: Bool?
    
    init(icon: String, numbers: Int? = nil, info: String? = nil, title: String, color: Color, isLanguageEmpty: Bool = false) {
        self.icon = icon
        self.numbers = numbers
        self.info = info
        self.title = title
        self.color = color
        self.isLanguageEmpty = isLanguageEmpty
    }
    var body: some View {
        if  let isLanguageEmpty = self.isLanguageEmpty, !isLanguageEmpty  {
            VStack {
                HStack {
                    Image(systemName: self.icon)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(self.color)
                        .frame(width: 30)
                    if let numbers = self.numbers {
                        Text("\(numbers)")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    } else if let info = self.info {
                        Text(info)
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    }
                }
                Text(self.title)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity)

            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.ultraThinMaterial.opacity(0.2))
            )
        }

    }
}

#Preview {
    NavigationStack {
        DetailRepositoryScreen(repository: RepositoryEntity(
            id: 1,
            name: "Apple",
            fullName: "SwiftUI By Apple",
            description: "Este es un repo creado por apple para que los usuario aprendan Swift y SwiftUI",
            isPrivate: false,
            language: "Swift",
            owner: OwnerEntity(
                login: "Valentino",
                id: 7,
                avatarUrl: "",
                userViewType: "Public"
            ),
            starGazersCount: 5000,
            forksCount: 3000,
            htmlURL: ""
        ))
    }
}
