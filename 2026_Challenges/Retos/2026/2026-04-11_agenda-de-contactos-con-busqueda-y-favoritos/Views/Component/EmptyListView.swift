//
//  EmptyListView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 19/04/26.
//
import SwiftUI

struct EmptyListView: View {
    
    @Binding var showFormSheet: Bool
    var icon: String
    var caption: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: self.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .foregroundStyle(.blue.opacity(0.7))
            Text(self.caption)
                .font(.subheadline.bold())
                .foregroundStyle(Color.secondary)
                .multilineTextAlignment(.center)
                .padding()
            Button("Agregar contacto") {
                self.showFormSheet = true
            }
            .buttonStyle(.borderedProminent)
            .fontWeight(.bold)
        }
    }
}

#Preview {
    EmptyListView(
        showFormSheet: .constant(false),
        icon: "person",
        caption: "Lista vacia, para agregar un nuevo contacto haz clic en el boton +"
    )
}
