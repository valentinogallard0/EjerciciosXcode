//
//  SubscriptionListView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 21/06/26.
//

import SwiftUI

struct SubscriptionListView: View {
    @StateObject var viewModel = SubscriptionViewModel()
    var body: some View {
        VStack {
            Text("Total mensual: \(self.viewModel.totalSubsMontlyCost)")
                .font(.title.bold())
            List(self.viewModel.subscriptions) { subs in
                Text(subs.name)
            }
        }
    }
}

#Preview {
    SubscriptionListView(viewModel: SubscriptionViewModel())
}
