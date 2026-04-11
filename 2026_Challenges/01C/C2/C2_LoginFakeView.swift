//
//  C2_LoginFakeView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 11/01/26.
//
import SwiftUI

struct C2_LoginFakeView: View {
    
    @StateObject private var viewModel = C2_LoginViewModel()
    
    var body: some View {
        VStack {
            TextField("Username", text: self.$viewModel.inputUserName)
            
            SecureField("Password", text: self.$viewModel.inputPassword)
            
            //Muestra formulario valido o invalido, depende.
            Text(self.viewModel.isFormValid ? "Form is valid" : "Form is invalid")
                .foregroundStyle(self.viewModel.isFormValid ? .green : .red)
                .padding()
            
            //Solo se habilitara si el formulario es valido.
            Button("Login"){}
                .buttonStyle(.borderedProminent)
                .disabled(!self.viewModel.isFormValid)
                .opacity(self.viewModel.isFormValid ? 1 : 0.8)
        }
        .padding()
    }
}

#Preview {
    C2_LoginFakeView()
}
