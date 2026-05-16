//
//  CreateContactError.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 20/04/26.
//

enum CreateContactError {
    case emptyName
    case invalidName
    case emptyEmail
    case invalidEmail
    case emptyPhone
    case invalidPhone
    case invalidNumberLength
    
    var description: String {
        switch self {
        case .emptyName:
            "Name is required"
        case .invalidName:
            "Invalid name"
        case .emptyEmail:
            "Email is required"
        case .invalidEmail:
            "Invalid email"
        case .emptyPhone:
            "Phone is required"
        case .invalidPhone:
            "Invalid phone"
        case .invalidNumberLength:
            "Invalid phone number length"
        }
    }
}
