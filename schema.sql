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


