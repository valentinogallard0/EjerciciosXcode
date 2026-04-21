//
//  FormContactView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 12/04/26.
//
import SwiftUI

struct FormContactView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var category: Category_01 = .personal
    @State private var favorite: Bool = false
    @ObservedObject var viewModel: ContacsViewModel
    var body: some View {
        VStack {
            HStack {
                Button {
                    self.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .buttonStyle(.glass)
                Text("Nuevo Contacto")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Button("Guardar") {
                    let success = self.viewModel.addContact(
                        name: self.name,
                        email: self.email,
                        phone: self.phone,
                        category: self.category,
                        favorite: self.favorite
                    )
                    if success { self.dismiss() }
                }
                .buttonStyle(.bordered)
            }
            .padding()
            Divider()
            
            VStack(spacing: 20) {
                TextFieldComponent(
                    title: "Nombre",
                    placeholder: "Ingresa el nombre del contacto",
                    icon: "person",
                    error: viewModel.nameError,
                    text: self.$name
                )
                
                TextFieldComponent(
                    title: "Email",
                    placeholder: "Ingresa el email del contacto",
                    icon: "envelope",
                    error: viewModel.emailError,
                    text: self.$email
                )
                
                TextFieldComponent(
                    title: "Numero",
                    placeholder: "Ingresa el numero del contacto",
                    icon: "phone",
                    error: viewModel.phoneError,
                    text: self.$phone
                )
                
                Picker("Categoria del contacto", selection: self.$category) {
                    ForEach(Category_01.allCases, id: \.self) { c in
                        Text(c.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                        .font(.system(size: 10))
                    Toggle("Marcar como favorito", isOn: self.$favorite)
                }

                                
            }
            .padding(.horizontal)
            
            Spacer()
            
        }
    }
}
