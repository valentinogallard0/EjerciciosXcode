# Agenda de contactos con busqueda y favoritos

## Objetivo

Construir una pantalla en SwiftUI para administrar una agenda local de contactos con busqueda, formulario de alta, favoritos y ordenamiento simple.

La meta no es solo que "funcione". La idea es practicar separacion de responsabilidades, estado derivado y decisiones basicas de estructura usando MVVM.

## Dificultad

Media

## Duracion Estimada

1 dia

## Enfoque Principal

SwiftUI, MVVM, formularios, listas y validacion

## Que Debo Construir

- Una vista principal con una lista de contactos cargados desde datos mock.
- Un campo de busqueda que filtre por nombre, correo o telefono.
- Un formulario para agregar un nuevo contacto.
- Una accion para marcar y desmarcar contactos como favoritos.
- Un control simple para ordenar la lista por nombre o por favoritos primero.
- Un estado vacio cuando no existan resultados para la busqueda actual.

Cada contacto debe tener al menos:

- `id`
- `name`
- `email`
- `phone`
- `isFavorite`
- `category` o `tag` simple, por ejemplo `Trabajo` o `Personal`

## Restricciones

- Usa SwiftUI como base de UI.
- Usa MVVM cuando tenga sentido. La lista, filtros, busqueda y validaciones no deben vivir directamente en la vista.
- No uses librerias externas.
- Trabaja primero con datos en memoria. Persistencia es opcional.
- La validacion del formulario debe impedir guardar contactos invalidos.
- Evita duplicar fuentes de verdad. La lista filtrada y ordenada debe salir de un estado base claro.
- Si decides dividir en varias vistas, manten responsabilidades limpias y nombres claros.

## Criterios De Terminado

- Se pueden mostrar contactos iniciales en una lista funcional.
- Se puede agregar un contacto valido desde el formulario y aparece en la lista sin recargar la pantalla.
- Si el usuario intenta guardar datos invalidos, se muestran errores claros y no se guarda el contacto.
- La busqueda funciona sobre mas de un campo.
- El ordenamiento y la busqueda se pueden usar al mismo tiempo sin comportamientos raros.
- Marcar un favorito actualiza la UI de inmediato.
- El codigo queda separado de forma razonable entre modelo, vista y view model.
- Dejas en `PROGRESO.md` al menos 2 o 3 decisiones tecnicas que hayas tomado.

## Extras Opcionales

- Permitir editar un contacto existente.
- Permitir borrar contactos con confirmacion.
- Mostrar favoritos en una seccion separada.
- Guardar la agenda en `UserDefaults` o en un archivo JSON local.
- Agregar pruebas unitarias para validacion y filtrado.
