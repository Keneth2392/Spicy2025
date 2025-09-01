# Spicy Video On — One-Command MVP

Clon estilo OnlyFans con **Next.js 14**, **Stripe Subscriptions + Connect Express**, **Supabase**.
Incluye **wizard de configuración** y scripts para que solo necesites:
```bash
bash setup.sh && npm i && npm run dev
```

## Requisitos
- Node 18+
- Cuenta de **Stripe** (habilitar Connect Express y Webhooks)
- Proyecto en **Supabase** (URL + anon + service role)

## Variables
Copia `.env.example` a `.env.local` o ejecuta `bash setup.sh` para que te guíe.

## Rutas útiles
- `/` Home
- `/creator/[username]` Perfil del creador + suscripción
- `/dashboard` Panel del creador (configurar precio y onboarding a Stripe Connect)
- `/api/stripe/*` Endpoints de Stripe (checkout, webhook, connect-onboard)

**Nota legal:** no copies marcas ni recursos de OnlyFans. Implementa verificación de edad y políticas de contenido.
