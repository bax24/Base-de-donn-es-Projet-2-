CREATE DATABASE bdd_2nd_project CHARACTER SET 'utf8';

Use bdd_2nd_project;


-- -----------------------------------
-- ----- CREATION DES TABLES ---------
-- -----------------------------------

CREATE TABLE Auteur (
	matricule SMALLINT UNSIGNED NOT NULL,
	nom VARCHAR(30),
	prenom VARCHAR(30),
	debut_doctorat YEAR NOT NULL,
	nom_institution VARCHAR(40),
	PRIMARY KEY (matricule)
);


CREATE TABLE Institution (
	nom VARCHAR(40) NOT NULL,
	rue VARCHAR(40),
	numero SMALLINT UNSIGNED,
	ville VARCHAR(20),
	pays VARCHAR(30),
	PRIMARY KEY (nom)
);

CREATE TABLE Articles (
	url CHAR(34) NOT NULL,
	doi BIGINT NOT NULL,
	titre TEXT,
	date_publication DATE, -- Format jj/mm/aaaa et non aaaa/mm/jj
	matricule_1er_auteur SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY (url)
);

CREATE TABLE Sujets (
	url CHAR(34) NOT NULL,
	sujet VARCHAR(30),
	PRIMARY KEY (url,sujet)
);

CREATE TABLE 2nd_auteur (
	url CHAR(34) NOT NULL,
	matricule_2nd_auteur SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY (url,matricule_2nd_auteur)
);

CREATE TABLE Article_journal (
	url CHAR(34) NOT NULL,
	pg_debut SMALLINT UNSIGNED,
	pg_fin SMALLINT UNSIGNED,
	nom_revue VARCHAR(40) NOT NULL,
	n_journal SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY (url)
);

CREATE TABLE Article_conference (
	url CHAR(34) NOT NULL,
	presentation VARCHAR(25),
	nom_conference VARCHAR(60),
	annee_conference YEAR,
	PRIMARY KEY (url)
);

CREATE TABLE Revue (
	nom VARCHAR(40) NOT NULL,
	impact SMALLINT UNSIGNED,
	PRIMARY KEY (nom)
);

CREATE TABLE Conference (
	nom VARCHAR(60) NOT NULL,
	annee YEAR NOT NULL,
	rue VARCHAR(25),
	numero SMALLINT UNSIGNED,
	ville VARCHAR(20),
	pays VARCHAR(20),
	PRIMARY KEY (nom,annee)
);

CREATE TABLE Participations (
	matricule SMALLINT UNSIGNED NOT NULL,
	nom_conference VARCHAR(60),
	annee_conference YEAR,
	tarif VARCHAR(12),
	PRIMARY KEY (matricule,nom_conference,annee_conference)
);


-- ---------------------------------
-- ----- INSERTION DES DONNEES -----
-- ---------------------------------
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/Martin/Downloads/Test_SQL/auteurs.csv'
INTO TABLE Auteur
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES
(matricule,nom,prenom,debut_doctorat,nom_institution);


-- LOAD DATA LOCAL INFILE '/path/pet.txt' INTO TABLE pet;