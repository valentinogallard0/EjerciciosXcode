//
//  C2_NetworkError.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 01/02/26.
//
import Foundation

enum C2_NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case httpStatus(Int)
    case decodingError(Error)
    
    var errorDescription: String? {
        switch self{
        case .invalidURL: return "URL invalido"
        case .invalidResponse: return "Respuesta invalida"
        case .httpStatus(let status): return "HTTP estatus inesperado \(status)"
        case .decodingError(let err): return "Error decodificado \(err.localizedDescription)"
        }
    }
}
