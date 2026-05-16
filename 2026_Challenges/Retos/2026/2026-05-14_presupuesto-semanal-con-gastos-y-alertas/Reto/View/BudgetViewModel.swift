//
//  BudgetViewModel.swift
//  2026_Challenges
//
//  Created by Valentino De Paola Gallardo on 15/05/26.
//
import Foundation
import Combine

class BudgetViewModel: ObservableObject {
    @Published var presupuesto: Double = 5000
    //@Published var totalGastado: Double = 0
    //@Published var restante: Double = 0
    //@Published var porcentajeUsado: Double = 0
    
    @Published var gastos: [Expense] = MockData.expenses
    
    
    var totalGastado: Double {
        let totalGastado = gastos.reduce(0) { $0 + $1.amount }
        print("Total gastado: \(totalGastado)")
        return totalGastado
    }
    
    var restante: Double {
        presupuesto - totalGastado
    }
    
    var porcentajeGastado: Double {
        /*
         presupuesto = 5000 - 100%
         totalGastado = 600 - ?
         
         totalGastado * 100 / presupuesto
         */
        (totalGastado * 100) / presupuesto
    }
    
    func agregarGasto(
        titulo: String,
        cantidad: Double,
        categoria: ExpenseCategory = .other,
        dia: Weekday,
        nota: String?,
        diaCreado: Date
    ) {
        guard cantidad > 0 else { return }
        guard presupuesto >= cantidad else { return }
        let nuevoGasto = Expense.init(
            id: UUID(),
            title: titulo,
            amount: cantidad,
            category: categoria,
            weekday: dia,
            note: nota,
            createdAt: diaCreado
        )
        gastos.append(nuevoGasto)
    }
    
    func borrarGasto(gasto: Expense) {
        gastos.removeAll(where: { $0.id == gasto.id})
    }
    
    
    
}
