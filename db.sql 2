-- Ejecuta este SQL en el editor de Supabase
create table if not exists profiles (
  id uuid primary key default gen_random_uuid(),
  user_id uuid unique, -- si usas auth de supabase
  username text unique,
  display_name text,
  avatar_url text,
  connect_account_id text, -- Stripe Connect acct_*
  is_creator boolean default false,
  price_monthly integer default 999
);

create table if not exists subscriptions (
  id uuid primary key default gen_random_uuid(),
  fan_username text not null,
  creator_username text not null,
  stripe_customer_id text,
  stripe_sub_id text,
  active boolean default false,
  current_period_end timestamptz
);

create unique index if not exists uniq_fan_creator on subscriptions(fan_username, creator_username);
