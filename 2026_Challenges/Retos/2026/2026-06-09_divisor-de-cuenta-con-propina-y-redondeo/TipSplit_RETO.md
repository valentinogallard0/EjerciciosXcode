# Divisor de cuenta con propina y redondeo

## Objetivo

Construir una pantalla en SwiftUI para dividir una cuenta entre varias personas, calcular la propina y mostrar cuanto paga cada quien. La meta no es hacer una calculadora financiera completa, sino practicar **estado derivado limpio**, MVVM, validacion simple y formato de moneda, todo en un reto chico que se pueda terminar en un dia.

La idea es que casi todo lo que se muestra en pantalla (propina, total, monto por persona) sea **calculado** a partir de pocos datos de entrada, no guardado a mano. Es un buen ejercicio para distinguir que es "fuente de verdad" y que es "resultado".

## Dificultad

Facil-Media

## Duracion Estimada

1 dia (reto pequeno pero completo)

## Enfoque Principal

SwiftUI, MVVM, estado derivado, validacion simple, formato de moneda, edge cases.

## Que Debo Construir

Una sola pantalla con:

- Un campo para el **monto de la cuenta** (`subtotal`).
- Un control para elegir el **porcentaje de propina** (por ejemplo un segmented con 0%, 10%, 15%, 20% y una opcion "Otro" con campo libre).
- Un `Stepper` para elegir el **numero de personas** (minimo 1).
- Un toggle para **redondear hacia arriba** el monto por persona (redondeo "amable" para que no queden centavos raros).
- Una seccion de resumen que muestre, siempre actualizada:
  - propina calculada
  - total a pagar (subtotal + propina)
  - monto por persona
  - si el redondeo esta activo, cuanto sobra en total respecto al total real (el "extra" que queda)
- Un estado vacio o neutro cuando el subtotal todavia no es valido.

## Reglas De Negocio

- El subtotal debe ser mayor que 0 para calcular algo; si no, la UI muestra un estado neutro, no numeros en 0 confusos ni un crash.
- El numero de personas nunca puede ser menor que 1.
- La propina se calcula como `subtotal * (porcentaje / 100)`.
- El total es `subtotal + propina`.
- El monto por persona base es `total / personas`.
- Si el redondeo esta activo, el monto por persona se redondea hacia arriba al entero mas cercano (o al multiplo que decidas, justifica tu eleccion), y el "extra" es `(montoPorPersonaRedondeado * personas) - total`.
- Cambiar cualquier entrada (subtotal, propina, personas, redondeo) debe recalcular todo el resumen al instante.

## Restricciones

- SwiftUI como base de UI.
- MVVM: las reglas de calculo viven en un `TipSplitViewModel`, no dentro de los botones ni interpoladas en los `Text`.
- **No** guardes manualmente propina, total ni monto por persona como estado mutable si pueden derivarse del subtotal, el porcentaje y el numero de personas. Eso es el corazon del reto.
- Sin persistencia, sin networking, sin librerias externas.
- El formato de moneda debe hacerse de forma consistente (por ejemplo un helper o un `FormatStyle`), no concatenando strings a mano en cada vista.
- La UI no tiene que ser bonita, pero si legible y consistente.

## Estructura Sugerida

Ajusta nombres si encuentras algo mejor:

- `Models/TipOption.swift` (enum con los porcentajes y el caso `.custom`)
- `UI/TipSplitView.swift`
- `UI/TipSplitViewModel.swift`
- `UI/TipSummaryView.swift`

## Criterios De Terminado

- Se puede escribir un subtotal y elegir propina y numero de personas.
- Con subtotal invalido (vacio, 0 o negativo) la pantalla muestra un estado neutro y no numeros sin sentido.
- La propina, el total y el monto por persona se calculan correctamente y se actualizan al instante.
- El numero de personas nunca baja de 1.
- El toggle de redondeo cambia el monto por persona y muestra el "extra" que sobra.
- Los montos se muestran con formato de moneda consistente en toda la pantalla.
- El `ViewModel` concentra las reglas; las vistas solo leen valores listos para mostrar.
- Dejas en `PROGRESO.md` al menos 3 decisiones tecnicas y 3 edge cases revisados.

## Edge Cases Que Debes Revisar

- Subtotal vacio, 0 o negativo.
- Subtotal con decimales (por ejemplo 33.33).
- Una sola persona (no debe romper la division).
- Propina en 0% (total = subtotal).
- Propina "Otro" con valor vacio o no numerico.
- Redondeo activo cuando el monto ya es exacto (el extra deberia ser 0).
- Subtotal muy chico (por ejemplo 0.01) con muchas personas.

## Extras Opcionales

- Permitir redondear a multiplos (al 0.50, al 1, al 5) y mostrar el efecto.
- Mostrar el total real vs el total cobrado cuando hay redondeo.
- Un boton para resetear todo a valores por defecto.
- Animar el cambio de los numeros del resumen al recalcular.
- Tests unitarios para: propina, total, monto por persona y el calculo del extra con redondeo.
- Soportar propina sobre el subtotal sin impuestos vs sobre el total, como opcion.

## Preguntas Para Tu Retro

Cuando termines, antes de pedir revision intenta responder:

- Que datos decidiste guardar como estado y cuales derivaste?
- Donde pusiste la logica de redondeo y por que ahi?
- Como evitaste que un subtotal invalido ensuciara el resto del calculo?
- Si manana te pidieran soportar varias monedas, que tendrias que cambiar?
