//
//  C04_2_ListView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 08/04/26.
//
import SwiftUI

struct C04_2_ListView: View {
    @StateObject private var viewModel = C04_2_ListViewModel()
    @State private var showItemForm: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.items.isEmpty {
                    emptyView
                } else {
                    listView
                }
            }
            .toolbar {
                Button {
                    self.showItemForm.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                }
                .sheet(isPresented: $showItemForm) {
                    C04_2_ItemFormView(viewModel: self.viewModel)
                }
            }
        }
    }
    
    private var listView: some View {
        List(viewModel.items) { item in
            Text(item.title)
        }
    }
    
    private var emptyView: some View {
        VStack {
            Text("Lista vacia")
                .font(.title)
                .fontWeight(.bold)
            
            Image(systemName: "list.dash")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(8)
            
            Text("Dale al boton de + para agregar un articulo a la lista")
                .font(.caption)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    C04_2_ListView()
}
