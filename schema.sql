--
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
\.


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.animals_id_seq', 5, true);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

