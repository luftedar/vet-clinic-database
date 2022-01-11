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

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species) FROM stdin;
2	Agumon		2020-02-03	0	t	10.23	\N
3	Gabumon	2018-11-15	2	t	8	\N
4	Pikachu	2021-01-07	1	f	15.04	\N
5	Devimon	2017-05-12	5	t	11	\N
6	Charmander	2020-02-08	0	f	-11	\N
7	Plantmon	2022-11-15	2	t	-5.7	\N
8	Squirtle	1993-04-02	3	t	-12.13	\N
9	Angemon	2005-06-12	1	t	-45	\N
10	Boarmon	2005-06-07	7	t	20.4	\N
11	Blossom	1998-10-13	3	t	17	\N
\.


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.animals_id_seq', 11, true);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


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

