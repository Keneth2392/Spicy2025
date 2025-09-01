#!/usr/bin/env bash
set -euo pipefail

echo "== Spicy Video On :: Setup Wizard =="

ENV_FILE=".env.local"
if [ -f "$ENV_FILE" ]; then
  echo "Ya existe $ENV_FILE. ¿Deseas sobreescribirlo? (s/N)"
  read -r ans
  if [[ "${ans:-N}" != "s" && "${ans:-N}" != "S" ]]; then
    echo "Saliendo sin cambios."
    exit 0
  fi
fi

read -p "NEXT_PUBLIC_SUPABASE_URL: " SUPA_URL
read -p "NEXT_PUBLIC_SUPABASE_ANON_KEY: " SUPA_ANON
read -p "SUPABASE_SERVICE_ROLE: " SUPA_SERVICE

read -p "STRIPE_PUBLISHABLE_KEY: " STRIPE_PK
read -p "STRIPE_SECRET_KEY: " STRIPE_SK
read -p "STRIPE_WEBHOOK_SECRET: " STRIPE_WH

APP_URL_DEFAULT="http://localhost:3000"
read -p "NEXT_PUBLIC_APP_URL [${APP_URL_DEFAULT}]: " APP_URL
APP_URL=${APP_URL:-$APP_URL_DEFAULT}

FEE_DEFAULT="15"
read -p "PLATFORM_FEE_PERCENT [${FEE_DEFAULT}]: " FEE
FEE=${FEE:-$FEE_DEFAULT}

cat > "$ENV_FILE" <<EOF
NEXT_PUBLIC_SUPABASE_URL=$SUPA_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY=$SUPA_ANON
SUPABASE_SERVICE_ROLE=$SUPA_SERVICE

STRIPE_PUBLISHABLE_KEY=$STRIPE_PK
STRIPE_SECRET_KEY=$STRIPE_SK
STRIPE_WEBHOOK_SECRET=$STRIPE_WH

NEXT_PUBLIC_APP_URL=$APP_URL
PLATFORM_FEE_PERCENT=$FEE
EOF

echo "Listo. Ahora ejecuta:"
echo "npm i && npm run dev"
