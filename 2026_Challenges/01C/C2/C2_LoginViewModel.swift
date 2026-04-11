//
//  C2_LoginViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 11/01/26.
//
import Combine

class C2_LoginViewModel: ObservableObject {
    @Published var userName: String = "Prueba"
    @Published var password: String = "1234"
    @Published var inputUserName: String = ""
    @Published var inputPassword: String = ""
    
    var isFormValid: Bool {
        guard self.userName == self.inputUserName, self.password == self.inputPassword else {
            return false
        }
        return true
    }
}

