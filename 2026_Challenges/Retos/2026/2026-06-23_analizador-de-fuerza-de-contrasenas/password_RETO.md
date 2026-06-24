# Analizador de fuerza de contraseñas

> Reto flash · Fecha: 2026-06-23 · Duración: **~1 hora**

## Objetivo

Construir un **motor de evaluación de contraseñas en Swift puro**: dada una cadena de
texto, decidir qué tan fuerte es y por qué. La meta no es la pantalla, es la **lógica**:
funciones puras, `enum`s que modelan estados, procesamiento de strings y un sistema de
reglas claro y testeable.

La UI es deliberadamente mínima: un `TextField` donde escribes y, debajo, el resultado
que tu motor calcula en vivo. Si quitaras la vista, el motor seguiría funcionando igual
(eso es justo lo que vamos a practicar).

## Dificultad

Media (lógica densa, poca coordinación entre archivos).

## Duración estimada

~1 hora. Si a los 60 min te falta un detalle, anótalo en `PROGRESO.md` y cierra.

## Enfoque principal

Swift puro: `enum`, `struct`, funciones puras, `Set<Character>`, `CharacterSet`,
computed properties, `switch`. **Sin networking, sin persistencia, sin librerías
externas.** SwiftUI aparece solo como una capa fina de presentación.

## Qué debo construir

### 1. El modelo de resultado (Swift puro)

- `enum PasswordStrength`: `.muyDebil`, `.debil`, `.media`, `.fuerte`, `.muyFuerte`.
  - Hazlo `CaseIterable`.
  - Dale una computed property `label: String` ("Muy débil", etc.) y otra
    `color: Color` (o un `enum` de color propio si quieres mantener el modelo libre
    de SwiftUI — decisión tuya, justifícala).

- `enum PasswordRule: CaseIterable`: cada regla que evalúas, por ejemplo
  `.longitudMinima`, `.tieneMayuscula`, `.tieneMinuscula`, `.tieneNumero`,
  `.tieneSimbolo`, `.sinRepeticiones`, `.sinSecuenciaComun`.
  - Una computed property `descripcion: String` que explique la regla al usuario
    ("Al menos 8 caracteres", "Incluye un símbolo", ...).

- `struct PasswordReport`: el resultado completo de analizar una contraseña.
  - `score: Int` (0–100, o la escala que decidas).
  - `strength: PasswordStrength`.
  - `passed: [PasswordRule]` y `failed: [PasswordRule]`.

### 2. El motor (el corazón del reto)

- `struct PasswordAnalyzer` con un único método público **puro**:

  ```swift
  func analyze(_ password: String) -> PasswordReport
  ```

  Mismo input → mismo output, sin estado mutable, sin efectos secundarios.

- Dentro, evalúa cada `PasswordRule` con una función pequeña y clara. Sugerencias:
  - longitud mínima (define el umbral, p. ej. 8).
  - contiene mayúscula / minúscula / número / símbolo.
  - **sin caracteres repetidos en exceso** (p. ej. "aaa" o "111" penaliza).
  - **sin secuencias comunes** ("1234", "abcd", "qwerty", "password"). Una lista
    pequeña basta.
- Calcula el `score` combinando las reglas (cada regla suma, las penalizaciones restan)
  y mapea el `score` a un `PasswordStrength` con un `switch` por rangos.

### 3. La UI (mínima, 15 min máximo)

- Una `View` con un `TextField` para escribir la contraseña.
- Debajo, en vivo:
  - una barra o texto con el `strength.label` y su color,
  - la lista de reglas con ✓ / ✗ según `passed` / `failed`.
- La View **no calcula nada**: solo llama a `analyzer.analyze(texto)` y dibuja el
  `PasswordReport`. Cero `if` de lógica de scoring en la vista.

## Reglas y restricciones

- El motor (`PasswordAnalyzer`) **no importa SwiftUI**. Debe poder compilar y testearse
  sin UI.
- `analyze` es una **función pura**: nada de `print`, fechas, aleatorios ni estado
  compartido.
- Estados imposibles deben ser imposibles: usa `enum`, no `String` sueltos para la
  fuerza ni para las reglas.
- Una contraseña vacía es un caso válido de entrada (no un crash): debe dar
  `.muyDebil` con todas las reglas en `failed`.
- Sin force-unwrap (`!`) peligrosos.

## Criterios de terminado

- [ ] `analyze("")` devuelve `.muyDebil` sin romperse.
- [ ] `analyze("abc")` y `analyze("Abc123!xyz")` dan resultados claramente distintos
      y razonables.
- [ ] Reordenar los caracteres de una misma contraseña da el mismo score (el motor no
      depende del orden salvo donde tú lo decidas, p. ej. secuencias).
- [ ] La detección de secuencia común marca `failed` en `"qwerty"` y `"1234"`.
- [ ] La View solo lee el `PasswordReport`; toda la lógica vive en el motor.
- [ ] `PasswordStrength` y `PasswordRule` son `enum` (no strings ni booleanos sueltos).
- [ ] `PROGRESO.md` con tus decisiones, bloqueos y tiempo.

## Cómo verificar sin abrir el simulador

No necesitas UI para saber si tu lógica sirve. En un `#Preview`, en `main`, o en un
test, alimenta el motor con varias entradas y revisa el resultado:

```swift
let analyzer = PasswordAnalyzer()
let casos = ["", "abc", "qwerty", "Tr0ub4dour&3", "aaaaaaaa", "Abc123!xyz"]
for c in casos {
    let r = analyzer.analyze(c)
    print(c, "->", r.strength.label, r.score)
}
```

(Si te animas a XCTest, mejor: un test por regla y uno por rango de fuerza.)

## Extras opcionales (si te sobra tiempo)

- Un mensaje de "siguiente paso" que sugiera la regla `failed` de mayor impacto
  ("Añade un símbolo para subir a Fuerte").
- Estimación naïve de "tiempo para crackear" a partir del espacio de caracteres y la
  longitud (pura aritmética, sin librerías).
- Hacer el umbral de longitud y la lista de secuencias **inyectables** por el `init`
  del `PasswordAnalyzer` (configuración por dependencia, no constantes hardcodeadas).
- Animar la barra de fuerza cuando cambia de nivel.

## Para tu retro

- ¿Cómo combinaste las reglas en un `score`? ¿Suma simple, pesos, penalizaciones?
  ¿Por qué esa?
- ¿Dónde pusiste el color: en el modelo o en la vista? ¿Por qué?
- Si mañana te piden una regla nueva (p. ej. "no contiene tu nombre"), ¿cuántos
  archivos tocas?
- ¿Qué parte fue la más fácil de testear? ¿Por qué la función pura ayuda ahí?
