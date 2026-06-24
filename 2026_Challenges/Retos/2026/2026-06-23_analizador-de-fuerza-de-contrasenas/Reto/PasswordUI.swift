//
//  PasswordUI.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 23/06/26.
//

import SwiftUI

struct PasswordUI: View {
    @State var password: String = ""
    var passwordAnalyzer = PasswordAnalyzer()
    var passwordReport: PasswordReport {
        passwordAnalyzer.analyze(password)
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Password", text: $password)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(passwordReport.failed.isEmpty ? Color.green : Color.red, lineWidth: 1)
                            
                    )
            }
            
            VStack(alignment: .leading) {
                ForEach(passwordReport.failed, id: \.self) { failed in
                    Text("x \(failed.descripcion)")
                        .font(.caption)
                        .foregroundStyle(.red)
                }
            }
            .padding(.top, 3)
        }
        .padding()
    }
}

#Preview {
    PasswordUI(
        password: "",
        passwordAnalyzer: PasswordAnalyzer()
    )
}
