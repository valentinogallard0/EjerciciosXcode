//
//  C02_5_ProductListView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 11/02/26.
//

import Foundation
import SwiftUI

struct C02_5_ProductListView: View {
    
    @StateObject var viewModel = C02_5_CartViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (viewModel.articulos) { articulo in
                    VStack {
                        HStack {
                            Text("\(articulo.producto.nombre)")
                            
                            Spacer()
                            
                             // MARK: Boton decrementar
                             Button {
                                 self.viewModel.decrementar(id: articulo)
                             } label: {
                                 Image(systemName: "minus")
                             }
                            
                            // MARK: Boton incrementar
                            Button {
                                self.viewModel.incrementar(id: articulo)
                            } label: {
                                Image(systemName: "plus")
                            }
                            
                            Text("\(articulo.cantidad)")
                                .padding(.horizontal)
                        }
                        .buttonStyle(.borderless)
                    }
                }
            }
            .navigationTitle("Productos")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.viewModel.clear()
                    } label: {
                        Image(systemName: "eraser.badge.xmark")
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 15) {
                
                //MARK: Cantidad de productos
                HStack {
                    Text("Cantidad: ")
                    Spacer()
                    Text("\(self.viewModel.articulosTotales)")
                }
                
                //MARK: Subtotal
                HStack {
                    Text("Subtotal:")
                    Spacer()
                    Text(self.viewModel.subTotal, format: .currency(code: "USD"))
                        .foregroundStyle(Color.secondary)
                }
                
                //MARK: Total
                HStack {
                    Text("Total: ")
                        .font(.title2)
                    Spacer()
                    Text(self.viewModel.total, format: .currency(code: "USD"))
                        .font(.title2)
                }
            }
            .padding()
        }
    }
}
