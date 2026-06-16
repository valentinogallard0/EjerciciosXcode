# Motor de pedidos con maquina de estados

## Objetivo

Construir, **sin UI**, un motor en Swift que gobierne el ciclo de vida de un pedido (`Order`) usando una **maquina de estados** con transiciones validas, reglas de negocio inyectables y efectos secundarios observables. La meta no es hacer un backend completo, sino practicar **arquitectura y patrones**: como hacer que estados invalidos sean imposibles, como separar reglas de transiciones, y como notificar al resto del sistema sin acoplar.

Este reto no tiene vista. La "interfaz" son los **tests unitarios**: tu confirmas que funciona ejecutando XCTest, no abriendo el simulador.

## Dificultad

Media

## Duracion Estimada

1 dia (reto chico pero denso en logica)

## Enfoque Principal

Swift puro, maquina de estados, patron State, patron Strategy, patron Observer (eventos), inyeccion de dependencias por protocolos, manejo de errores con `throws` / `Result`, testing con XCTest. **Sin UI**, sin SwiftUI, sin persistencia real, sin networking.

## Que Debo Construir

Un modulo con esta forma general (los nombres son guia, ajustalos):

1. Un modelo de dominio `Order` con un identificador y un `OrderStatus`.
2. Un `enum OrderStatus` con los estados: `draft`, `confirmed`, `paid`, `preparing`, `shipped`, `delivered`, `cancelled`, `refunded`.
3. Un `enum OrderEvent` con los eventos que mueven al pedido: `confirm`, `pay`, `prepare`, `ship`, `deliver`, `cancel`, `refund`.
4. Una **maquina de estados** (`OrderStateMachine` o similar) que, dado un `OrderStatus` y un `OrderEvent`, devuelve el siguiente estado **o lanza un error** si la transicion no es valida.
5. Una **policy** (protocolo `CancellationPolicy`) que decide si un pedido se puede cancelar en su estado actual, con al menos dos implementaciones:
   - `StrictCancellationPolicy`: solo permite cancelar antes de `shipped`.
   - `FlexibleCancellationPolicy`: permite cancelar hasta `delivered` (y dispara `refund` automatico despues).
6. Un **emisor de efectos secundarios** (`OrderEventBus` o `OrderEventEmitter`) que, cada vez que ocurre una transicion exitosa, notifica a uno o varios listeners (`OrderEventListener`) con un `OrderSideEffect` (`notifyCustomer`, `releaseInventory`, `scheduleShipment`, `issueRefund`, ...).
7. Un caso de uso `ApplyOrderEventUseCase` que coordina: pide a la maquina la transicion, consulta la policy si aplica, persiste el cambio en un `OrderRepository`, y publica los efectos en el bus.
8. Un `OrderRepository` en memoria (`InMemoryOrderRepository`) detras de un protocolo (`OrderRepositoryProtocol`).
9. Tests unitarios en XCTest que cubran transiciones validas, transiciones invalidas, las dos policies, y que los listeners reciben los efectos esperados.

## Reglas De Negocio

Transiciones validas (todo lo demas es invalido y debe lanzar error):

- `draft -> confirm -> confirmed`
- `confirmed -> pay -> paid`
- `paid -> prepare -> preparing`
- `preparing -> ship -> shipped`
- `shipped -> deliver -> delivered`
- `cancel` es valido segun la `CancellationPolicy`:
  - Strict: solo desde `draft`, `confirmed`, `paid`, `preparing`. Pasa a `cancelled`.
  - Flexible: igual que strict + tambien desde `shipped` y `delivered`. Si era `paid`, `preparing`, `shipped` o `delivered`, ademas debe emitir un `issueRefund` y pasar a `refunded` en vez de `cancelled`.
- `refund` solo es valido desde `delivered` y pasa a `refunded`.
- No se puede salir de `cancelled`, `refunded` o `delivered` con ningun evento nuevo (a `delivered` solo entra el refund explicito).

Efectos secundarios minimos (mas pueden agregarse):

- `confirm` -> `notifyCustomer(.orderConfirmed)`
- `pay` -> `notifyCustomer(.paymentReceived)`, `releaseInventory(reserved: true)`
- `prepare` -> ninguno obligatorio
- `ship` -> `scheduleShipment`, `notifyCustomer(.shipped)`
- `deliver` -> `notifyCustomer(.delivered)`
- `cancel` (sin reembolso) -> `notifyCustomer(.cancelled)`, `releaseInventory(reserved: false)`
- `cancel` (con reembolso, policy flexible) o `refund` -> `notifyCustomer(.refunded)`, `issueRefund`

## Restricciones

