-- STARTS FROM LINE 150--

-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Ubuntu 14.1-2.pgdg20.04+1)
-- Dumped by pg_dump version 14.1 (Ubuntu 14.1-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: animals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animals (
    id integer NOT NULL,
    name character varying(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species character varying(100)
);


ALTER TABLE public.animals OWNER TO postgres;
--Animal: His name is Agumon. He was born on Feb 3rd, 2020, and currently weighs 10.23kg. He was neutered and he has never tried to escape.
INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
    ) VALUES (
        'Agumon',
        '2020-2-3',
        0,
        true,
        10.23
        );

--Animal: Her name is Gabumon. She was born on Nov 15th, 2018, and currently weighs 8kg. She is neutered and she has tried to escape 2 times.
INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
    ) VALUES (
        'Gabumon',
        '2018-11-15',
        2,
        true,
        8
        );

--Animal: His name is Pikachu. He was born on Jan 7th, 2021, and currently weighs 15.04kg. He was not neutered and he has tried to escape once.
INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
    ) VALUES (
        'Pikachu',
        '2021-1-7',
        1,
        false,
        15.04
        );

--Animal: Her name is Devimon. She was born on May 12th, 2017, and currently weighs 11kg. She is neutered and she has tried to escape 5 times.
INSERT INTO animals (
    name,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
    ) VALUES (
        'Devimon',
        '2017-5-12',
        5,
        true,
        11
        );

-- START FROM HERE--

--His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.
INSERT INTO animals (
name,
date_of_birth,
weight_kg,
neutered,
escape_attempts) VALUES ('Charmander', '08-02-2020', -11, false, 0);

--Her name is Plantmon. She was born on Nov 15th, 2022, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.

INSERT INTO animals (
name,
date_of_birth,
weight_kg,
neutered,
escape_attempts) VALUES ('Plantmon', '15-11-2022', -5.7, true, 2);


--His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to 3 times.

INSERT INTO animals (
name,
date_of_birth,
weight_kg,
neutered,
escape_attempts) VALUES ('Squirtle', '02-04-1993', -12.13, true, 3);


--His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once.

INSERT INTO animals (
name,
date_of_birth,
weight_kg,
neutered,
escape_attempts) VALUES ('Angemon', '12-06-2005', -45, true, 1);


--His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.

INSERT INTO animals (
name,
date_of_birth,
weight_kg,
neutered,
escape_attempts) VALUES ('Boarmon', '07-06-2005', 20.4, true, 7);


--Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times.

INSERT INTO animals (
name,
date_of_birth,
weight_kg,
neutered,
escape_attempts) VALUES ('Blossom', '13-10-1998', 17, true, 3);

