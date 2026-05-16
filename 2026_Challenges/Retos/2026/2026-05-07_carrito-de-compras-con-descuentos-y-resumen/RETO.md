# Carrito de compras con descuentos y resumen

## Objetivo

Construir una pantalla en SwiftUI para manejar un carrito de compras local: agregar productos, ajustar cantidades, aplicar descuentos simples y mostrar un resumen de totales.

La meta del reto es practicar estado derivado, modelado de datos y separacion basica entre vista y `ViewModel`. No se busca una app grande: se busca que el resumen salga correctamente de una fuente de verdad clara.

## Dificultad

Media

## Duracion Estimada

2 horas

## Enfoque Principal

SwiftUI, MVVM, estado derivado, formularios simples

## Que Debo Construir

Una mini experiencia de carrito con:

- Una lista de productos disponibles cargados desde datos mock. [X]
- Una accion para agregar productos al carrito. [X]
- Un control para aumentar y disminuir cantidad por producto. [X]
- Una opcion para eliminar un producto del carrito.[X]
- Un selector o control simple para aplicar un descuento al carrito[X]
- Un resumen con subtotal, descuento aplicado y total final.[X]
- Un estado vacio cuando el carrito no tenga productos.[X]

Cada producto debe tener al menos:

- `id`
- `name`
- `category`
- `price`

Cada item del carrito debe representar:

- producto
- cantidad
- subtotal por item

## Restricciones

- Usa SwiftUI como base de UI.
- Usa MVVM para la logica de carrito, cantidades, descuentos y totales.
- No uses persistencia ni networking.
- No uses librerias externas.
- Evita guardar manualmente valores derivados como subtotal o total si pueden calcularse desde los items actuales.
- El carrito no debe permitir cantidades menores a 1.
- Si un producto ya existe en el carrito, agregarlo debe incrementar cantidad en vez de duplicar filas.
- El descuento debe estar modelado de forma clara, por ejemplo con un `enum`.
- La vista debe leer datos listos para presentar, pero las reglas de negocio no deben vivir regadas en botones o textos.

## Criterios De Terminado

- Se muestran productos mock en una lista.
- Se puede agregar un producto al carrito.
- Agregar el mismo producto dos veces incrementa su cantidad.
- Se puede aumentar, disminuir y eliminar items del carrito.
- El subtotal del carrito se calcula correctamente.
- El descuento elegido modifica el total final.
- El estado vacio del carrito se entiende sin mirar el codigo.
- El `ViewModel` concentra la fuente de verdad y las operaciones principales.
- Dejas en `PROGRESO.md` al menos 2 decisiones tecnicas y 1 edge case que revisaste.

## Extras Opcionales

- Agregar filtro por categoria de producto.
- Agregar ordenamiento por nombre o precio.
- Mostrar ahorro total en pesos.
- Crear un pequeno componente reutilizable para filas del carrito.
- Agregar pruebas unitarias para subtotal, descuento y cantidades.