- **Sin UI**, sin SwiftUI, sin UIKit. Esto es un modulo de logica + tests.
- Toda dependencia externa (repositorio, policy, bus de eventos) debe llegar por **protocolo**, no instanciada a mano dentro de la maquina o del caso de uso.
- Los estados invalidos deben ser **imposibles de representar**, no solo evitados con `if`s. Modela con `enum`, no con `Bool`s sueltos.
- Las transiciones deben centralizarse en un solo lugar (la maquina). Las vistas / casos de uso **no** deciden a mano que estado sigue.
- Los efectos secundarios no se ejecutan dentro de la maquina; la maquina solo **describe** que efectos hay. Quien los ejecuta es el bus / listeners.
- Cero `print` dentro de la logica de dominio. Si quieres loguear algo en los tests, hazlo desde un listener de prueba.
- Sin persistencia real, sin networking, sin librerias externas.

## Estructura Sugerida

Ajusta nombres si encuentras algo mejor:

- `Domain/Models/Order.swift`
- `Domain/Models/OrderStatus.swift`
- `Domain/Models/OrderEvent.swift`
- `Domain/Models/OrderSideEffect.swift`
- `Domain/StateMachine/OrderStateMachine.swift`
- `Domain/Policies/CancellationPolicy.swift` (protocolo)
- `Domain/Policies/StrictCancellationPolicy.swift`
- `Domain/Policies/FlexibleCancellationPolicy.swift`
- `Domain/Events/OrderEventBus.swift` (protocolo + implementacion default)
- `Domain/Events/OrderEventListener.swift`
- `Domain/Repository/OrderRepositoryProtocol.swift`
- `Data/Repositories/InMemoryOrderRepository.swift`
- `Domain/UseCase/ApplyOrderEventUseCase.swift` (protocolo + Impl)
- `Tests/OrderStateMachineTests.swift`
- `Tests/CancellationPolicyTests.swift`
- `Tests/ApplyOrderEventUseCaseTests.swift`

## Criterios De Terminado

- Todas las transiciones validas funcionan y devuelven el siguiente estado correcto.
- Todas las transiciones invalidas lanzan un error tipado (no un `fatalError`, no un `print`).
- Las dos policies de cancelacion existen y se inyectan via protocolo. Cambiar de policy cambia el comportamiento sin tocar la maquina ni el caso de uso.
- Hay un bus de eventos que acepta multiples listeners. En los tests puedes registrar un "spy" listener y verificar que recibio los efectos correctos en el orden correcto.
- El caso de uso compone maquina + policy + repositorio + bus y se prueba con dobles (fakes / spies).
- Hay al menos:
  - 1 test por transicion valida (puede ser parametrizado).
  - 1 test que confirma que cada estado terminal (`cancelled`, `refunded`, `delivered` salvo refund) rechaza eventos siguientes.
  - 1 test por cada policy demostrando su diferencia de comportamiento.
  - 1 test que verifica que un cancel desde `paid` con policy flexible termina en `refunded` y emite `issueRefund`.
- El `ViewModel` (no hay) ni ninguna capa de presentacion conocen `OrderStatus`. Esto es 100% logica.
- Dejas en `PROGRESO.md` al menos 3 decisiones tecnicas y 3 edge cases revisados.

## Edge Cases Que Debes Revisar

- Aplicar dos veces el mismo evento (por ejemplo, `pay` dos veces) sobre el mismo pedido: debe fallar la segunda vez.
- `cancel` en estado `draft` con policy strict: si vale o no, decidelo y justificalo.
- `cancel` desde `delivered` con policy strict: debe rechazarse.
- `cancel` desde `delivered` con policy flexible: debe terminar en `refunded`, no en `cancelled`.
- Un listener que tira / falla: no debe romper al bus ni impedir que otros listeners reciban el evento (decide la politica y justificala).
- Aplicar un evento sobre un id de pedido inexistente en el repositorio: error claro, no crash.
- Eventos concurrentes sobre el mismo pedido: no es obligatorio resolverlo, pero ten opinion (lock optimista vs serializar).

## Extras Opcionales

- Una segunda implementacion del bus de eventos que sea **async** (con `AsyncStream`) ademas de la sincrona.
- Un decorador `LoggingOrderRepository` que envuelve a otro repo y loguea cada `save` (patron Decorator).
- Una representacion grafica del state machine como tabla (`[OrderStatus: [OrderEvent: OrderStatus]]`) y validar en un test que coincide con la implementada.
- Un caso de uso `GetAvailableEventsUseCase` que, dado un pedido, devuelve la lista de eventos validos en este momento (util para que mas adelante una UI sepa que botones mostrar).
- Snapshot / undo del ultimo cambio (patron Memento).

## Preguntas Para Tu Retro

Cuando termines, antes de pedir revision intenta responder:

- Como modelaste la tabla de transiciones? Switch grande, diccionario, varias funciones? Por que esa?
- Donde decidiste que vive la policy: dentro de la maquina, fuera, o en el caso de uso? Por que?
- Como te aseguraste de que los efectos secundarios no se acoplen a la maquina?
- Si manana te pidieran agregar un estado nuevo (por ejemplo `onHold`), cuantos archivos tocarias y por que?
- Que parte del modulo es la mas testeable? Cual la menos? Que harias para mejorar eso?
