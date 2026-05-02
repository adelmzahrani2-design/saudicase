-- Manarah initial schema

create extension if not exists pgcrypto;

create table if not exists users_profile (
  id uuid primary key default gen_random_uuid(),
  auth_user_id uuid unique not null,
  full_name text,
  journey_level int not null default 0 check (journey_level between 0 and 5),
  sparks_completed int not null default 0,
  last_login_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists partners (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text unique not null,
  website_url text,
  plan text not null default 'starter',
  created_at timestamptz not null default now()
);

create table if not exists partner_updates (
  id uuid primary key default gen_random_uuid(),
  partner_id uuid not null references partners(id) on delete cascade,
  title text not null,
  content text not null,
  platform_url text,
  created_at timestamptz not null default now(),
  spark_generated boolean not null default false
);

create table if not exists sparks (
  id uuid primary key default gen_random_uuid(),
  partner_id uuid references partners(id) on delete set null,
  source_type text not null,
  source_ref text,
  title text not null,
  body text not null,
  level int not null check (level between 0 and 5),
  language text not null default 'ar',
  share_slug text unique,
  published_at timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists spark_events (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references users_profile(id) on delete cascade,
  spark_id uuid not null references sparks(id) on delete cascade,
  partner_id uuid references partners(id) on delete set null,
  content_snippet text,
  level int not null,
  completed boolean not null default false,
  duration_seconds int not null default 0,
  created_at timestamptz not null default now()
);

create index if not exists idx_partner_updates_partner_created on partner_updates(partner_id, created_at desc);
create index if not exists idx_spark_events_user_created on spark_events(user_id, created_at desc);
create index if not exists idx_sparks_published on sparks(published_at desc);
