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
    id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name     VARCHAR(255),
    phone    VARCHAR(255) UNIQUE,
    password TEXT,
    profileImage TEXT,
    isAdmin BOOLEAN          DEFAULT false
);

CREATE TABLE public.session
(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    callId TEXT NOT NULL,
    code TEXT NOT NULL,
    isConfirmed BOOLEAN DEFAULT false,
    deviceName TEXT,
    hashRt TEXT,
    createdAt TIMESTAMP DEFAULT now()
);

CREATE TABLE public.quote
(
    id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    content  TEXT NOT NULL,
    storyId UUID NOT NULL,
    CONSTRAINT story_fk FOREIGN KEY (storyId) REFERENCES public.story (id),
    userId  UUID NOT NULL,
    CONSTRAINT user_fk FOREIGN KEY (userId) REFERENCES public.user (id),
    tagId   UUID,
    constraint quote_tag_fk FOREIGN KEY (tagId) REFERENCES public.quote_tags (id)
);

CREATE TABLE public.quote_tags
(
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    userId     UUID NOT NULL,
    CONSTRAINT user_fk FOREIGN KEY (userId) REFERENCES public.user (id),
    description TEXT,
    color       TEXT NOT NULL
);

CREATE TABLE public.story
(
    id       UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title    VARCHAR(255) NOT NULL,
    cover    TEXT,
    content  TEXT         NOT NULL,
    duration SMALLINT,
    rating   FLOAT
);

CREATE TABLE public.author
(
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name        VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE public.stories_authors
(
    storyId  UUID NOT NULL,
    CONSTRAINT story_fk FOREIGN KEY (storyId) REFERENCES public.story (id),
    authorId UUID NOT NULL,
    CONSTRAINT author_fk FOREIGN KEY (authorId) REFERENCES public.author (id)
);

CREATE TABLE public.tag
(
    id   SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE public.stories_tags
(
    storyId UUID NOT NULL,
    CONSTRAINT story_fk FOREIGN KEY (storyId) REFERENCES public.story (id),
    tagId   UUID NOT NULL,
    CONSTRAINT tag_fk FOREIGN KEY (tagId) REFERENCES public.tag (id)
);

COMMIT;