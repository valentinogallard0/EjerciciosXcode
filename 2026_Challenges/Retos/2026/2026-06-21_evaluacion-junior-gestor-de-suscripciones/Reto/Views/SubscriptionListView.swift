//
//  SubscriptionListView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 21/06/26.
//

import SwiftUI

struct SubscriptionListView: View {
    @StateObject var viewModel = SubscriptionViewModel()
    @State private var showForm: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("Total mensual: \(self.viewModel.totalSubsMontlyCost.formatted(.currency(code: "MXN")))")
                    .font(.title.bold())
                List(self.viewModel.subscriptions) { subs in
                    Text(subs.name)
                }
            }
            .navigationDestination(isPresented: self.$showForm) {
                AddSubscriptionView(viewModel: self.viewModel)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button {
                        self.showForm.toggle()
                    } label: {
                        Image(systemName: "plus")

                    }
                })
            }
        }
    }
}

#Preview {
    SubscriptionListView(viewModel: SubscriptionViewModel())
}
