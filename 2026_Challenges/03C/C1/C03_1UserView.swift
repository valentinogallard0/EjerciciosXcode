//
//  C03_1UserView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/03/26.
//

import SwiftUI
import Combine

protocol NotificationService {
    func send(message: String) -> String
}

struct EmailService: NotificationService {
    func send(message: String) -> String {
        return "Email sent"
    }
}

struct PushService: NotificationService {
    func send(message: String) -> String {
        return "Push sent"
    }
}

class AlertViewModel: ObservableObject {
    private let service: NotificationService
    
    init(service: NotificationService){
        self.service = service
    }
    
    func alert(text: String) -> String {
        return service.send(message: text)
    }
}

struct AlertView: View {
    @StateObject var vm: AlertViewModel
    var body: some View {
        Button("Enviar alerta") {
            vm.alert(text: "Hola!!!")
        }
    }
}
