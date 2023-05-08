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

 