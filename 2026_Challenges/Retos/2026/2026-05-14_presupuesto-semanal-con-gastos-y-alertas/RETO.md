# Presupuesto semanal con gastos y alertas

## Objetivo

Construir una mini experiencia en SwiftUI para registrar gastos de una semana, agruparlos por categoria, compararlos contra un presupuesto semanal y mostrar alertas visuales cuando el usuario se acerque o se pase del limite.

La meta del reto no es hacer una app financiera completa. La meta es practicar modelado de datos, formularios, estado derivado, MVVM, validacion simple y una pantalla de resumen que ayude a tomar decisiones.

## Dificultad

Media alta

## Duracion Estimada

Media semana, aproximadamente 3 a 4 dias de practica

## Enfoque Principal

SwiftUI, MVVM, formularios, estado derivado, listas, filtros, resumenes y reglas de negocio simples

## Que Debo Construir

Una experiencia local de presupuesto semanal con:

- Una pantalla principal de resumen semanal.
- Un presupuesto semanal editable.
- Una lista de gastos registrados.
- Un formulario para agregar nuevos gastos.
- Un selector de categoria para cada gasto.
- Un selector o campo para asignar el dia de la semana del gasto.
- Un control para filtrar los gastos por categoria o por dia.
- Un resumen con total gastado, presupuesto restante y porcentaje usado.
- Una seccion de gasto por categoria.
- Un estado vacio cuando no existan gastos.
- Alertas visuales cuando el gasto llegue a ciertos umbrales.

Cada gasto debe tener al menos:

- `id`
- `title`
- `amount`
- `category`
- `weekday`
- `notes` opcional
- `createdAt`

Cada categoria debe tener al menos:

- nombre
- icono SF Symbol
- color

## Reglas De Negocio

- El presupuesto semanal no puede ser menor o igual a 0.
- Un gasto no puede tener titulo vacio.
- Un gasto no puede tener monto menor o igual a 0.
- El total gastado debe calcularse desde los gastos actuales.
- El presupuesto restante debe calcularse desde presupuesto menos total gastado.
- El porcentaje usado debe calcularse desde total gastado y presupuesto.
- Si el usuario supera el 80% del presupuesto, la UI debe mostrar una advertencia.
- Si el usuario supera el 100% del presupuesto, la UI debe mostrar un estado critico.
- Borrar un gasto debe actualizar todos los resumenes.
- Cambiar el presupuesto debe recalcular el estado del resumen.

## Restricciones

- Usa SwiftUI como base de UI.
- Usa MVVM para separar reglas de negocio de las vistas.
- No uses persistencia.
- No uses networking.
- No uses librerias externas.
- Evita guardar manualmente valores derivados como total gastado, restante o porcentaje si pueden calcularse desde los gastos actuales.
- La vista debe leer datos listos para presentar, pero las reglas de negocio no deben vivir dentro de botones o textos.
- Mantén los modelos simples y claros antes de agregar componentes visuales avanzados.

## Estructura Sugerida

Puedes organizarlo asi, ajustando nombres si encuentras una mejor forma:

- `Models/Expense.swift`
- `Models/ExpenseCategory.swift`
- `Models/Weekday.swift`
- `UI/BudgetDashboardView.swift`
- `UI/BudgetViewModel.swift`
- `UI/ExpenseFormView.swift`
- `UI/ExpenseRowView.swift`
- `UI/BudgetSummaryView.swift`
- `UI/CategoryBreakdownView.swift`

## Fases Sugeridas

### Dia 1: Modelos y ViewModel

- Define `Expense`, `ExpenseCategory` y `Weekday`.
- Crea `BudgetViewModel`.
- Agrega gastos mock para probar la UI.
- Implementa propiedades derivadas: total gastado, restante, porcentaje usado y estado del presupuesto.
- Implementa acciones para agregar y borrar gastos.

### Dia 2: UI principal y lista

- Construye la pantalla principal.
- Muestra el resumen semanal.
- Muestra la lista de gastos.
- Agrega estado vacio.
- Agrega borrado de gastos.
- Muestra visualmente si el presupuesto esta bien, en advertencia o excedido.

### Dia 3: Formulario y validaciones

- Crea formulario para agregar gasto.
- Valida titulo y monto.
- Permite elegir categoria y dia.
- Muestra errores claros sin crashear ni agregar datos invalidos.
- Conecta el formulario con el ViewModel.

### Dia 4: Filtros, pulido y criterio

- Agrega filtro por categoria o dia.
- Agrega desglose por categoria.
- Revisa edge cases.
- Limpia nombres, responsabilidades y componentes.
- Completa `PROGRESO.md` con decisiones tecnicas y casos revisados.

## Criterios De Terminado

- Se puede configurar o editar el presupuesto semanal.
- Se pueden agregar gastos validos desde un formulario.
- No se pueden agregar gastos con titulo vacio o monto invalido.
- Se pueden borrar gastos.
- El total gastado se calcula correctamente.
- El presupuesto restante se calcula correctamente.
- El porcentaje usado se calcula correctamente.
- La UI muestra estado normal, advertencia y excedido segun el presupuesto.
- Se puede filtrar la lista por categoria o dia.
- El desglose por categoria coincide con los gastos registrados.
- El estado vacio se entiende sin mirar el codigo.
- El ViewModel concentra la fuente de verdad y las operaciones principales.
- Las vistas no duplican reglas de negocio importantes.
- Dejas en `PROGRESO.md` al menos 3 decisiones tecnicas y 3 edge cases revisados.

## Edge Cases Que Debes Revisar

- Presupuesto semanal en 0 o valor negativo.
- Gasto con titulo vacio.
- Gasto con monto 0 o negativo.
- Borrar el ultimo gasto.
- Total gastado exactamente igual al presupuesto.
- Total gastado mayor al presupuesto.
- Filtro sin resultados.
- Monto con decimales.

## Extras Opcionales

- Ordenamiento por monto, fecha o dia.
- Edicion de gastos existentes.
- Boton para resetear la semana.
- Mostrar el gasto mas alto de la semana.
- Mostrar promedio diario de gasto.
- Agregar una barra de progreso del presupuesto.
- Crear datos mock para diferentes escenarios: vacio, normal, advertencia y excedido.
- Agregar pruebas unitarias para calculos de total, restante, porcentaje y validaciones.

## Preguntas Para Tu Retro

Cuando termines, intenta responder estas preguntas antes de pedirme revision:

- Que estado decidiste guardar y que estado decidiste derivar?
- Que reglas quedaron en el ViewModel y cuales quedaron en la vista?
- Que parte del formulario fue mas facil de ensuciar y como la mantuviste legible?
- Que edge case podria romper la confianza del usuario en el resumen?
