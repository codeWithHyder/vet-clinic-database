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