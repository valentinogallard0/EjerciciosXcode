//
//  C3_ValidationViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 05/02/26.
//
import Combine
import Foundation

class C3_ValidationViewModel: ObservableObject {
    @Published var isValid: Bool = false
    @Published var inputPass: String = ""
    @Published var errorMessage: String = ""
    @Published var errorList: [String] = []
    
    private func containsMayus(input: String) -> Bool {
        if input.contains(where: { $0.isUppercase }) {
            return true
        } else { return false }
    }
    
    private func containsSpecialChar(input: String) -> Bool {
        if input.contains("!") || input.contains("?") || input.contains("#") || input.contains("@") {
            return true
        } else { return false }
    }
    
    private func containsLowerCase(input: String) -> Bool {
        if input.contains(where: { $0.isLowercase }) {
            return true
        } else { return false }
    }
    
    private func containsNumbers(input: String) -> Bool {
        if input.contains(where: { $0.isNumber }) {
            return true
        } else { return false }
    }
    
    private func tieneEspacios(input: String) -> Bool {
        if input.rangeOfCharacter(from: .whitespacesAndNewlines) == nil {
            return true
        } else { return false }
    }
    
    func validate() -> Bool {
        //var errorCount: Int = 0
        self.isValid = false
        self.errorMessage = ""
        self.errorList = []
        let input = self.inputPass
        
        if input.count < 8 {
            self.errorList.append(InvalidPassword.lessThan8Characters.descripcion)
        } else if input.count > 20 {
            self.errorList.append(InvalidPassword.moreThan20Characters.descripcion)
        }
        
        if self.tieneEspacios(input: input) == false {
            self.errorList.append(InvalidPassword.hasSpaces.descripcion)
        }
        if self.containsMayus(input: input) == false {
            self.errorList.append(InvalidPassword.noUppercaseLetters.descripcion)
        }
        if self.containsLowerCase(input: input) == false {
            self.errorList.append(InvalidPassword.noLowercaseLetters.descripcion)
        }
        if self.containsSpecialChar(input: input) == false {
            self.errorList.append(InvalidPassword.noSpecialCharacters.descripcion)
        }
        if self.containsNumbers(input: input) == false {
            self.errorList.append(InvalidPassword.noNumbers.descripcion)
        }
        if self.errorList.isEmpty {
            self.isValid = true
            return true
        } else {
            self.errorMessage = self.errorList.joined(separator: "\n")
            self.isValid = false
            return false
        }
    }
    
    enum InvalidPassword {
        case hasSpaces
        case lessThan8Characters
        case moreThan20Characters
        case noUppercaseLetters
        case noLowercaseLetters
        case noSpecialCharacters
        case noNumbers
        
        var descripcion: String {
            switch self {
            case .hasSpaces:
                return "La contraseña no debe de contener ningun espacio."
            case .lessThan8Characters:
                return "La contraseña debe de tener mas de 8 caracteres."
            case .moreThan20Characters:
                return "La contraseña no debe de tener mas de 20 caracteres"
            case .noUppercaseLetters:
                return "La contraseña debe de tener al menos 1 caracter en mayusculas."
            case .noLowercaseLetters:
                return "La contraseña debe contener al menos 1 caracter en minusculas"
            case .noSpecialCharacters:
                return "La contraseña debe contener al menos un caracter especial !?#@"
            case .noNumbers:
                return "La contraseña debe de contener al menos un numero."
            }
        }
    }
}


/*
 
 func validate() -> Bool {
     self.isValid = false
     let input = self.inputPass
     guard input.rangeOfCharacter(from: .whitespacesAndNewlines) == nil else {
         self.errorMessage = InvalidPassword.hasSpaces.descripcion
         return false
     }
     guard input.count >= 8 && input.count <= 20 else {
         if input.count < 8 {
             self.errorMessage = InvalidPassword.lessThan8Characters.descripcion
         } else if input.count > 20 {
             self.errorMessage = InvalidPassword.moreThan20Characters.descripcion
         }
         return false
     }
     guard self.containsMayus(input: input) else {
         self.errorMessage = InvalidPassword.noUppercaseLetters.descripcion
         return false
     }
     guard self.containsLowerCase(input: input) else {
         self.errorMessage = InvalidPassword.noLowercaseLetters.descripcion
         return false
     }
     guard self.containsSpecialChar(input: input) else {
         self.errorMessage = InvalidPassword.noSpecialCharacters.descripcion
         return false
     }
     guard self.containsNumbers(input: input) else {
         self.errorMessage = InvalidPassword.noNumbers.descripcion
         return false
     }
     self.errorMessage = ""
     self.isValid = true
     return true
 }
 
 */
