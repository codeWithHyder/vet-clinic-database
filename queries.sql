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
/*   update the animals table by setting the species column to unspecified */
  update animals set species='unspecified';
/*  Update the animals table by setting the species column to digimon for all animals that have a name ending in mon */
update animals set species = 'digimon' where name like '%mon';
/*  Update the animals table by setting the species column to pokemon for all animals that don't have species already set. */
update animals set species = 'pokemon' where species <> 'digimon';
/*   Verify that changes were made */
select * from animals;
/*  delete all records in the animals table, then roll back the transaction. */
 delete from animals;
 /* rollback */
 rollback;
 /* verify if all records are back after rollback */
 select * from animals;


 /* Delete all animals born after Jan 1st, 2022 */
 delete from animals where date_of_birth > '2022-01-01';
 /* Create a savepoint for the transaction */
  savepoint savepoint_weight1;
  /*Update all animals' weight to be their weight multiplied by -1. */
  update animals set weight_kg = weight_kg * -1;
  /* Rollback to the savepoint */
  rollback to savepoint_weight1;
  /* Update all animals' weights that are negative to be their weight multiplied by -1. */
  update animals set weight_kg = weight_kg * -1 where weight_kg < 0;

  /* Commit transaction */
  commit;


  /* How many animals are there? */
  select count(id) from animals;
  /* How many animals have never tried to escape? */
   select * from animals where escape_attempts = 0;
  /*  What is the average weight of animals? */ 
  select avg(weight_kg) from animals;
  /* Who escapes the most, neutered or not neutered animals? */
  
SELECT neutered, SUM(escape_attempts) AS total_escape_attempts
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


