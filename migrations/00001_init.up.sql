BEGIN;

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = ON;
SET check_function_bodies = FALSE;
SET client_min_messages = WARNING;
SET search_path = public, extensions;
SET default_tablespace = '';
SET default_with_oids = FALSE;

-- EXTENSIONS --

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- TABLES --

CREATE TABLE public.User
(
    id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    phone    TEXT NOT NULL UNIQUE,
    name     TEXT NOT NULL,
    hash TEXT,
    profileImage UUID,
    isBanned BOOLEAN DEFAULT false,
    rfToken TEXT,
    createdAt TIMESTAMP DEFAULT now()
);

CREATE TABLE public.PhoneConfirmation
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    callId TEXT NOT NULL,
    code TEXT NOT NULL,
    isConfirmed BOOLEAN DEFAULT false,
    userId UUID,
    CONSTRAINT user_fk FOREIGN KEY (userId) REFERENCES public.User (id),
    createdAt TIMESTAMP DEFAULT now()
);

COMMIT;