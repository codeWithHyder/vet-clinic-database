/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

/* first query, to select all names ending in mon */

SELECT * FROM animals WHERE name LIKE '%mon';



/* second query, selects names of animals between given dates */

SELECT name FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';


/* third query , select names of animals who are neutered and have escape attempts less than 3 */

 SELECT name FROM animals
 WHERE neutered = true AND escape_attempts < 3;



/* fourth query, selects date of birth of animals who are agumon and Pikachu*/

                                                              ^
SELECT date_of_birth FROM animals
 WHERE name IN ('Agumon', 'Pikachu');



/* fifth query, select name and number of escape attempts who have weight more than 10.5 kg */


 select name, escape_attempts from animals where weight_kg > 10.5;



/* sixth query, select all animals who are neutered */


 select * from animals where neutered = true;


/* seventh  query, select all animals who are not Gabumon */


 SELECT * FROM animals
 WHERE name != 'Gabumon';



/* eighth query, selects all animals whose weight are more than or equal to 10.4 kg and lighter than or equal to 17.3 kg */
 select * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

/* Transactions */

 BEGIN; -- start transaction

  UPDATE animals
  SET species = 'unspecified'; -- make change

  SELECT species from animals; -- verify that change was made
  ROLLBACK;

  SELECT species from animals; -- verify that change was undone
/* transaction */
 BEGIN;
   UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
   UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

   SELECT species from animals; -- verify that change was made
   COMMIT;
   SELECT species from animals; -- verify that change persists after commit

/*  Update the animals table by setting the species column to pokemon for all animals that don't have species already set. */
update animals set species = 'pokemon' where species <> 'digimon';
/*   Verify that changes were made */
select * from animals;

/* transaction */
  BEGIN;

   DELETE FROM animals WHERE ;
   SELECT COUNT(*) FROM ANIMALS;

   ROLLBACK;
   SELECT COUNT(*) FROM ANIMALS;

   /* transaction */
   BEGIN;

    DELETE FROM animals WHERE  date_of_birth > '2022/01/01' ;
    SAVEPOINT SP1;

    UPDATE animals SET weight_kg = weight_kg * -1;
    ROLLBACK TO SP1;
    UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

    COMMIT;


  /* How many animals are there? */
  select count(id) from animals;
  /* How many animals have never tried to escape? */
   select * from animals where escape_attempts = 0;
  /*  What is the average weight of animals? */
  select avg(weight_kg) from animals;
  /* Who escapes the most, neutered or not neutered animals? */

SELECT neutered, MAX(escape_attempts) AS total_escape_attempts
FROM animals
GROUP BY neutered;

/* What is the minimum and maximum weight of each type of animal? */
SELECT species, MIN(weight_kg) AS min_weight, Max(weight_kg) AS max_weight
FROM animals
GROUP By species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT species, AVG(escape_attempts) AS total_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01'::date AND '2000-12-31'
GROUP By species;



/* Join Queries */

-- What animals belong to Melody Pond
SELECT * FROM animals JOIN owners ON owners.id = animals.owner_id AND owners.full_name='Melody Pond';


-- List of all animals that are pokemon (their type is Pokemon)
SELECT * FROM animals JOIN species ON species.id = animals.species_id AND species.name='Pokemon';

--List all owners and their animals, remember to include those that don't own any animal
SELECT full_name , name From owners Left JOIN animals ON animals.owner_id=owners.id;

-- How many animals are there per species?
SELECT species.name , COUNT(animals.name) AS Animals_Number
From species
JOIN animals ON species.id=animals.species_id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell
SELECT animals.name, owners.full_name
from animals
JOIN owners
ON (animals.owner_id=owners.id AND owners.full_name = 'Jennifer Orwell')
JOIN species
ON (animals.species_id=species.id AND species.name='Digimon');

-- List all animals owned by Dean Winchester that haven't tried to escape
SELECT owners.full_name, animals.name
FROM owners
JOIN animals
ON animals.owner_id=owners.id AND animals.escape_attempts = 0
WHERE owners.full_name = 'Dean Winchester';

-- Who owns the most animals?
SELECT owners.full_name , COUNT(animals.name) AS Animals_Number
From owners
JOIN animals ON owners.id=animals.owner_id
GROUP BY owners.full_name
ORDER BY Animals_Number DESC;


/* queries project 4th day */

--Who was the last animal seen by William Tatcher?
SELECT animals.name,visits.visit_date
FROM animals,vets,visits
WHERE vets.name = 'William Tatcher'
AND vets.id = visits.vets_id
AND animals.id = visits.animals_id
ORDER BY visits.visit_date DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT vets.name, COUNT(DISTINCT (animals.id))
FROM vets, animals, visits
WHERE vets.name = 'Stephanie Mendez'
AND vets.id = visits.vets_id
AND animals.id = visits.animals_id
GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties
SELECT vets.name,species.name
FROM vets
LEFT JOIN specializations
ON vets.id = specializations.vets_id
LEFT JOIN species
ON species.id = specializations.species_id
ORDER BY vets.id;

--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name,visits.visit_date
FROM animals,vets,visits
WHERE vets.name = 'Stephanie Mendez'
AND vets.id = visits.vets_id
AND animals.id = visits.animals_id
AND visits.visit_date BETWEEN '2020,04,01'::date AND '2020,08,30'::date
ORDER BY visits.visit_date;

--What animal has the most visits to vets?
SELECT animals.name, COUNT(visits.animals_id)
from animals,visits
WHERE animals.id = visits.animals_id
GROUP BY animals.name,visits.animals_id
ORDER BY COUNT(visits.animals_id) DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT vets.name, animals.name, visits.visit_date
FROM vets,animals,visits
WHERE vets.name = 'Maisy Smith'
AND vets.id = visits.vets_id
AND animals.id = visits.animals_id
ORDER BY visits.visit_date
LIMIT 1;

--Details for most recent visit: animal information, vet information, and date of visit
SELECT animals.name AS animal_name,
animals.date_of_birth AS animal_birthday,
animals.escape_attempts AS animal_escape_attempt,
animals.neutered AS animal_neutered,
animals.weight_kg AS animal_weight,
species.name AS animal_species,
vets.name AS vet_name,
vets.age AS vet_age,
vets.date_of_graduation AS vey_graduation_date,
visits.visit_date
From animals,vets,visits,species
WHERE animals.id = visits.animals_id
AND animals.species_id = species.id
AND vets.id = visits.vets_id
ORDER BY visits.visit_date DESC
limit 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name, COUNT( vets.id) AS number_of_visits
FROM vets,visits
WHERE vets.id = visits.vets_id
AND vets.id NOT IN (SELECT vets_id FROM specializations)
GROUP BY vets.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
Select vets.name AS vet_name,species.name AS species_name, COUNT(visits.animals_id) AS number_visits
FROM vets,visits,animals,species
WHERE vets.name = 'Maisy Smith'
AND vets.id = visits.vets_id
AND visits.animals_id = animals.id
AND animals.species_id = species.id
GROUP BY vet_name, species_name
ORDER BY number_visits DESC
LIMIT 1;

/* day 4 project performance audit week 2 */

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where VETS_id = 2;

