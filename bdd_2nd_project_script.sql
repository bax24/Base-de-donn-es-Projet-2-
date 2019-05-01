/*DROP DATABASE IF EXISTS bdd_2nd_project;
CREATE DATABASE bdd_2nd_project CHARACTER SET 'utf8';*/

Use bdd_2nd_project;
-- remplacer le nom de la BDD par group22

-- -----------------------------------
-- ----- CREATION DES TABLES ---------
-- -----------------------------------

CREATE TABLE IF NOT EXISTS revues (
	nom VARCHAR(40) NOT NULL,
	impact SMALLINT UNSIGNED,
	PRIMARY KEY(nom)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS conferences (
	nom VARCHAR(60) NOT NULL,
	annee YEAR NOT NULL,
	rue VARCHAR(25),
	numero SMALLINT UNSIGNED,
	ville VARCHAR(20),
	pays VARCHAR(20),
	PRIMARY KEY(nom,annee)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS institutions (
	nom VARCHAR(40) NOT NULL,
	rue VARCHAR(40),
	numero SMALLINT UNSIGNED,
	ville VARCHAR(20),
	pays VARCHAR(30),
	PRIMARY KEY(nom)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS auteurs (
	matricule SMALLINT UNSIGNED NOT NULL,
	nom VARCHAR(30),
	prenom VARCHAR(30),
	debut_doctorat YEAR NOT NULL,
	nom_institution VARCHAR(40) NOT NULL,
	PRIMARY KEY(matricule),
	FOREIGN KEY(nom_institution) REFERENCES institutions(nom)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS articles (
	url CHAR(34) NOT NULL,
	doi BIGINT NOT NULL,
	titre TEXT,
	date_publication VARCHAR(10), -- Format jj/mm/aaaa et non aaaa/mm/jj
	matricule_premier_auteur SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY(url),
	FOREIGN KEY(matricule_premier_auteur) REFERENCES auteurs(matricule)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS sujets_articles (
	url CHAR(34) NOT NULL,
	sujet VARCHAR(30),
	PRIMARY KEY(url,sujet),
	FOREIGN KEY(url) REFERENCES articles(url)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS seconds_auteurs (
	url CHAR(34) NOT NULL,
	matricule SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY(url,matricule),
	FOREIGN KEY(url) REFERENCES articles(url),
	FOREIGN KEY(matricule) REFERENCES auteurs(matricule)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS articles_journaux (
	url CHAR(34) NOT NULL,
	pg_debut SMALLINT UNSIGNED,
	pg_fin SMALLINT UNSIGNED,
	nom_revue VARCHAR(40) NOT NULL,
	n_journal SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY(url),
	FOREIGN KEY(nom_revue) REFERENCES revues(nom)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS articles_conferences (
	url CHAR(34) NOT NULL,
	presentation VARCHAR(25),
	nom_conference VARCHAR(60),
	annee_conference YEAR,
	PRIMARY KEY(url),
	FOREIGN KEY(nom_conference,annee_conference) REFERENCES conferences(nom,annee)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS participations_conferences (
	matricule SMALLINT UNSIGNED NOT NULL,
	nom_conference VARCHAR(60),
	annee_conference YEAR,
	tarif VARCHAR(12),
	PRIMARY KEY(matricule,nom_conference,annee_conference),
	FOREIGN KEY(matricule) REFERENCES auteurs(matricule),
	FOREIGN KEY(nom_conference,annee_conference) REFERENCES conferences(nom,annee)
)ENGINE=InnoDB;


-- ---------------------------------
-- ----- INSERTION DES DONNEES -----
-- ---------------------------------
SET GLOBAL local_infile = 1;

-- Remplacer les path par:
-- /home/backes/WWW/Tables/nomFichierExempleTaGrandMere.csv

LOAD DATA LOCAL INFILE 'C:/Users/Martin/Downloads/Test_SQL/revues.csv'
INTO TABLE revues
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/Martin/Downloads/Test_SQL/conferences.csv'
INTO TABLE conferences
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/Martin/Downloads/Test_SQL/institutions.csv'
INTO TABLE institutions
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/Martin/Downloads/Test_SQL/auteurs.csv'
INTO TABLE auteurs
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/Martin/Downloads/Test_SQL/articles.csv'
INTO TABLE articles
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/Martin/Downloads/Test_SQL/sujets_articles.csv'
INTO TABLE sujets_articles
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/Martin/Downloads/Test_SQL/seconds_auteurs.csv'
INTO TABLE seconds_auteurs
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/Martin/Downloads/Test_SQL/articles_journaux.csv'
INTO TABLE articles_journaux
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/Martin/Downloads/Test_SQL/articles_conferences.csv'
INTO TABLE articles_conferences
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:/Users/Martin/Downloads/Test_SQL/participations_conferences.csv'
INTO TABLE participations_conferences
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES;
