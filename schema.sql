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


 -- 4th day project 
-- Create table vets
CREATE TABLE  vets (
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar(60),
  age int,
  date_of_graduation date,
  primary key(id)
);

--create specializations table
CREATE TABLE specializations (
  id int primary key GENERATED ALWAYS AS IDENTITY,
  species_id int REFERENCES species(id),
  vets_id int REFERENCES vets(id) 
);

-- Create table visits
CREATE TABLE visits (
  id int primary key GENERATED ALWAYS AS IDENTITY,
  animals_id int REFERENCES animals(id),
  vets_id int REFERENCES vets(id),
  visit_date date
);

/*  day 4 project performance  audit  in week 2 */
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

 CREATE INDEX visit_index_desc on visits(animals_id desc );

 /* vet_clinic database schema dia gram */

 Blank diagram.png


