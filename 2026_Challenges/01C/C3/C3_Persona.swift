//
//  C3_Persona.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 15/01/26.
//

class C3_Persona: Codable {
    var nombre: String
    var edad: Double
    var direccion: C3_Direccion
    
    init(nombre: String, edad: Double, direccion: C3_Direccion){
        self.nombre = nombre
        self.edad = edad
        self.direccion = direccion
    }
}
