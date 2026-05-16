//
//  CartBadgeView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 10/05/26.
//

import SwiftUI

struct CartBadgeView: View {
    
    let count: Int
    var showCart: () -> Void
    
    var body: some View {
        Button {
            showCart()
        } label: {
            ZStack(alignment: .topTrailing) {
                Image(systemName: "cart.fill")
                    .font(.title2)
                    .foregroundStyle(.primary)
                
                if count > 0 {
                    Text("\(self.count)")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(minWidth: 20, minHeight: 20)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x: 10, y: -10)
                    
                }
            }
        }
        .buttonStyle(.plain)

    }
}

#Preview {
    CartBadgeView(count: 4) {
        
    }
}
