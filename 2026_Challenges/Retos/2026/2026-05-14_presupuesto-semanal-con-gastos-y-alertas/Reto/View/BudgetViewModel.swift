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
    @Published var gastos: [Expense] = MockData.expenses
    
    var gastosSemana: [Expense] {
        let hace7Dias = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        return gastos.filter {$0.createdAt >= hace7Dias }
    }
    
    var diasTrackeados: Int {
        let hace7Dias = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        
        let diasUnicos = Set(
            gastos
                .filter{ $0.createdAt >= hace7Dias }
                .map { Calendar.current.startOfDay(for: $0.createdAt) }
        )
        
        return diasUnicos.count
    }
    
    
    var totalGastado: Double {
        let totalGastado = gastosSemana.reduce(0) { $0 + $1.amount }
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
    
    var porcentajeRestante: Double {
        100 - porcentajeGastado
    }
    
    var status: BudgetStatus {
        switch porcentajeGastado {
        case ..<80: return .normal
        case 80..<100: return .warning
        case 100...: return .exceeded
        default:
            return .exceeded
        }
    }
    
    var highestSpend: Expense? {
        if gastosSemana.isEmpty { return nil }
        let gastoMasAlto = gastosSemana.max(by: { $0.amount < $1.amount })
        return gastoMasAlto
    }
    
    var promedio: Double {
        gastosSemana.map { $0.amount }.reduce(0, +)/Double(gastosSemana.count)
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
