# Temporizador Pomodoro con ciclos y notificaciones

## Objetivo

Construir un temporizador Pomodoro funcional en SwiftUI con ciclos configurables, animación de progreso circular, y notificaciones locales al terminar cada fase. El foco está en modelar el estado del timer limpiamente (sin if/bool sueltos), separar la lógica del timer de la UI, y manejar el ciclo de vida de la app (foreground / background) correctamente.

## Dificultad

Media-Alta

## Duración Estimada

1–2 días

---

## Qué Debo Construir

### 1. Modelo de estados (`PomodoroPhase`)

Un `enum` con las fases posibles:

- `focus(duration: TimeInterval)` — sesión de concentración (default 25 min)
- `shortBreak(duration: TimeInterval)` — descanso corto (5 min)
- `longBreak(duration: TimeInterval)` — descanso largo (15 min)

### 2. Modelo de ciclo (`PomodoroSession`)

Un struct o clase que represente el estado completo de la sesión:

- La fase actual (`PomodoroPhase`)
- Ciclos completados (`focusRoundsCompleted: Int`)
- Regla: cada 4 rondas de foco se da un descanso largo; el resto, descanso corto.

### 3. `PomodoroTimer` (ViewModel / ObservableObject)

Encapsula toda la lógica del timer. La vista no toca `Timer` directamente.

Responsabilidades:
- `start()`, `pause()`, `reset()`, `skip()` — acciones sobre el timer
- Publicar `timeRemaining: TimeInterval` y `phase: PomodoroPhase`
- Calcular el porcentaje de progreso (`progress: Double` entre 0 y 1)
- Al llegar a 0, avanzar automáticamente a la siguiente fase
- Al avanzar de fase, programar una notificación local

### 4. Vista principal (`PomodoroView`)

- Anillo circular de progreso animado (puede hacerse con `Circle` + `trim` + `animation`)
- Tiempo restante en formato `MM:SS`
- Nombre de la fase actual
- Botones: Iniciar / Pausar / Reiniciar / Saltar fase
- Indicador de ciclos completados (por ejemplo, 4 puntos que se llenan)

### 5. Notificaciones locales (`PomodoroNotifier`)

- Solicitar permiso al usuario al iniciar la app
- Programar una `UNUserNotificationCenter` notification al terminar cada fase
- Cancelar la notificación pendiente si el usuario pausa o reinicia
- Mostrar en el cuerpo del mensaje qué fase viene a continuación

### 6. Manejo de background

Cuando la app pasa a segundo plano con el timer corriendo:
- Guarda el `Date` en que se fue al background
- Al volver al foreground, calcula cuánto tiempo pasó y ajusta `timeRemaining`
- Si ya terminó la fase mientras estaba en background, avanza automáticamente

---

## Restricciones

- `PomodoroTimer` no puede importar SwiftUI. Solo Foundation.
- La vista no puede tener lógica de negocio: sin aritmética de tiempo, sin manejo de `Timer`, sin decisiones de "qué fase sigue".
- No uses `Timer.scheduledTimer` directamente en la vista.
- El avance de fases debe vivir en el ViewModel, no dispararse desde la vista.
- Usa `@MainActor` donde corresponda (el ViewModel que actualiza UI).
- Sin librerías externas.

---

## Criterios de Terminado

- [ ] El timer cuenta hacia atrás correctamente en focus, short break y long break.
- [ ] Al llegar a 0 avanza solo a la siguiente fase (con la regla de 4 rondas → long break).
- [ ] El anillo circular refleja el progreso y se anima suavemente al cambiar de fase.
- [ ] Los botones Start / Pause / Reset / Skip funcionan correctamente.
- [ ] Se programa una notificación local al terminar cada fase (y se cancela si se pausa).
- [ ] Si la app va al background y vuelve, el tiempo es correcto.
- [ ] `PomodoroTimer` no importa SwiftUI.
- [ ] No hay lógica de negocio en la vista.

---

## Extras Opcionales

- Pantalla de configuración (Settings) donde el usuario puede cambiar las duraciones con un `Stepper`.
- Persistencia con `UserDefaults` para guardar la configuración entre sesiones.
- Animación de "splash" o feedback háptico al terminar cada fase (`UIImpactFeedbackGenerator`).
- Widget de pantalla de bloqueo (WidgetKit) que muestre el tiempo restante.
- Soporte para `@AppStorage` para que los ajustes persistan automáticamente.

---

## Preguntas Para Tu Retro

Cuando termines, antes de pedir revisión intenta responder:

- ¿Cómo modelaste la regla "cada 4 rondas → long break"? ¿Dónde vive esa lógica?
- ¿Qué pasa si el usuario fuerza el cierre de la app en mitad de una sesión? ¿Lo manejaste?
- ¿Qué parte del código te resultó más difícil de separar de la vista?
- ¿Cómo probaste el comportamiento del background sin esperar 25 minutos reales?
- ¿Qué cambiarías si tuvieras que añadir un modo "modo infinito" que no se detenga hasta que el usuario lo detenga manualmente?
