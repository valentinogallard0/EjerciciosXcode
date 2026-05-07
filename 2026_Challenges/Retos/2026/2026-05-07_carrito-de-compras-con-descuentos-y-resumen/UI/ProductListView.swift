//
//  ProductListView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 07/05/26.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.products) { product in
                    
                }
            }
        }
    }
}

#Preview {
    ProductListView()
}
