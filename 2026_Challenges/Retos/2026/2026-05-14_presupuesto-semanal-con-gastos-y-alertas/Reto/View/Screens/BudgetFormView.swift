//
//  BudgetFormView.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 16/05/26.
//

import SwiftUI

struct BudgetFormView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: BudgetViewModel
    @State var title: String = ""
    @State var amount: Double? = nil
    @State var category: ExpenseCategory = .food
    @State var weekDay: Weekday = .monday
    @State var note: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Form {
                        Section("Titulo") {
                            TextFieldComponent2(
                                placeholder: "Nombre del gasto",
                                text: self.$title
                            )
                        }
                        
                        Section("Monto") {
                            TextFieldComponent2(placeholder: "Monto", number: self.$amount, isNumber: true)
                        }
                        
                        Section("Nota") {
                            TextFieldComponent2(placeholder: "Nota", text: self.$note, isNote: true)
                        }
                        
                        Section("Categoria") {
                            Picker(selection: self.$category, label: Text("Categoria")) {
                                ForEach(ExpenseCategory.allCases, id: \.self) {
                                    Text($0.rawValue.capitalized)
                                }
                            }
                        }
                        
                        Section("Dia de la semana") {
                            Picker(selection: self.$weekDay, label: Text("Dia de la semana")) {
                                ForEach(Weekday.allCases, id: \.self) {
                                    Text($0.shortName.capitalized).tag($0)
                                }
                            }
                        }
                    }//Form
                }
            } //VStack
            .navigationTitle("Nuevo Gasto")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.viewModel.agregarGasto(
                            titulo: self.title,
                            cantidad: self.amount ?? 0,
                            categoria: self.category,
                            dia: self.weekDay,
                            nota: self.note,
                            diaCreado: Date()
                        )
                        self.dismiss()
                    } label: {
                        Text("Guardar")
                    }
                }
            }
        }
    }
}

#Preview {
    BudgetFormView(viewModel: BudgetViewModel())
}
