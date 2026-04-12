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
    var viewModel: ContacsViewModel
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Nombre") {
                        TextField("Nombre del contacto", text: self.$name)
                    }
                    Section("Email") {
                        TextField("Correo del contacto", text: self.$email)
                    }
                    Section("Numero") {
                        TextField("Numero del contacto", text: self.$phone)
                    }
                    Section("Categoria") {
                        Picker("Categoria", selection: self.$category) {
                            ForEach(Category_01.allCases, id: \.self) { c in
                                Text(c.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
            }
            .navigationTitle("Nuevo Contacto")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancelar") {
                        self.dismiss()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button("Guardar") {
                        self.viewModel.addContact(
                            name: self.name,
                            email: self.email,
                            phone: self.phone,
                            category: self.category
                        )
                    }
                }
            }
        }
    }
}
