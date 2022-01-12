-- STARTS FROM LINE 165
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
2	Agumon	2020-02-03	0	t	10.23	digimon
3	Gabumon	2018-11-15	2	t	8	digimon
5	Devimon	2017-05-12	5	t	11	digimon
10	Boarmon	2005-06-07	7	t	20.4	digimon
4	Pikachu	2021-01-07	1	f	15.04	pokemon
11	Blossom	1998-10-13	3	t	17	pokemon
9	Angemon	2005-06-12	1	t	45	digimon
6	Charmander	2020-02-08	0	f	11	pokemon
8	Squirtle	1993-04-02	3	t	12.13	pokemon
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

--Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';
-- id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
--  2 | Agumon  | 2020-02-03    |               0 | t        |     10.23
--  3 | Gabumon | 2018-11-15    |               2 | t        |         8
--  5 | Devimon | 2017-05-12    |               5 | t        |        11
--(3 rows)


--List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '1-1-2016' AND '1-1-2019';
--  name   
-----------
-- Gabumon
-- Devimon
--(2 rows)



--List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered=true AND escape_attempts<3;
--  name   
---------
-- Agumon
-- Gabumon
--(2 rows)

--List date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
-- date_of_birth 
---------------
-- 2020-02-03
-- 2021-01-07
--(2 rows)


--List name and escape attempts of animals that weigh more than 10.5kg
SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
--  name   | escape_attempts 
---------+-----------------
-- Pikachu |               1
-- Devimon |               5
--(2 rows)


--Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = true;
-- id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
--  2 | Agumon  | 2020-02-03    |               0 | t        |     10.23
--  3 | Gabumon | 2018-11-15    |               2 | t        |         8
--  5 | Devimon | 2017-05-12    |               5 | t        |        11
--(3 rows)


--Find all animals not named Gabumon.

SELECT * FROM animals WHERE NOT name = 'Gabumon';
-- id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
--  2 | Agumon  | 2020-02-03    |               0 | t        |     10.23
--  4 | Pikachu | 2021-01-07    |               1 | f        |     15.04
--  5 | Devimon | 2017-05-12    |               5 | t        |        11
--(3 rows)

--Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights --that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
-- id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
--  4 | Pikachu | 2021-01-07    |               1 | f        |     15.04
--  5 | Devimon | 2017-05-12    |               5 | t        |        11
--(2 rows)


-- PLEASE NOTE THAT PROJECT REQUIRMENTS START FROM HERE

--Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that species columns went back to the state before tranasction.
BEGIN;
BEGIN
UPDATE animals SET species = 'unspecified';
UPDATE 10
ROLLBACK;
ROLLBACK

vet-clinic=# SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  2 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | 
  3 | Gabumon    | 2018-11-15    |               2 | t        |         8 | 
  4 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | 
  5 | Devimon    | 2017-05-12    |               5 | t        |        11 | 
  6 | Charmander | 2020-02-08    |               0 | f        |       -11 | 
  7 | Plantmon   | 2022-11-15    |               2 | t        |      -5.7 | 
  8 | Squirtle   | 1993-04-02    |               3 | t        |    -12.13 | 
  9 | Angemon    | 2005-06-12    |               1 | t        |       -45 | 
 10 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | 
 11 | Blossom    | 1998-10-13    |               3 | t        |        17 | 
(10 rows)


--Inside a transaction:
--Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
--Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
--Commit the transaction.
--Verify that change was made and persists after commit.

BEGIN;
BEGIN
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE 6
UPDATE animals SET species = 'pokemon' WHERE species is NULL;
UPDATE 4
COMMIT;
COMMIT
SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  2 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  3 | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
  5 | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
  7 | Plantmon   | 2022-11-15    |               2 | t        |      -5.7 | digimon
  9 | Angemon    | 2005-06-12    |               1 | t        |       -45 | digimon
 10 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  4 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  6 | Charmander | 2020-02-08    |               0 | f        |       -11 | pokemon
  8 | Squirtle   | 1993-04-02    |               3 | t        |    -12.13 | pokemon
 11 | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
(10 rows)


--Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction.

BEGIN;
BEGIN
DELETE FROM animals;
DELETE 10
ROLLBACK;
ROLLBACK
SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  2 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  3 | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
  5 | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
  7 | Plantmon   | 2022-11-15    |               2 | t        |      -5.7 | digimon
  9 | Angemon    | 2005-06-12    |               1 | t        |       -45 | digimon
 10 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  4 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  6 | Charmander | 2020-02-08    |               0 | f        |       -11 | pokemon
  8 | Squirtle   | 1993-04-02    |               3 | t        |    -12.13 | pokemon
 11 | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
(10 rows)

--Inside a transaction:
--Delete all animals born after Jan 1st, 2022.
--Create a savepoint for the transaction.
--Update all animals' weight to be their weight multiplied by -1.
--Rollback to the savepoint
--Update all animals' weights that are negative to be their weight multiplied by -1.
--Commit transaction

BEGIN;
BEGIN
DELETE FROM animals WHERE date_of_birth > '1-1-2022';
DELETE 1
SAVEPOINT delete_elder;
SAVEPOINT
UPDATE animals SET weight_kg = -1 * weight_kg;
UPDATE 9
ROLLBACK TO delete_elder;
ROLLBACK
UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
UPDATE 3
SELECT * FROM animals;
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species 
----+------------+---------------+-----------------+----------+-----------+---------
  2 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  3 | Gabumon    | 2018-11-15    |               2 | t        |         8 | digimon
  5 | Devimon    | 2017-05-12    |               5 | t        |        11 | digimon
 10 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  4 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
 11 | Blossom    | 1998-10-13    |               3 | t        |        17 | pokemon
  9 | Angemon    | 2005-06-12    |               1 | t        |        45 | digimon
  6 | Charmander | 2020-02-08    |               0 | f        |        11 | pokemon
  8 | Squirtle   | 1993-04-02    |               3 | t        |     12.13 | pokemon
(9 rows)

COMMIT;
COMMIT

--How many animals are there?
vet-clinic=# SELECT COUNT(name) FROM animals;
 count 
-------
     9
(1 row)

--How many animals have never tried to escape?
vet-clinic=# SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;
 count 
-------
     2
(1 row)

--What is the average weight of animals?
vet-clinic=# SELECT AVG(weight_kg) FROM animals;
         avg         
---------------------
 16.6444444444444444
(1 row)

--Who escapes the most, neutered or not neutered animals?
vet-clinic=# SELECT name, escape_attempts FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
  name   | escape_attempts 
---------+-----------------
 Boarmon |               7
(1 row)

--What is the minimum and maximum weight of each type of animal?
vet-clinic=# SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
 species | min | max 
---------+-----+-----
 pokemon |  11 |  17
 digimon |   8 |  45
(2 rows)

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
vet-clinic=# SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth>='1-1-1990' AND date_of_birth<'1-1-2000' GROUP BY species;
 species |        avg         
---------+--------------------
 pokemon | 3.0000000000000000
(1 row)




