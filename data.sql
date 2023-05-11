/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

/* day 1 database */

/* inserting values in animals table */

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Agumon', '2020-02-03', 0, true, 10.23);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Gabumon', '2018-11-15', 2, true, 08.00);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Pikachu', '2021-01-07', 1, false, 15.04);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Davimon', '2017-05-12', 5, true, 11.00);

/* day 2  database */

/*  His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.  */
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 'Charmander', '2020-02-08', 0, false, -11.00);
/* Her name is Plantmon. She was born on Nov 15th, 2021, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times. */
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 'Plantmon', '2021-11-15', 2, true, -5.7);
/* His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to escape 3 times. */
 insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 'Squirtle', '1993-04-02', 3, false, -12.13);
/* His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once. */
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 'Angemon', '2005-06-12', 1, true, -45.00);
/* His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times. */
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 'Boarmon', '2005-06-07', 7, true, 20.04);
/* Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times. */
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 'Blossom', '1998-10-13', 3, true, 17.00);
/*His name is Ditto. He was born on May 14th, 2022, and currently weighs 22kg. He is neutered and he has tried to escape 4 times.  */
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ( 'Ditto', '2022-05-14', 4, true, 22.00); 

/* insertions into owners table */

/* insert Sam Smith 34 years old on owners table */
insert into owners ( full_name, age) values ('Sam Smith', 34);
/* insert Jennifer Orwell 19 years old. */
insert into owners ( full_name, age) values ('Jennifer Orwell', 19);
/* insert Bob 45 years old */
 insert into owners ( full_name, age) values ('Bob ', 45);
/* insert  Melody Pond 77 years old */
insert into owners ( full_name, age) values ('Melody Pond ', 77);
/* insert Dean Winchester 14 years old. */
insert into owners ( full_name, age) values ('Dean Winchester', 14);
/* insert Jodie Whittaker 38 years old. */
 insert into owners ( full_name, age) values ('Jodie Whittaker', 38);


/* insertions into species table */

/* insert pokemon and Digimon */
insert into species(name) values ('Pokemon'),('Digimon');


/* modification of inserted animals species */
BEGIN WORK;
update animals SET species_id = 1 WHERE name NOT LIKE '%mon'; 
update animals SET species_id = 2 WHERE name LIKE '%mon';
COMMIT WORK;


/* modification of inserted animals owners */
BEGIN WORK;
-- Sam Smith owns Agumon
update animals SET owner_id = owners.id 
FROM owners 
WHERE animals.name='Agumon' AND owners.full_name='Sam Smith';

-- Jennifer Orwell owns Gabumon and Pikachu
update animals SET owner_id = owners.id 
FROM owners 
WHERE (owners.full_name='Jennifer Orwell') AND (animals.name='Gabumon' OR animals.name='Pikachu');

-- Bob owns Devimon and Plantmon
update animals SET owner_id = owners.id 
FROM owners 
WHERE (owners.full_name='Bob') AND (animals.name='Devimon' OR animals.name='Plantmon');

-- Melody Pond owns Charmander, Squirtle, and Blossom
update animals SET owner_id = owners.id 
FROM owners 
WHERE (owners.full_name='Melody Pond') 
AND (animals.name='Charmander' OR animals.name='Squirtle' OR animals.name='Blossom');

-- Dean Winchester owns Angemon and Boarmon
update animals SET owner_id = owners.id 
FROM owners 
WHERE (owners.full_name='Dean Winchester') AND (animals.name='Angemon' OR animals.name='Boarmon');

COMMIT WORK;


/* project day 4 */
/* insert data in vets table */
/* insert William Tatcher is 45 years old and graduated Apr 23rd, 2000 */
insert into vets (name, age, date_of_graduation) values ('William Tatcher', 45, '2000-04-23');
/* insert Maisy Smith is 26 years old and graduated Jan 17th, 2019 */
insert into vets (name, age, date_of_graduation) values ('Maisy Smith', 26, '2019-01-17');
/* insert Stephanie Mendez is 64 years old and graduated May 4th, 1981 */
insert into vets (name, age, date_of_graduation) values ('Stephanie Mendez', 64, '1981-05-04');
/* insert  Jack Harkness is 38 years old and graduated Jun 8th, 2008 */
insert into vets (name, age, date_of_graduation) values ('Jack Harkness', 38, '2008-06-08');

/* insert data in specializations table */
INSERT INTO specializations (species_id, vets_id) values ((select id from species where name ='Pokemon'),(select id from vets where name ='William Tatcher'));
INSERT INTO specializations (vets_id, species_id) values ((SELECT id FROM vets WHERE name ='Stephanie Mendez'),(SELECT id FROM species WHERE name='Pokemon'));
INSERT INTO specializations (vets_id, species_id) values ((SELECT id FROM vets WHERE name ='Stephanie Mendez'),(SELECT id FROM species WHERE name='Digimon'));
INSERT INTO specializations (vets_id, species_id) values ((select id from vets where name ='Jack Harkness'),(select id from species where name='Digimon'));

/* insert data in visits table */

INSERT INTO visits (animals_id, vets_id, visit_date) VALUES (
(
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id from vets WHERE name = 'William Tatcher'),
  ('2020-05-24')
),
(
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  ('2020-07-22')
),
(
  (SELECT id from animals WHERE name = 'Gabumon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  ('2021-02-02')
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2020-01-05')
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2020-03-08')
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2020-05-14')
),
(
  (SELECT id from animals WHERE name = 'Devimon'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  ('2021-05-04')
),
(
  (SELECT id from animals WHERE name = 'Charmander'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  ('2021-02-24')
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2019-12-21')
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'William Tatcher'),
  ('2020-08-10')
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2021-04-07')
),
(
  (SELECT id from animals WHERE name = 'Squirtle'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  ('2019-09-29')
),
(
  (SELECT id from animals WHERE name = 'Angemon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  ('2020-10-03')
),
(
  (SELECT id from animals WHERE name = 'Angemon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  ('2020-11-04')
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2019-01-24')
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2019-05-15')
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2020-02-27')
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  ('2020-08-03')
),
(
  (SELECT id from animals WHERE name = 'Blossom'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  ('2020-05-24')
),
(
  (SELECT id from animals WHERE name = 'Blossom'),
  (SELECT id from vets WHERE name = 'William Tatcher'),
  ('2021-01-11')
)
);