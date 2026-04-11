# 2026 Challenges

Repositorio de practica en SwiftUI para trabajar retos pequenos y medianos dentro de un mismo proyecto Xcode.

Este proyecto funciona mas como laboratorio de aprendizaje que como una sola app de producto. Aqui hay ejercicios de:

- estado y MVVM
- formularios y validacion
- listas y manejo de datos
- modelos `Codable`
- consumo de APIs con `async/await`
- ejercicios pequenos por modulo

## Contexto Para Retos

El archivo principal para generar nuevos retos es [CHALLENGE_CONTEXT.md](./CHALLENGE_CONTEXT.md).
La guia practica para usar este flujo en chats nuevos es [HOW_TO_USE_Codex_FOR_RETOS.md](./HOW_TO_USE_Codex_FOR_RETOS.md).

La carpeta donde viviran los retos nuevos es [2026_Challenges/Retos](./2026_Challenges/Retos).

El script base para scaffolding es [scripts/new_challenge.sh](./scripts/new_challenge.sh).

Cuando abras un chat nuevo, puedes pedirme algo como:

- `Lee CHALLENGE_CONTEXT.md y dame un reto del dia`
- `Lee CHALLENGE_CONTEXT.md y proponme un reto intermedio de 1 hora`
- `Lee CHALLENGE_CONTEXT.md y preparame un reto de una semana sobre networking y arquitectura`
- `Lee CHALLENGE_CONTEXT.md, crea la carpeta del nuevo reto y escribe la propuesta`
- `Revisa mi solucion del reto en la carpeta actual y dame retroalimentacion`

## Flujo Recomendado

1. Pides un reto con dificultad, duracion o tema.
2. Se crea una carpeta nueva dentro de `2026_Challenges/Retos/...`.
3. Dentro de esa carpeta se genera `RETO.md`, `PROGRESO.md` y `RETRO.md`.
4. Tu resuelves el reto dentro del proyecto.
5. Cuando terminas, pides revision y se deja feedback en `RETRO.md`.

## Proyecto Actual

La app no representa una sola funcionalidad de negocio. Es una coleccion de retos y pantallas de practica dentro del mismo proyecto `2026_Challenges.xcodeproj`.
