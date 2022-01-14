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
--Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
  2 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  3 | Gabumon | 2018-11-15    |               2 | t        |         8
  5 | Devimon | 2017-05-12    |               5 | t        |        11
(3 rows)


--List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '1-1-2016' AND '1-1-2019';
  name   
-----------
 Gabumon
 Devimon
(2 rows)



--List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered=true AND escape_attempts<3;
  name   
---------
 Agumon
 Gabumon
(2 rows)

--List date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
 date_of_birth 
---------------
 2020-02-03
 2021-01-07
(2 rows)


--List name and escape attempts of animals that weigh more than 10.5kg
SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
  name   | escape_attempts 
---------+-----------------
 Pikachu |               1
 Devimon |               5
2 rows)


--Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = true;
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
  2 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  3 | Gabumon | 2018-11-15    |               2 | t        |         8
  5 | Devimon | 2017-05-12    |               5 | t        |        11
(3 rows)


--Find all animals not named Gabumon.

SELECT * FROM animals WHERE NOT name = 'Gabumon';
id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
----+---------+---------------+-----------------+----------+-----------
 2 | Agumon  | 2020-02-03    |               0 | t        |     10.23
 4 | Pikachu | 2021-01-07    |               1 | f        |     15.04
 5 | Devimon | 2017-05-12    |               5 | t        |        11
(3 rows)

--Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights --that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg 
--+---------+---------------+-----------------+----------+-----------
  4 | Pikachu | 2021-01-07    |               1 | f        |     15.04
  5 | Devimon | 2017-05-12    |               5 | t        |        11
(2 rows)

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
SELECT COUNT(name) FROM animals;
 count 
-------
     9
(1 row)

--How many animals have never tried to escape?
SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;
 count 
-------
     2
(1 row)

--What is the average weight of animals?
 SELECT AVG(weight_kg) FROM animals;
         avg         
---------------------
 16.6444444444444444
(1 row)

--Who escapes the most, neutered or not neutered animals?
 SELECT name, escape_attempts FROM animals WHERE escape_attempts = (SELECT MAX(escape_attempts) FROM animals);
  name   | escape_attempts 
---------+-----------------
 Boarmon |               7
(1 row)

--What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
 species | min | max 
---------+-----+-----
 pokemon |  11 |  17
 digimon |   8 |  45
(2 rows)

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth>='1-1-1990' AND date_of_birth<'1-1-2000' GROUP BY species;
 species |        avg         
---------+--------------------
 pokemon | 3.0000000000000000
(1 row)


-- STARTS HERE --

--What animals belong to Melody Pond?
SELECT animals.name FROM animals 
JOIN owners on animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';

    name    
------------
 Blossom
 Squirtle
 Charmander
(3 rows)


--List of all animals that are pokemon (their type is Pokemon).
SELECT animals.*, species.name as species_name from animals 
JOIN species on animals.species_id = species.id WHERE species.name = 'Pokemon';

    name    | date_of_birth | escape_attempts | neutered | weight_kg | id | species_id | owners_id | species_name 
------------+---------------+-----------------+----------+-----------+----+------------+-----------+--------------
 Blossom    | 1998-10-13    |               3 | t        |        17 |  6 |          1 |         4 | Pokemon
 Squirtle   | 1993-04-02    |               3 | t        |     12.13 |  9 |          1 |         4 | Pokemon
 Charmander | 2020-02-08    |               0 | f        |        11 |  8 |          1 |         4 | Pokemon
 Pikachu    | 2021-01-07    |               1 | f        |     15.04 |  5 |          1 |         2 | Pokemon
(4 rows)




--List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name as animal_name, owners.fulL_name as owner_name from owners 
LEFT JOIN animals on owners.id = animals.owners_id;



--How many animals are there per species?
SELECT species.name, COUNT(*) from animals 
JOIN species ON species.id = animals.species_id GROUP BY species.name;

  name   | count 
---------+-------
 Pokemon |     4
 Digimon |     5
(2 rows)


--List all Digimon owned by Jennifer Orwell.
SELECT animals.name as animal_name, owners.full_name as owner_name, species.name as species_name from animals
JOIN species ON species.id = animals.species_id JOIN owners ON owners.id = animals.owners_id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

 animal_name |   owner_name    | species_name 
-------------+-----------------+--------------
 Gabumon     | Jennifer Orwell | Digimon
(1 row)



--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * from animals
JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

 name | date_of_birth | escape_attempts | neutered | weight_kg | id | species_id | owners_id | id | full_name | age 
------+---------------+-----------------+----------+-----------+----+------------+-----------+----+-----------+-----
(0 rows)


--Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) as num_animals from owners
LEFT JOIN animals ON owners.id = animals.owners_id GROUP BY owners.full_name ORDER BY num_animals DESC;


    full_name    | num_animals 
-----------------+-------------
 Melody Pond     |           3
 Jodie Whittaker |           2
 Jennifer Orwell |           2
 Bob             |           1
 Sam Smith       |           1
(5 rows)

-- LAST DAY HERE --

-- Who was the last animal seen by William Tatcher?
SELECT animals.name, vets.name, visits.date_of_visit from vets
JOIN visits ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(*) as num_animals_visited from vets
	JOIN visits ON vets.id = visits.vets_id
	WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name,species.name as specializedin from vets
LEFT JOIN specializations ON specializations.vets_id = vets.id
LEFT JOIN  species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name as animal_name, visits.date_of_visit from animals
JOIN visits ON visits.animals_id = animals.id
JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez' 
AND visits.date_of_visit >= '2020-04-01' 
AND visits.date_of_visit <= '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) as count from animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY animals.name
ORDER BY count DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT vets.name, visits.date_of_visit, animals.name from visits 
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT
	date_of_visit,
	animals.date_of_birth as animal_dob,
	animals.escape_attempts,
	animals.neutered,
	animals.weight_kg as animal_weight,
	vets.name as vet_name,
	vets.age as vet_age,
	vets.date_of_graduation
from visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY date_of_visit LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) from visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
JOIN specializations ON specializations.vets_id = visits.vets_id WHERE animals.species_id != specializations.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name as species, COUNT(*) from visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith'
GROUP BY species.name; 

