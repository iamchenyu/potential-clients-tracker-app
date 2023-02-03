DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS clients CASCADE;
DROP TABLE IF EXISTS channels CASCADE;
DROP TABLE IF EXISTS statuses CASCADE;
DROP TABLE IF EXISTS clients_statuses CASCADE;

CREATE TABLE channels (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE statuses (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email TEXT UNIQUE NOT NULL CHECK (position('@' IN email) > 1),
  password TEXT NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  profile_url TEXT,
  role TEXT NOT NULL
);

CREATE TABLE clients (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL DEFAULT '',
  last_name TEXT NOT NULL DEFAULT '',
  email TEXT NOT NULL DEFAULT 'placeholder@fake.com',
  phone TEXT NOT NULL DEFAULT '000-000-0000',
  address TEXT NOT NULL DEFAULT '',
  citizenship TEXT NOT NULL DEFAULT 'U.S. Citizen',
  medicaid BOOLEAN NOT NULL DEFAULT TRUE,
  daycare BOOLEAN NOT NULL DEFAULT TRUE,
  physician TEXT NOT NULL DEFAULT '',
  diagnosis TEXT NOT NULL DEFAULT '',
  from_channel INTEGER NOT NULL DEFAULT 1
    REFERENCES channels ON DELETE CASCADE,
  current_status INTEGER NOT NULL DEFAULT 1
    REFERENCES statuses ON DELETE CASCADE,
  is_enrolled BOOLEAN NOT NULL DEFAULT FALSE,
  note TEXT NOT NULL DEFAULT ''
);

CREATE TABLE clients_statuses (
  id SERIAL PRIMARY KEY,
  client_id INTEGER NOT NULL
    REFERENCES clients ON DELETE CASCADE,
  status_id INTEGER NOT NULL
    REFERENCES statuses ON DELETE CASCADE,
  update_date DATE NOT NULL
);