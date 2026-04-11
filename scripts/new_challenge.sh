#!/bin/zsh

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Uso: ./scripts/new_challenge.sh \"Titulo del reto\" [dificultad] [duracion] [enfoque]"
  exit 1
fi

title="$1"
difficulty="${2:-por_definir}"
duration="${3:-por_definir}"
focus="${4:-swiftui}"

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
year="$(date +%Y)"
date_stamp="$(date +%Y-%m-%d)"
challenges_root="$repo_root/2026_Challenges/Retos/$year"

slug="$(printf '%s' "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')"

if [[ -z "$slug" ]]; then
  slug="reto"
fi

challenge_dir="$challenges_root/${date_stamp}_${slug}"

mkdir -p "$challenge_dir"

reto_file="$challenge_dir/RETO.md"
progreso_file="$challenge_dir/PROGRESO.md"
retro_file="$challenge_dir/RETRO.md"

if [[ ! -f "$reto_file" ]]; then
  printf '# %s\n\n' "$title" > "$reto_file"
  printf '## Objetivo\n\nPendiente de completar.\n\n' >> "$reto_file"
  printf '## Dificultad\n\n%s\n\n' "$difficulty" >> "$reto_file"
  printf '## Duracion Estimada\n\n%s\n\n' "$duration" >> "$reto_file"
  printf '## Enfoque Principal\n\n%s\n\n' "$focus" >> "$reto_file"
  printf '## Que Debo Construir\n\n- Pendiente de completar.\n\n' >> "$reto_file"
  printf '## Restricciones\n\n- Pendiente de completar.\n\n' >> "$reto_file"
  printf '## Criterios De Terminado\n\n- Pendiente de completar.\n\n' >> "$reto_file"
  printf '## Extras Opcionales\n\n- Pendiente de completar.\n' >> "$reto_file"
fi

if [[ ! -f "$progreso_file" ]]; then
  printf '# Progreso\n\n' > "$progreso_file"
  printf '## Estado\n\nNo iniciado.\n\n' >> "$progreso_file"
  printf '## Notas\n\n- \n\n' >> "$progreso_file"
  printf '## Bloqueos\n\n- \n\n' >> "$progreso_file"
  printf '## Decisiones\n\n- \n' >> "$progreso_file"
fi

if [[ ! -f "$retro_file" ]]; then
  printf '# Retroalimentacion\n\n' > "$retro_file"
  printf 'Pendiente de revision.\n' >> "$retro_file"
fi

echo "$challenge_dir"
