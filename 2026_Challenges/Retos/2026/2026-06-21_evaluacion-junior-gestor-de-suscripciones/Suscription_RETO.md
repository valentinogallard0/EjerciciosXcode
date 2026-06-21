# Reto de Evaluación: ¿Ya eres Junior iOS?

> App de evaluación: **Gestor de Suscripciones** (SubTracker)
> Fecha: 2026-06-21 · Duración total: **4 horas** · 8 mini-retos de ~30 min

---

## Objetivo

Construir una mini app completa en **SwiftUI + MVVM** que sirva como termómetro real
de tu nivel. No es pintar pantallas: cada mini-reto mide una capacidad que se espera
de un Junior iOS (modelado, estado, validación, filtros, persistencia, networking,
arquitectura y debugging).

Al terminar, te daré feedback honesto: **si ya eres Junior o qué te falta**.

## Reglas del juego

- **Tiempo:** 4 horas. Pon un cronómetro. Si un mini-reto se te pasa de ~40 min,
  anótalo en `PROGRESO.md` y sigue. El tiempo es parte de la evaluación.
- **Sin copiar y pegar a ciegas.** Puedes consultar docs de Apple, pero deberías
  poder explicar cada línea que escribes.
- **Commits:** haz un commit por mini-reto (`Reto N: ...`). El historial cuenta.
- **No uses librerías externas.** Todo con SwiftUI + Foundation.
- Crea los archivos dentro de esta misma carpeta, en una subcarpeta `SubTracker/`
  con la estructura que tú decidas (parte de la evaluación es cómo organizas).

## Qué vas a construir (visión general)

Una app para llevar tus suscripciones (Netflix, Spotify, gym, etc.):
listarlas, ver cuánto gastas al mes, agregar nuevas con validación, filtrarlas,
guardarlas en disco, convertir el total a otra divisa con una API, y dejar el
código limpio. Cada mini-reto añade una capa.

---

## Los 8 mini-retos

### Mini-reto 1 — Modelo de dominio (~25 min) · dificultad: fácil
Crea el modelo `Subscription` y lo que lo rodea.

**Construir:**
- `struct Subscription`: `id`, `name`, `price: Decimal`, `cycle` (mensual/anual),
  `category`, `nextRenewalDate: Date`, `isActive: Bool`.
- `enum BillingCycle` y `enum SubscriptionCategory` (con `CaseIterable`).
- Una **computed property** `monthlyCost: Decimal` que normalice el precio a costo
  mensual (un plan anual de 120 = 10/mes).

**Done cuando:** los tipos compilan, son `Identifiable` y `Codable`, y `monthlyCost`
calcula bien tanto para mensual como anual.

---

### Mini-reto 2 — Lista + ViewModel (~30 min) · dificultad: fácil-media
Muestra las suscripciones en una lista con su gasto total.

**Construir:**
- `SubscriptionsViewModel: ObservableObject` con `@Published var subscriptions`.
- Datos de prueba (mock) de 5-6 suscripciones.
- `SubscriptionListView` que las muestre con `List`.
- Un header que muestre el **total mensual** (suma de `monthlyCost` de las activas).

**Done cuando:** la lista se ve, el total es correcto y la View **no** contiene
lógica de cálculo (debe vivir en el ViewModel).

---

### Mini-reto 3 — Alta con validación (~35 min) · dificultad: media
Formulario para agregar una suscripción nueva.

**Construir:**
- `AddSubscriptionView` con un `Form` (nombre, precio, ciclo, categoría, fecha).
- Validación: nombre no vacío, precio > 0. Botón "Guardar" deshabilitado si no es válido.
- Un `enum` de errores de validación (estilo tu `CreateContactError` previo).
- Al guardar, se agrega a la lista y se cierra la pantalla.

**Done cuando:** no se puede guardar basura, y la nueva suscripción aparece en la lista.

---

### Mini-reto 4 — Filtros, búsqueda y orden (~30 min) · dificultad: media
Haz la lista útil cuando hay muchas suscripciones.

**Construir:**
- Búsqueda por nombre (`searchable` o un `TextField`).
- Filtro por categoría.
- Ordenar por precio (asc/desc) o por fecha de renovación.
- Toda la lógica de filtrado/orden en el ViewModel, expuesta como una sola
  propiedad `displayedSubscriptions` derivada del estado.

**Done cuando:** combinar búsqueda + filtro + orden funciona sin romperse, y la View
solo lee `displayedSubscriptions`.

---

### Mini-reto 5 — Persistencia con un helper genérico (~35 min) · dificultad: media
Que los datos sobrevivan al cerrar la app. **Aquí practicas generics.**

