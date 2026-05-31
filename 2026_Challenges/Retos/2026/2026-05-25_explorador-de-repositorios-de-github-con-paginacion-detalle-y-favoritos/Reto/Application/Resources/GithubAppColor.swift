//
//  GithubAppColor.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 30/05/26.
//

import Foundation
import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

enum GithubAppColor {
    
    static let background = Color(UIColor(hex: "#060C16"))
    static let text1 = Color(UIColor(hex: "#F8FAFC"))
    
    /*
     * Fondo principal: #060C16
     * Fondo secundario: #101827
     * Cards / superficies: #151F31
     * Bordes sutiles: #243044
     * Azul principal: #0A84FF
     * Azul eléctrico: #006DFF
     * Morado acento: #7C3AED
     * Cyan acento: #22D3EE
     * Texto principal: #F8FAFC
     * Texto secundario: #AAB4C3
     * Texto terciario: #64748B
     * Favorito / corazón: #FF3B7A
     * Error: #FF375F
     * Warning / Rate limit: #FF9500
     * Éxito: #30D158
     * Swift chip: #F05138
     * JavaScript chip: #F7DF1E
     * TypeScript chip: #3178C6
     * Python chip: #3776AB
     * Go chip: #00ADD8
     * Gradiente botón: #0A84FF → #7C3AED
     */
}

#if canImport(UIKit)
private extension UIColor {
    convenience init(hex: String) {
        let hex = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")

        var value: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&value)

        let red: CGFloat
        let green: CGFloat
        let blue: CGFloat
        let opacity: CGFloat

        switch hex.count {
        case 6:
            red = CGFloat((value & 0xFF0000) >> 16) / 255
            green = CGFloat((value & 0x00FF00) >> 8) / 255
            blue = CGFloat(value & 0x0000FF) / 255
            opacity = 1
        case 8:
            red = CGFloat((value & 0xFF000000) >> 24) / 255
            green = CGFloat((value & 0x00FF0000) >> 16) / 255
            blue = CGFloat((value & 0x0000FF00) >> 8) / 255
            opacity = CGFloat(value & 0x000000FF) / 255
        default:
            red = 0
            green = 0
            blue = 0
            opacity = 1
        }

        self.init(red: red, green: green, blue: blue, alpha: opacity)
    }
}
#endif
