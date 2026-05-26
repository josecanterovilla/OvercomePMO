# OvercomePMO — calma

Sistema de cambio de conducta. No un contador de días. Una herramienta para entender patrones, responder a impulsos y construir identidad.

## Stack

- **Frontend**: HTML + CSS + JS vanilla (sin frameworks — rápido y privado)
- **Base de datos**: Supabase (PostgreSQL)
- **Hosting sugerido**: Vercel / Netlify / GitHub Pages

## Estructura

```
OvercomePMO/
├── index.html                          # App principal
├── supabase/
│   └── migrations/
│       └── 20260526_create_core_tables.sql
└── README.md
```

## Tablas en Supabase

| Tabla | Descripción |
|---|---|
| `diary_entries` | Entradas del diario personal |
| `trigger_logs` | Registro de detonantes (emoción, lugar, cansancio) |
| `emergency_sessions` | Sesiones del plan de emergencia completadas |
| `check_ins` | Check-in diario y seguimiento de recaídas |
| `identity` | Propósito personal y valores |

## Setup local

1. Clona el repositorio:
   ```bash
   git clone https://github.com/TU_USUARIO/OvercomePMO.git
   cd OvercomePMO
   ```

2. Abre `index.html` en tu navegador (o usa Live Server en VS Code).

3. Los datos se guardan directamente en Supabase — no necesitas backend.

## Variables de entorno

Las credenciales de Supabase están en `index.html`. Para producción, muévalas a variables de entorno con un bundler (Vite, etc.) o usa Supabase Edge Functions.

## Roadmap

- [ ] Autenticación con Supabase Auth (PIN o passkey)
- [ ] Coach IA integrado con Claude API
- [ ] Modo noche con bloqueo de horario crítico
- [ ] Pantalla post-recaída (reconstrucción)
- [ ] PWA (instalable en celular)
- [ ] Notificaciones locales

## Privacidad

- Sin analytics
- Sin trackers
- Datos cifrados en Supabase (PostgreSQL con SSL)
- Nombre neutro de app ("calma")