**Construir:**
- Un `struct LocalStorage` con dos métodos genéricos:
  ```swift
  func save<T: Encodable>(_ value: T, key: String) throws
  func load<T: Decodable>(_ type: T.Type, key: String) throws -> T?
  ```
  (guarda en `UserDefaults` o en un archivo JSON con `FileManager`, tú eliges).
- El ViewModel guarda al agregar y carga al iniciar.

**Done cuando:** agregas una suscripción, cierras y reabres la app, y sigue ahí.
Bonus de criterio: explica en `PROGRESO.md` **por qué** esos métodos son genéricos
y qué ganarías vs. escribir uno específico para `Subscription`.

---

### Mini-reto 6 — Networking real (~35 min) · dificultad: media-difícil
Convierte tu gasto total a otra divisa con `async/await`.

**Construir:**
- Llama a una API pública de tipos de cambio, ej:
  `https://open.er-api.com/v6/latest/USD` (sin API key).
- Modelo `Codable` para la respuesta.
- Un servicio con `func fetchRate(to currency: String) async throws -> Decimal`.
- En la UI: un picker de divisa y mostrar el total convertido, con estados de
  **loading** y **error** (no asumas que la red siempre funciona).

**Done cuando:** cambias de divisa, ves un spinner y luego el total convertido;
si apagas el wifi, ves un mensaje de error, no un crash.

---

### Mini-reto 7 — Arquitectura y limpieza (~25 min) · dificultad: media
Demuestra criterio, no solo que "funciona".

**Construir / refactorizar:**
- Introduce un `protocol SubscriptionRepository` y una implementación que use tu
  `LocalStorage`. El ViewModel depende del **protocolo**, no de la implementación.
- Inyecta la dependencia por el `init` del ViewModel.
- Revisa nombres, archivos por responsabilidad y elimina código muerto.

**Done cuando:** podrías cambiar la persistencia (ej. a memoria para tests) sin
tocar el ViewModel. Explica en `PROGRESO.md` por qué eso es valioso.

---

### Mini-reto 8 — Debugging y edge cases (~25 min) · dificultad: media
Caza problemas como lo haría alguien en un equipo.

**Construir / arreglar:**
- Repasa toda la app y arregla al menos **3 edge cases reales**, por ejemplo:
  precio con decimales y locale, lista vacía (empty state), `Decimal` vs `Double`
  en dinero, fecha de renovación pasada, divisor por cero, fuerza-desempaque (`!`).
- Añade un **empty state** decente cuando no hay suscripciones o no hay resultados
  de búsqueda.
- Anota en `PROGRESO.md` cada bug que encontraste y cómo lo arreglaste.

**Done cuando:** la app no crashea en ningún flujo que pruebes y los casos límite
se ven cuidados.

---

## Criterios de terminado (checklist global)

- [ ] Los 8 mini-retos resueltos (o anotado por qué no diste con alguno)
- [ ] La app compila y corre sin crashes
- [ ] La lógica vive en ViewModels/servicios, no en las Views
- [ ] Hay validación, persistencia, networking con loading/error y un empty state
- [ ] `PROGRESO.md` con tus decisiones, bloqueos y tiempos por mini-reto
- [ ] Un commit por mini-reto

## Extras opcionales (si te sobra tiempo)

- Notificación local cuando una renovación está cerca.
- Tests unitarios del cálculo de `monthlyCost` y del filtrado.
- Gráfico simple de gasto por categoría (con `Charts` nativo).
- Animación al agregar/borrar de la lista.

---

## Cómo pedir tu evaluación

Cuando termines (o se acabe el tiempo), escríbeme:
**"Listo, evalúa mi reto Junior"**.

Yo voy a:
1. Leer este `RETO.md` y tu `PROGRESO.md`.
2. Inspeccionar tu código en `SubTracker/`.
3. Evaluar contra la rúbrica de abajo.
4. Decirte claramente: **Junior / casi Junior / aún practicante**, con qué te falta.

### Rúbrica que usaré (qué se espera de un Junior)

| Área | Junior espera... |
|---|---|
| Modelado | tipos claros, enums, computed props, `Codable` bien usado |
| Estado/MVVM | Views sin lógica, `@Published` correcto, datos derivados |
| Validación | imposible guardar datos inválidos, errores tipados |
| Filtros | combinables y en el ViewModel, no en la View |
| Persistencia | datos sobreviven; entiende el helper genérico que escribió |
| Networking | `async/await`, manejo de loading **y** error, modelo `Codable` |
| Arquitectura | dependencias por protocolo/init, separación de responsabilidades |
| Debugging | edge cases cubiertos, sin `!` peligrosos, empty states |
| Criterio | **sabe explicar el porqué** de sus decisiones |

> El último punto es el más importante. La diferencia entre "practicante que copia"
> y "Junior" no es que la app funcione: es que entiendes **por qué** la hiciste así.
