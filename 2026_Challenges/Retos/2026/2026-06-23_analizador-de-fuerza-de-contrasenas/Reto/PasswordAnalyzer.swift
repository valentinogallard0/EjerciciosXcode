//
//  PasswordAnalyzer.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 23/06/26.
//

struct PasswordAnalyzer {
    
    func analyze(_ password: String) -> PasswordReport {
        var points: Int = 0
        var strength: PasswordStrength
        var passed: [PasswordRule] = []
        var failed: [PasswordRule] = []
        
        if password.count >= 8 {
            points += 10
            passed.append(.longitudMinima)
        } else { failed.append(.longitudMinima) }
        
        if password.contains(where: \.isUppercase) {
            points += 10
            passed.append(.tieneMayuscula)
        } else { failed.append(.tieneMayuscula) }
        
        if password.contains(where: \.isLowercase) {
            points += 10
            passed.append(PasswordRule.tieneMinuscula)
        } else { failed.append(.tieneMinuscula) }
        
        if password.contains(where: \.isNumber) {
            points += 10
            passed.append(.tieneNumero)
        } else { failed.append(.tieneNumero) }
        
        if password.contains(where: \.isSymbol) {
            points += 20
            passed.append(.tieneSimbolo)
        } else { failed.append(.tieneSimbolo) }
        
        if password.count != Set(password).count {
            points += 20
            passed.append(.sinRepeticiones)
        } else { failed.append(.sinRepeticiones) }
        
        if containsSecuence(password) {
            points += 20
            passed.append(.sinSecuenciaComun)
        } else { failed.append(.sinSecuenciaComun) }
        
        strength = strengthAssingner(score: points)
        
        return PasswordReport(
                score: points,
                strength: strength,
                passed: passed,
                failed: failed
            )
    }
    
    func containsSecuence(_ password: String) -> Bool {
        return zip(password, password.dropFirst()).contains { $0 == $1 }
    }
    
    func strengthAssingner(score: Int) -> PasswordStrength {
        if score == 20 {
            return .muyDebil
        } else if score == 40 {
            return .debil
        } else if score == 60 {
            return .media
        } else if score == 80 {
            return .fuerte
        } else if score == 100 {
            return .muyFuerte
        } else { return .media }
        
    }
}
