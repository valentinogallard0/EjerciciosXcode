//
//  ProgressBarComponent.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 17/05/26.
//

import SwiftUI

struct ProgressBarComponent: View {
    
    var categoryName: String
    var total: Double
    var presupuesto: Double
    var color: Color
    
    private var porcentajeGastado: Double {
        guard presupuesto > 0 else { return 0 }
        return (total * 100) / presupuesto
    }
    
    private var progressValue: Double {
        min(max(porcentajeGastado / 100, 0), 1)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(categoryName)
                    .fontWeight(.semibold)
                Spacer()
                Text("$\(self.total, specifier: "%.0f")")
            }
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.gray)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(self.color)
                        .frame(width: geometry.size.width * self.progressValue)
                }
            }
            .frame(height: 10)
            .animation(.easeInOut, value: progressValue)
        }
    }
}

#Preview {
    ProgressBarComponent(categoryName: "Shopping", total: 320, presupuesto: 5000, color: Color.blue)
}
