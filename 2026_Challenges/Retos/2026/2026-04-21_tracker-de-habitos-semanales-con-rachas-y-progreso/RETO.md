# Tracker de habitos semanales con rachas y progreso

## Objetivo

Construir una mini app en SwiftUI para llevar habitos semanales con seguimiento diario, rachas, progreso acumulado y persistencia local.

La meta del reto es practicar un flujo mas completo que combine varias pantallas, estado derivado, modelado de datos y reglas simples de negocio sin salirte del estilo de laboratorio que ya tiene este repo.

## Dificultad

Media-Dificil

## Duracion Estimada

1 semana

## Enfoque Principal

SwiftUI, MVVM, formularios, persistencia local, estado derivado y logica de negocio simple

## Que Debo Construir

- Una pantalla principal tipo dashboard con el resumen de habitos del dia.
- Una lista de habitos activos con su progreso semanal.
- Una accion para marcar si un habito se completo en una fecha concreta.
- Un formulario para crear y editar habitos.
- Una vista de detalle por habito con historial semanal y racha actual.
- Persistencia local para no perder los datos al cerrar la app.
- Estados vacios y mensajes utiles cuando no existan habitos o no haya actividad.

Cada habito debe tener al menos:

- `id`
- `title`
- `details` o `note` opcional
- `category`
- `targetDaysPerWeek`
- `activeWeekDays`
- `createdAt`
- un historial de completados por fecha

## Reglas O Restricciones

- Usa SwiftUI como base de UI.
- Usa MVVM en las partes donde haya logica de estado o reglas de negocio.
- No uses librerias externas.
- La fuente de verdad debe estar clara. Evita duplicar arrays derivados sin necesidad.
- La persistencia puede ser con `UserDefaults`, archivo JSON local o una capa simple propia.
- La racha y el progreso semanal deben salir de datos reales, no de variables manuales separadas.
- El formulario debe validar al menos nombre, dias objetivo y seleccion minima de dias activos.
- La UI debe seguir funcionando aunque aun no existan habitos creados.
- Intenta mantener nombres y responsabilidades limpias entre modelos, vistas, view models y servicios.

## Plan Sugerido Por Fases

### Fase 1. Base Del Dominio

- Define el modelo de `Habit`.
- Modela el registro de cumplimiento por fecha.
- Crea datos mock o semilla inicial.
- Diseña la capa de persistencia.

### Fase 2. Dashboard Y Lista

- Muestra habitos del dia.
- Calcula progreso semanal por habito.
- Agrega filtros basicos como `Todos`, `Hoy`, `Completados hoy` o por categoria.
- Muestra estados vacios claros.

### Fase 3. Formulario Y Edicion

- Construye alta de habito con validacion.
- Permite editar un habito existente.
- Guarda cambios en persistencia local.

### Fase 4. Detalle Y Metricas

- Crea una pantalla de detalle por habito.
- Muestra racha actual, ultima fecha completada y porcentaje semanal.
- Presenta un historial simple de los ultimos dias o semanas.

### Fase 5. Pulido

- Revisa nombres, separacion de responsabilidades y manejo de estado.
- Mejora feedback visual en errores, vacios y confirmaciones.
- Corrige edge cases, por ejemplo fechas duplicadas o cambios de semana.

## Criterios De Terminado

- Se pueden crear habitos validos y quedan guardados localmente.
- La lista principal refleja correctamente el progreso semanal de cada habito.
- Marcar o desmarcar un habito actualiza la UI de inmediato y persiste el cambio.
- El dashboard muestra informacion util del estado actual sin duplicar logica de negocio en la vista.
- Existe una vista de detalle con al menos racha actual, meta semanal e historial reciente.
- Los filtros o segmentos elegidos no rompen la fuente de verdad ni generan inconsistencias.
- El formulario muestra errores claros cuando faltan datos o hay valores invalidos.
- Queda separacion razonable entre modelos, vistas, view models y persistencia.
- Dejas en `PROGRESO.md` decisiones tecnicas, bloqueos y al menos un ajuste que hayas hecho durante el camino.

## Extras Opcionales

- Permitir archivar habitos en vez de borrarlos.
- Agregar reordenamiento manual de habitos.
- Mostrar una vista semanal tipo calendario simple.
- Agregar pruebas unitarias para calculo de rachas y progreso.
- Separar la persistencia detras de un protocolo para facilitar pruebas.
- Incluir una seccion de insights, por ejemplo el habito mas consistente o el mas atrasado.
