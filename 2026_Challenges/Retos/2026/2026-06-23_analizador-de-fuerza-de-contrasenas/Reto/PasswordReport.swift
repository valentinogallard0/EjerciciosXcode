//
//  PasswordReport.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 23/06/26.
//

struct PasswordReport {
    var score: Int
    var strength: PasswordStrength
    var passed: [PasswordRule]
    var failed: [PasswordRule]
}
