//
//  PasswordRule.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 23/06/26.
//

enum PasswordRule: CaseIterable {
    case longitudMinima
    case tieneMayuscula
    case tieneMinuscula
    case tieneNumero
    case tieneSimbolo
    case sinRepeticiones
    case sinSecuenciaComun
    
    var descripcion: String {
        switch self {
        case .longitudMinima: return "Debe tener al menos 8 caracteres"
        case .tieneMayuscula: return "Debe tener al menos una mayúscula"
        case .tieneMinuscula: return "Debe tener al meno una minuscula"
        case .tieneNumero: return "Debe tener al menos un número"
        case .tieneSimbolo: return "Debe tener al menos un símbolo"
        case .sinRepeticiones: return "No debe tener letras repetidas"
        case .sinSecuenciaComun: return "No debe tener secuencias comunes"
        }
    }
}
