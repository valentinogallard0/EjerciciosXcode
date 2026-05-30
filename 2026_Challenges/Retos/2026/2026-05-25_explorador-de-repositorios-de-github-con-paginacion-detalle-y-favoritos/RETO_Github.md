# Explorador de repositorios de GitHub con paginacion detalle y favoritos

## Objetivo

Construir una mini app en SwiftUI que use la API publica de GitHub para buscar repositorios, ver el detalle de uno (con commits recientes), marcar favoritos y manejar bien todos los estados que aparecen cuando la fuente de datos es real: carga, error, vacio, rate limit y paginacion.

La meta es subir el nivel respecto al reto anterior de networking (paises). Ahora hay que coordinar mas piezas: paginacion incremental, debounce de busqueda, varios endpoints, manejo explicito de rate limit y un servicio detras de un protocolo. Este reto deberia sentirse como un paso real hacia un perfil Junior/Mid iOS, donde no basta con que "funcione", sino que el codigo este bien dividido y la UI no se rompa bajo condiciones reales.

## Dificultad

Media-Dificil

## Duracion Estimada

3 a 4 dias (media semana)

Reparto sugerido:

- Dia 1: modelos, capa de servicio detras de protocolo, primer fetch de busqueda, estados basicos.
- Dia 2: paginacion incremental, debounce de busqueda, estado vacio y de error con reintento.
- Dia 3: vista de detalle con segundo endpoint (commits recientes), favoritos persistidos y filtro de favoritos.
- Dia 4: pulido, manejo de rate limit, separacion de modelos de red vs UI, notas en `PROGRESO.md` y, si da el tiempo, tests del filtro y del mapeo.

## Enfoque Principal

SwiftUI, MVVM, networking con async/await, paginacion, debounce, multiples endpoints, protocolos para el servicio, manejo de rate limit.

## Que Debo Construir

Una app con dos pantallas principales:

1. Buscador de repositorios.
2. Detalle de un repositorio.

API base (sin token, pero con rate limit bajo, lo cual es parte del reto):

- Busqueda: `https://api.github.com/search/repositories?q={query}&page={page}&per_page=20`
- Detalle: `https://api.github.com/repos/{owner}/{repo}`
- Commits recientes: `https://api.github.com/repos/{owner}/{repo}/commits?per_page=10`

La app debe incluir:

- Un `TextField` para escribir la busqueda con debounce de ~400 ms antes de disparar el fetch.
- Lista paginada de repositorios: cuando el usuario llega cerca del final, se carga la siguiente pagina.
- Indicador de "cargando mas" al final de la lista cuando llega una pagina nueva.
- Estado de carga inicial diferenciado del de paginacion.
- Estado de error inicial con boton de reintentar.
- Estado vacio cuando la busqueda no devuelve resultados.
- Estado especifico cuando la API responde 403 con cabecera `X-RateLimit-Remaining: 0` (mostrar un mensaje claro, no un error generico).
- Vista de detalle que cargue el repo completo + lista de hasta 10 commits recientes.
- Accion para marcar/desmarcar favorito desde la lista y desde el detalle.
- Segmented control simple para alternar entre `Buscar` y `Favoritos`.
- Persistencia local de favoritos para que no se pierdan al cerrar la app.

Cada repositorio en tu modelo de UI debe exponer al menos:

- `id` estable (`Int` que devuelve GitHub)
- `fullName` (owner/repo)
- `name`
- `ownerLogin`
- `ownerAvatarURL`
- `description` opcional
- `stars`
- `forks`
- `language` opcional
- `htmlURL`
- `isFavorite` derivado del store local

## Reglas o Restricciones

- SwiftUI como base de UI, sin librerias externas.
- MVVM donde haya estado, transformacion de datos o reglas de presentacion.
- `URLSession` con `async/await`. Nada de Combine ni libs de red.
- Capa de servicio detras de un protocolo (por ejemplo `GitHubServicing`) con al menos dos implementaciones:
  - `GitHubLiveService` que hace las requests reales.
  - `GitHubMockService` que devuelve datos en memoria para previews y para trabajar sin red.
- Separa modelos de red (`Codable`) de los modelos de UI si eso ayuda a la claridad. Mapea explicitamente de uno a otro.
- El view model nunca debe construir `URLRequest` directamente; solo debe pedirle datos al servicio.
- Maneja explicitamente los estados: `idle`, `loading`, `loadingMore`, `success`, `empty`, `error`, `rateLimited`. Puedes modelarlo como un enum.
- El debounce del buscador no debe disparar requests por cada letra. Usa `Task` cancelable, no timers a mano si puedes evitarlo.
- La paginacion no debe duplicar resultados ni hacer mas de una request en paralelo para la misma pagina.
- Los favoritos se persisten con `UserDefaults` (lista de `id` o de `fullName`).
- Si la busqueda cambia mientras hay una request en curso, esa request previa debe cancelarse o ignorarse al volver.
- La UI no tiene que ser bonita, pero si legible, consistente y revisable.

## Criterios de Terminado

- La app busca repositorios desde GitHub y los muestra en una lista.
- El buscador tiene debounce y no spamea requests.
- La paginacion funciona: al hacer scroll cerca del final, se carga la siguiente pagina con su propio indicador.
- Cargar mas no rompe la lista ni duplica items.
- Si falla la primera carga, aparece un error claro y un boton de reintento.
- Si la busqueda no devuelve nada, se ve un estado vacio (no una pantalla en blanco).
- Si GitHub responde con rate limit, se muestra un mensaje especifico distinto al de error generico.
- La vista de detalle muestra info real del repo + commits recientes desde un segundo endpoint.
- Marcar/desmarcar favorito actualiza la UI al instante y persiste entre ejecuciones.
- El tab de `Favoritos` muestra solo los repos guardados localmente, incluso sin red.
- El view model no construye requests; siempre pasa por el servicio.
- Existe al menos `GitHubMockService` usable en previews.
- Dejas en `PROGRESO.md`: 3 decisiones tecnicas, 1 cosa que cambiarias con mas tiempo y 1 dificultad real que encontraste.

## Extras Opcionales

- Ordenar resultados por `stars` o por `updated` usando el parametro `sort` de la API.
- Cargar el `README.md` del repo en el detalle (endpoint `/readme`, base64) y renderizarlo como texto plano.
- Cachear en memoria los detalles ya consultados para no repetir requests al volver a abrirlos.
- Cachear en disco (JSON) la ultima busqueda exitosa para mostrarla al arrancar sin red.
- Tests unitarios para: filtrado/derivacion de favoritos, mapeo de modelo de red a modelo de UI, transicion del enum de estado.
- Soporte para token personal opcional leido desde Info.plist o desde un campo escondido, solo para subir el rate limit en local.
- Pull to refresh en la lista.
