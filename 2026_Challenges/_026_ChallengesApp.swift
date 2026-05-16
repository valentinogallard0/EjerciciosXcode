//
//  _026_ChallengesApp.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 11/01/26.
//

import SwiftUI
import SwiftData

@main
struct _026_ChallengesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentViewHabit()
        }
        .modelContainer(for: [Habit.self, HabitEntry.self])
    }
}

/*
 C3
 
 ContentView()
     .onAppear(perform: probarJSON)
 
 
 func probarJSON() {
     let persona = C3_Persona(nombre: "Valentino", edad: 25, direccion: C3_Direccion(calle: "Las Gardenias", colonia: "El espinal"))
     let jsonData = try! JSONEncoder().encode(persona)
     let jsonString = String(data: jsonData, encoding: .utf8)
     print("JSON: ", jsonString!)
 }
 
 func probarJSON2() {
     let cadenaJSON = """
         { "nombre" : "Valentino De Paola",
         "edad" : 25 }
         """
     let jsonData = cadenaJSON.data(using: .utf8)!
     let persona = try! JSONDecoder().decode(C3_Persona.self, from: jsonData)
     print("Nombre:", persona.nombre)
     print("Edad: ", persona.edad)
 }
 
 func probarJSON3() {
     let cadenaJSON = """
         [{ "nombre" : "Valentino De Paola", "edad" : 25 },
         { "nombre" : "Leonardo Alvarez", "edad" : 26}]
         """
     let jsonData = cadenaJSON.data(using: .utf8)!
     let personas = try! JSONDecoder().decode([C3_Persona].self, from: jsonData)
     print("Hay \(personas.count) personas en el arreglo")
     for persona in personas {
         print("Nombre: \(persona.nombre)")
     }
 }
 
 
  func probarJSON4() {
      let personas = [
          C3_Persona(nombre: "Valentino", edad: 25),
          C3_Persona(nombre: "Leonardo", edad: 26),
          C3_Persona(nombre: "Alan", edad: 25)
      ]
      let jsonData = try! JSONEncoder().encode(personas)
      let jsonString = String(data: jsonData, encoding: .utf8)
      print("JSON: ", jsonString!)
  }
 */
