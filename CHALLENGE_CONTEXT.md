# Challenge Context

Este archivo existe para que cualquier chat nuevo pueda entender rapidamente que se busca en este repositorio.

## Que Es Este Proyecto

- Proyecto Xcode de practica en SwiftUI.
- No es una sola app final de producto.
- Es un espacio para resolver retos por bloques, niveles y duraciones distintas.
- El objetivo es aprender haciendo dentro del mismo repo.

## Perfil Actual Del Proyecto

Por la estructura actual del codigo, este repo ya toca temas como:

- SwiftUI
- estado con `@StateObject`, `@Published` y `ObservableObject`
- patron MVVM
- formularios y validacion
- listas simples
- modelos `Codable`
- consumo de API con `async/await`
- ejercicios pequenos enfocados en una habilidad concreta

## Objetivo General

Usar este repositorio para practicar iOS con retos guiados que tengan dificultad y duracion variables, pero que siempre ayuden a mejorar criterio tecnico y soltura construyendo pantallas, view models y logica de negocio simple.

El objetivo de mediano plazo no es solo practicar por practicar. La meta es evolucionar desde un nivel de practicante hacia un nivel Junior/Mid en iOS.

Eso implica que los retos deben empujar poco a poco estas capacidades:

- pensar mejor la estructura del codigo
- separar responsabilidades
- escribir vistas y view models mas limpios
- modelar datos con mas claridad
- tomar mejores decisiones de estado, UI y flujo
- aprender a revisar y corregir codigo propio

## Como Me Gustaria Aprender

Cuando se me proponga un reto, quiero que:

- tenga un objetivo claro
- se ajuste a la dificultad que pida
- se ajuste al tiempo que diga
- use SwiftUI y, cuando tenga sentido, MVVM
- se apoye en el estilo actual del proyecto
- me haga construir algo, no solo leer teoria
- me ayude a desarrollar criterio de nivel profesional, no solo completar pantallas

## Tipos De Reto Que Encajan Bien

- retos cortos de UI y estado
- retos de formularios y validacion
- retos de listas, filtros y ordenamiento
- retos de modelos y transformacion de datos
- retos de networking con `URLSession`
- retos de arquitectura basica para separar vistas, modelos y servicios
- retos de refactorizacion y mejora incremental
- retos de debugging y correccion de errores
- retos donde haya que justificar decisiones tecnicas simples
- retos progresivos donde una version simple pueda crecer despues

## Lo Que No Se Busca

- teoria larga sin codigo
- ejercicios demasiado abstractos
- retos que dependan de demasiadas librerias externas
- cambios que rompan la idea de laboratorio de practica

## Escala De Dificultad

Usa esta escala cuando yo no defina otra:

- facil: un concepto principal, poco codigo, poca coordinacion entre archivos
- media: combina 2 o 3 conceptos y exige decisiones pequenas de estructura
- dificil: integra varias piezas, estados, modelos y reglas de negocio simples

## Escala De Duracion

Usa esta referencia cuando yo te pida un tiempo:

- 30 a 60 min: reto muy enfocado y acotado
- 1 dia: reto pequeno pero completo
- varios dias: reto con iteraciones o mejoras
- 1 semana: reto modular con crecimiento por fases

## Formato Ideal De Respuesta Para Un Reto

Cuando me propongas un reto, quiero algo parecido a esto:

1. titulo del reto
2. objetivo
3. dificultad estimada
4. duracion estimada
5. que debo construir
6. reglas o restricciones
7. criterios de terminado
8. extras opcionales si me sobra tiempo

## Flujo Deseado Dentro Del Repo

Cuando yo pida un reto nuevo, el asistente debe:

1. leer este archivo
2. crear una carpeta nueva dentro de `2026_Challenges/Retos`
3. escribir ahi la propuesta del reto en un archivo `RETO.md`
4. crear un archivo `PROGRESO.md` para notas, decisiones o bloqueos
5. crear un archivo `RETRO.md` para feedback posterior

Cuando yo termine un reto y pida revision, el asistente debe:

1. leer `RETO.md`
2. inspeccionar los archivos Swift relevantes
3. revisar si el resultado cumple el objetivo del reto
4. dar retroalimentacion concreta para mejorar nivel tecnico
5. dejar, si hace sentido, la retroalimentacion tambien en `RETRO.md`

## Instrucciones Para El Asistente

Antes de proponer un reto nuevo:

1. lee este archivo
2. inspecciona la estructura actual del repo si hace falta
3. adapta el reto al nivel, tiempo y dificultad pedidos
4. intenta que el reto se sienta coherente con lo que ya existe en el proyecto
5. evita repetir exactamente un reto ya resuelto si hay mejores opciones
6. si el usuario lo pide, crea la carpeta del reto y deja la propuesta por escrito dentro del repo

## Nota Para Futuras Conversaciones

Si el usuario pide "reto del dia", "reto de 1 hora", "reto semanal" o algo similar, usa este archivo como contexto base para decidir el tipo de reto, el alcance y el formato de la respuesta.
