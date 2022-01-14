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

-- STARTS HERE --

--Sam Smith 34 years old.
INSERT INTO owners (
    full_name,
    age
    ) VALUES (
        'Sam Smith',
        34
        );

--Jennifer Orwell 19 years old.
INSERT INTO owners (
    full_name,
    age
    ) VALUES (
        'Jennifer Orwell',
        19
        );

--Bob 45 years old.
INSERT INTO owners (
    full_name,
    age
    ) VALUES (
        'Bob',
        45
        );

--Melody Pond 77 years old.
INSERT INTO owners (
    full_name,
    age
    ) VALUES (
        'Melody Pond',
        77
        );

--Dean Winchester 14 years old.
INSERT INTO owners (
    full_name,
    age
    ) VALUES (
        'Dean Winchester',
        14
        );

--Jodie Whittaker 38 years old.
INSERT INTO owners (
    full_name,
    age
    ) VALUES (
        'Jodie Whittaker',
        38
        );

--SPECIES TABLE DATA

--Pokemon
INSERT INTO species (
    name
    ) VALUES (
        'Pokemon'
        );

--Digimon
INSERT INTO species (
    name
    ) VALUES (
        'Digimon'
        );

--Modify inserted animals so it includes the species_id value:

--All other animals are Pokemon
UPDATE animals SET species_id = 1;
--If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = 2 WHERE id=1;
UPDATE animals SET species_id = 2 WHERE id=2;
UPDATE animals SET species_id = 2 WHERE id=3;
UPDATE animals SET species_id = 2 WHERE id=4;
UPDATE animals SET species_id = 2 WHERE id=7;

--Modify your inserted animals to include owner information (owner_id):
--Sam Smith owns Agumon.
UPDATE animals SET owners_id = 1 WHERE name='Agumon';

--Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owners_id = 2 WHERE name='Gabumon';
UPDATE animals SET owners_id = 2 WHERE name='Pikachu';

--Bob owns Devimon and Plantmon.
UPDATE animals SET owners_id = 3 WHERE name='Devimon';
UPDATE animals SET owners_id = 3 WHERE name='Plantmon';

--Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owners_id = 4 WHERE name='Charmander';
UPDATE animals SET owners_id = 4 WHERE name='Squirtle';
UPDATE animals SET owners_id = 4 WHERE name='Blossom';

--Dean Winchester owns Angemon and Boarmon. 
UPDATE animals SET owners_id = 5 WHERE name='Angemon';       
UPDATE animals SET owners_id = 5 WHERE name='Boarmon'; 

-- LAST DAY HERE --

INSERT INTO vets (
    name,
    age,
    date_of_graduation
    ) VALUES
    ('Vet William Tatcher', 45, '2000-4-23'),
    ('Vet Maisy Smith', 26, '2019-1-17'),
    ('Vet Stephanie Mendez', 64, '1981-5-4'),
    ('Vet Jack Harkness', 38, '2008-6-8');


    INSERT INTO specializations (
    species_id,
    vets_id
    ) VALUES
    (1, 1),
    (1, 3),
    (2, 3),
    (2, 4);



    INSERT INTO visits (
    animals_id,
    vets_id,
    date_of_visit
    ) VALUES
    ((SELECT id FROM animals WHERE name = 'Agumon'), 
    (SELECT id FROM vets WHERE name = 'Vet William Tatcher'), 
    '2020-05-24'),
    ((SELECT id FROM animals WHERE name = 'Agumon'), 
    (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), 
    '2020-07-22'),
    ((SELECT id FROM animals WHERE name = 'Gabumon'), 
    (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), '
    2021-02-02'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), 
    (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
    '2020-01-05'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), 
    (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
    '2020-03-08'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), 
    (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
    '2020-05-14'),
    ((SELECT id FROM animals WHERE name = 'Devimon'), 
    (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), 
    '2021-05-04'),
    ((SELECT id FROM animals WHERE name = 'Charmander'), 
    (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), '
    2021-02-24'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), 
    (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
    '2019-12-21'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), 
    (SELECT id FROM vets WHERE name = 'Vet William Tatcher'), 
    '2020-08-10'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), 
    (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
    '2021-04-07'),
    ((SELECT id FROM animals WHERE name = 'Squirtle'), 
    (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), 
    '2019-09-29'),
    ((SELECT id FROM animals WHERE name = 'Angemon'), 
    (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), 
    '2020-10-03'),
    ((SELECT id FROM animals WHERE name = 'Angemon'), 
    (SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), 
    '2020-11-04'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
    '2019-01-24'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
    '2019-05-15'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
    '2020-02-27'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), 
    '2020-08-03'),
    ((SELECT id FROM animals WHERE name = 'Blossom'), 
    (SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), 
    '2020-05-24'),
    ((SELECT id FROM animals WHERE name = 'Blossom'), 
    (SELECT id FROM vets WHERE name = 'Vet William Tatcher'), 
    '2021-01-11'); 
