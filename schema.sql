/* Database schema to keep the structure of entire database. */
/* to create vet_clinic database */
CREATE DATABASE vet_clinic;

/* create table animals using SQL, id field will be auto generated and is primary key */
CREATE TABLE animals (
  id                INT GENERATED ALWAYS AS IDENTITY,
  name              VARCHAR(30),
  date_of_birth     date,
  escape_attempts   INT,
  neutered          bool,
  weight_kg         decimal(4,2),
  PRIMARY KEY(id),
);

/* alter table animals add new column speceies */

ALTER TABLE animals
ADD species varchar(10);

/* Create a table named owners with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
full_name: string
age: integer */
 create table owners (
 id   int generated always as identity,
 full_name  varchar(50),
 age  int,
 primary key(id)
 );

 /* Create a table named species with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
name: string*/

 create table species (
 id    int generated always as identity,
 name varchar(40),
 primary key(id)
 );

/* Remove column species from animals table */
 alter table animals
 drop column species;

/* Add column species_id which is a foreign key referencing species table */
 alter table animals
 add  species_id int,
 add foreign key(species_id) references species(id);

 /* Add column owner_id which is a foreign key referencing the owners table  */ 
 alter table animals
 add owner_id int ,
 add foreign key(owner_id) references owners(id);