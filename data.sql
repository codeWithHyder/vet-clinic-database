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

