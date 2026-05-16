# Explorador de paises con busqueda detalle y favoritos

## Objetivo

Construir una mini app en SwiftUI para explorar paises desde una API publica, buscar y filtrar resultados, ver un detalle con informacion relevante y marcar favoritos.

La meta del reto es practicar networking real con `async/await`, modelado `Codable`, estados de carga/error/vacio y separacion de responsabilidades usando MVVM. Este reto debe sentirse como un paso natural despues de listas, formularios y persistencia local: ahora la fuente de datos viene de fuera y la UI tiene que responder bien cuando las cosas tardan o fallan.

## Dificultad

Media-Dificil

## Duracion Estimada

1-2 dias

## Enfoque Principal

SwiftUI, MVVM, networking con async await, Codable, estados de carga y error

## Que Debo Construir

Una pantalla principal tipo explorador de paises con datos obtenidos desde una API publica sin API key.

API sugerida:

- `https://restcountries.com/v3.1/all?fields=name,capital,region,subregion,population,flags,cca2,cca3,languages,currencies,maps,timezones`

La app debe incluir:

- Una lista de paises cargados remotamente.
- Un estado de carga mientras se obtienen los datos.
- Un estado de error con opcion de reintentar.
- Un buscador que filtre por nombre, capital o region.
- Un filtro o control simple para ver `Todos`, `Favoritos` y al menos una region.
- Una accion para marcar y desmarcar paises como favoritos.
- Una vista de detalle por pais con informacion mas completa.
- Persistencia local de favoritos para que no se pierdan al cerrar la app.
- Estado vacio cuando no haya resultados para la busqueda o filtro actual.

Cada pais en tu modelo interno debe exponer al menos:

- `id` estable, por ejemplo `cca3`
- `name`
- `capital`
- `region`
- `subregion`
- `population`
- `flagURL` o texto de bandera si decides usarlo
- `languages`
- `currencies`
- `mapsURL` opcional
- `timezones`
- `isFavorite` como estado derivado o combinado desde favoritos locales

## Reglas O Restricciones

- Usa SwiftUI como base de UI.
- Usa MVVM donde haya estado, transformacion de datos o reglas de presentacion.
- Usa `URLSession` con `async/await`; no uses librerias externas.
- Crea una capa de servicio, por ejemplo `CountriesService`, para que la vista o el view model no construyan directamente la request.
- Decodifica la respuesta remota con modelos `Codable` separados de tu modelo de UI si eso ayuda a mantener claridad.
- Maneja explicitamente los estados: cargando, exito, error y vacio.
- Evita duplicar fuentes de verdad. La lista filtrada debe salir de los paises cargados, el texto de busqueda, el filtro activo y los favoritos.
- La persistencia de favoritos puede ser con `UserDefaults` usando los ids de paises.
- Si la API falla, la app debe seguir siendo usable y mostrar un mensaje claro.
- No necesitas hacer una UI perfecta, pero si una UI legible, consistente y facil de revisar.

## Criterios De Terminado

- La app carga paises desde la API y los muestra en una lista.
- Mientras carga, se ve un estado claro y no una pantalla congelada.
- Si falla la carga, se muestra un error comprensible y un boton de reintento.
- La busqueda funciona por mas de un campo.
- El filtro y la busqueda se pueden combinar sin resultados incoherentes.
- Marcar o desmarcar favorito actualiza la UI inmediatamente.
- Los favoritos persisten entre ejecuciones de la app.
- La vista de detalle muestra informacion real del pais seleccionado.
- La logica de networking, filtrado y favoritos no esta regada directamente en las vistas.
- Dejas en `PROGRESO.md` al menos 3 decisiones tecnicas y 1 cosa que cambiarias si tuvieras mas tiempo.

## Extras Opcionales

- Agregar ordenamiento por nombre o poblacion.
- Mostrar imagen de bandera remota usando `AsyncImage`.
- Agregar un boton para abrir el mapa del pais.
- Separar el servicio detras de un protocolo para facilitar pruebas.
- Agregar datos mock para previews y para trabajar sin red.
- Escribir pruebas unitarias para filtrado, favoritos y mapeo de respuesta remota.
- Cachear la ultima respuesta exitosa en un archivo JSON local.
