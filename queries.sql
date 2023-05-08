/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

/* first query, to select all names ending in mon */

SELECT * FROM animals WHERE name LIKE '%mon';

 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  2 | Gabumon | 2018-11-15    |               2 | t        |      8.00
  4 | Davimon | 2017-05-12    |               5 | t        |     11.00
(3 rows)

/* second query, selects names of animals between given dates */

SELECT name FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

  name
---------
 Gabumon
 Davimon
(2 rows)

/* third query , select names of animals who are neutered and have escape attempts less than 3 */

 SELECT name FROM animals
 WHERE neutered = true AND escape_attempts < 3;

  name
---------
 Agumon
 Gabumon
(2 rows)

/* fourth query, selects date of birth of animals who are agumon and Pikachu*/

                                                              ^
SELECT date_of_birth FROM animals
 WHERE name IN ('Agumon', 'Pikachu');

 date_of_birth
---------------
 2020-02-03
 2021-01-07
(2 rows)

/* fifth query, select name and number of escape attempts who have weight more than 10.5 kg */


 select name, escape_attempts from animals where weight_kg > 10.5;

  name   | escape_attempts
---------+-----------------
 Pikachu |               1
 Davimon |               5
(2 rows)

/* sixth query, select all animals who are neutered */


 select * from animals where neutered = true;

 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  2 | Gabumon | 2018-11-15    |               2 | t        |      8.00
  4 | Davimon | 2017-05-12    |               5 | t        |     11.00
(3 rows)

/* seventh  query, select all animals who are not Gabumon */


 SELECT * FROM animals
 WHERE name != 'Gabumon';

 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  3 | Pikachu | 2021-01-07    |               1 | f        |     15.04
  4 | Davimon | 2017-05-12    |               5 | t        |     11.00
(3 rows)

/* eighth query, selects all animals whose weight are more than or equal to 10.4 kg and lighter than or equal to 17.3 kg */
 select * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+-----------
  3 | Pikachu | 2021-01-07    |               1 | f        |     15.04
  4 | Davimon | 2017-05-12    |               5 | t        |     11.00
(2 rows)