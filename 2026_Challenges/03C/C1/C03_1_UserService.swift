//
//  C03_1_UserService.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/03/26.
//
import SwiftUI

class C03_1_UserService {
    func fetchName() -> String {
        "Carlos"
    }
}


struct C03_1_ProfileView: View {
    let service: C03_1_UserService
    
    init(service: C03_1_UserService){
        self.service = service
    }
    
    var body: some View {
        VStack {
            Text(service.fetchName())
            
            //C03_1_UserView(username: service.fetchName())
        }
    }
}
