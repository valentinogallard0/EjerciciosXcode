//
//  C3_PasswordView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 05/02/26.
//

import SwiftUI

struct C3_PasswordView: View {
    @StateObject var viewModel = C3_ValidationViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack (alignment: .leading, spacing: 2){
                TextField("Password", text: $viewModel.inputPass)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(self.viewModel.isValid ? Color.green : Color.red, lineWidth: 2)
                    )
                    .font(.title2)
                
                VStack {
                    if self.viewModel.isValid == true {
                        Text("Contraseña segura")
                            .foregroundStyle(Color.green)
                            .font(.caption)
                    } else {
                        Text(self.viewModel.errorMessage)
                            .padding(.horizontal)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.red)
                            .font(.caption)

                    }
                }
                .padding(.top, 5)
            }
            
            Button {
                print("Validando...")
                self.viewModel.validate()
            } label: {
                Text("Validar")
            }
            .font(.headline)
            .buttonStyle(.glassProminent)
        }
        .padding()
    }

}

#Preview {
    C3_PasswordView(viewModel: C3_ValidationViewModel())
}


/*
 var body: some View {
     VStack(alignment: .leading, spacing: 20) {
         VStack (alignment: .leading, spacing: 2){
             TextField("Password", text: $viewModel.inputPass)
                 .font(.title2)
             
             if self.viewModel.isValid == true {
                 Text("Validado")
                     .foregroundStyle(Color.green)
                     .font(.caption)
             } else {
                 Text("Texto invalido")
                     .foregroundStyle(Color.red)
                     .font(.caption)

             }
         }
         
         Button {
             print("Validando...")
             self.viewModel.validate()
         } label: {
             Text("Validar")
         }
         .font(.headline)
         .buttonStyle(.glassProminent)
     }
     .padding()
 }
 */
