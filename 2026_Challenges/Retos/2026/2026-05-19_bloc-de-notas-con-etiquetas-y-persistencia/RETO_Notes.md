# Bloc de Notas con Etiquetas y Persistencia

## Objetivo

Construir una mini app de notas que permita crear, editar y eliminar notas con etiquetas (tags), filtrarlas por etiqueta, y que los datos persistan entre reinicios de la app usando `UserDefaults` + `JSONEncoder/JSONDecoder`.

## Dificultad estimada

**Media**

## Duración estimada

**1 día** (~3-4 horas activas)

## Qué debo construir

### Modelo

- `Note`: tiene `id`, `title`, `body`, `tags: [String]`, `createdAt: Date`
- `Note` debe ser `Codable` e `Identifiable`

### ViewModel

- `NotesViewModel: ObservableObject`
- Tiene `@Published var notes: [Note]`
- Carga notas desde `UserDefaults` al inicializarse
- Persiste las notas en `UserDefaults` cada vez que cambian
- Expone funciones: `add(note:)`, `delete(note:)`, `update(note:)`
- Expone una propiedad computada `allTags: [String]` (tags únicos de todas las notas, ordenados)
- Expone `filteredNotes(by tag: String?) -> [Note]`

### Vistas

1. **NoteListView** — lista de notas con:
   - Buscador por título o cuerpo
   - Selector horizontal de etiquetas para filtrar (tipo chips o ScrollView horizontal)
   - Botón para agregar nota nueva
   - Swipe-to-delete en cada fila

2. **NoteDetailView** — pantalla de detalle/edición con:
   - Campos editables: título, cuerpo
   - Campo para agregar/quitar etiquetas (puede ser simple: TextField que agrega al presionar Enter, chips con X para eliminar)
   - Botón guardar

3. Navegación con `NavigationStack`

## Reglas y restricciones

- Usar MVVM: las vistas no deben tener lógica de negocio ni tocar `UserDefaults` directamente
- La persistencia debe vivir **solo en el ViewModel**
- Los modelos deben ser structs, no clases
- No usar librerías externas
- No usar CoreData ni SwiftData (el objetivo es entender la capa manual con `UserDefaults`)

## Criterios de terminado

- [ ] Se pueden crear notas con título, cuerpo y al menos una etiqueta
- [ ] Se pueden editar notas existentes
- [ ] Se pueden eliminar notas con swipe
- [ ] El filtro por etiqueta funciona correctamente
- [ ] El buscador filtra por título o cuerpo
- [ ] Al cerrar y volver a abrir la app, las notas siguen ahí
- [ ] El ViewModel es el único que toca `UserDefaults`
- [ ] El código compila sin warnings

## Extras opcionales (si sobra tiempo)

- Ordenar notas por fecha de creación (más reciente primero)
- Mostrar la fecha de creación en cada fila de la lista
- Agregar un color o ícono por etiqueta
- Soporte para notas favoritas con un `isFavorite: Bool`
- Animaciones suaves al agregar o eliminar notas (`.animation`, `withAnimation`)

## Concepto nuevo clave

`UserDefaults` no guarda structs directamente — necesitas convertirlos a `Data` primero:

```swift
// Guardar
let encoded = try? JSONEncoder().encode(notes)
UserDefaults.standard.set(encoded, forKey: "notes")

// Cargar
if let data = UserDefaults.standard.data(forKey: "notes"),
   let decoded = try? JSONDecoder().decode([Note].self, from: data) {
    notes = decoded
}
```

Entiende bien este patrón — es la base para después moverse a SwiftData o Core Data con criterio.
