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

CREATE TABLE public.user
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE ,
    CONSTRAINT proper_email CHECK (email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
    guest_id TEXT UNIQUE,
    password TEXT,
    image_id TEXT,
    is_admin BOOLEAN DEFAULT false
);

CREATE TABLE public.author
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    image_id TEXT
);

CREATE TABLE public.story
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    image_id UUID,
    text TEXT NOT NULL,
    read_time SMALLINT,
    rating FLOAT
);

CREATE TABLE public.quote
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    text TEXT NOT NULL,
    story_id UUID NOT NULL,
    CONSTRAINT story_fk FOREIGN KEY (story_id) REFERENCES public.story(id),
    user_id UUID NOT NULL,
    CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES public.user(id)
);

CREATE TABLE public.stories_authors (
    story_id UUID NOT NULL,
    CONSTRAINT story_fk FOREIGN KEY (story_id) REFERENCES public.story(id),
    author_id UUID NOT NULL,
    CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES public.author(id)
);

CREATE TABLE public.tag
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE public.stories_tags
(
    story_id UUID NOT NULL,
    CONSTRAINT story_fk FOREIGN KEY (story_id) REFERENCES public.story(id),
    tag_id UUID NOT NULL,
    CONSTRAINT tag_fk FOREIGN KEY (tag_id) REFERENCES public.tag(id)
);

COMMIT;