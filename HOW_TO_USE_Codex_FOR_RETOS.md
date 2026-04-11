# How To Use Codex For Retos

Esta guia existe para que puedas abrir un chat nuevo y usar este repo sin depender del contexto de una conversacion anterior.

## Idea Principal

En un chat nuevo, el asistente no recuerda esta conversacion.

Lo que si puede hacer es leer archivos del repo.

Por eso, casi siempre debes empezar diciendo que lea `CHALLENGE_CONTEXT.md`.

## Regla Base

Empieza tus mensajes con una frase como esta:

`Lee CHALLENGE_CONTEXT.md y actua en base a ese archivo.`

Luego agrega lo que quieres que haga.

## Pedir Un Reto Nuevo

Usa plantillas como estas:

```text
Lee CHALLENGE_CONTEXT.md y crea un reto nuevo de 1 hora, dificultad media, sobre formularios en SwiftUI. Crea la carpeta del reto y escribe RETO.md, PROGRESO.md y RETRO.md.
```

```text
Lee CHALLENGE_CONTEXT.md y crea un reto del dia sobre networking con async/await. Dejalo creado dentro del repo.
```

```text
Lee CHALLENGE_CONTEXT.md y crea un reto semanal dificil sobre MVVM y manejo de estado. Quiero que quede documentado en su carpeta.
```

## Pedir Un Reto Con Tema Libre

```text
Lee CHALLENGE_CONTEXT.md y dame un reto del dia que encaje con mis objetivos actuales. Crea la carpeta del reto y escribe la propuesta.
```

## Pedir Ayuda Durante El Reto

Si no quieres que te resuelva todo, dilo de forma explicita:

```text
Lee CHALLENGE_CONTEXT.md y el RETO.md del reto actual. Estoy bloqueado en la parte de validacion del formulario. Guiame con pistas sin resolverme todo el ejercicio.
```

```text
Lee CHALLENGE_CONTEXT.md y el RETO.md del reto actual. Ayudame a pensar la arquitectura sin escribirme toda la solucion.
```

## Pedir Revision Cuando Termines

```text
Lee CHALLENGE_CONTEXT.md y el RETO.md del reto que acabo de terminar. Revisa mi solucion, dame retroalimentacion para crecer hacia Junior/Mid iOS y escribe tambien el feedback en RETRO.md.
```

```text
Lee CHALLENGE_CONTEXT.md y revisa el reto que acabo de terminar. Quiero feedback sobre estructura, claridad, estado, MVVM y calidad de codigo.
```

## Pedir Retroalimentacion Mas Dura

```text
Lee CHALLENGE_CONTEXT.md y revisa mi solucion con criterio de code review. Señala errores, debilidades, riesgos y que tendria que mejorar para verme mas cerca de un perfil Junior/Mid iOS.
```

## Pedir El Siguiente Paso

```text
Lee CHALLENGE_CONTEXT.md y el historial del reto actual. Con base en lo que ya hice, proponme el siguiente reto con una dificultad un poco mayor.
```

## Formato Corto Recomendado

Si quieres algo rapido, usa esta estructura:

```text
Lee CHALLENGE_CONTEXT.md y actua en base a ese archivo.
[Aqui escribes lo que quieres]
```

Ejemplo:

```text
Lee CHALLENGE_CONTEXT.md y actua en base a ese archivo.
Crea un reto nuevo de 1 dia sobre listas, filtros y ordenamiento. Dejalo escrito dentro del repo.
```

## Cuando Ya Exista Un Reto

Si ya sabes cual es la carpeta del reto, puedes ser mas directo:

```text
Lee CHALLENGE_CONTEXT.md y revisa /Users/valentinodepaola/XcodeProjects/ChatGPTEjercicios/2026_Challenges/EjerciciosXcode/2026_Challenges/Retos/2026/2026-04-11_mi-reto/RETO.md. Luego analiza mi solucion y dame feedback.
```

## Resumen Practico

Para chats nuevos:

1. pide que lea `CHALLENGE_CONTEXT.md`
2. di si quieres crear, revisar o desbloquear un reto
3. especifica dificultad, duracion o tema si te importa
4. si quieres que escriba archivos en el repo, dilo explicitamente

## Frase Mas Util

Si no quieres pensar mucho, usa esta:

```text
Lee CHALLENGE_CONTEXT.md, crea o revisa lo que haga falta dentro del repo y guiame como si este proyecto fuera mi laboratorio para pasar de practicante a Junior/Mid iOS.
```
