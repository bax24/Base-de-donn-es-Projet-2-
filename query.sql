--Question B

SELECT matricule_premier_auteur, titre, date_publication, 'articles de journal' AS type FROM articles, articles_journaux 
WHERE articles.url = articles_journaux.url AND articles.matricule_premier_auteur = 5 
UNION
SELECT matricule_premier_auteur, titre, date_publication, 'articles de conférence' AS type FROM articles, articles_conferences 
WHERE articles.url = articles_conferences.url AND articles.matricule_premier_auteur = 5 

-- Récupérer les seconds auteurs si il y en a 

SELECT  nom, prenom, auteurs.matricule FROM seconds_auteurs, auteurs 
WHERE EXISTS 
			( SELECT * FROM articles 
			WHERE articles.url = seconds_auteurs.url and articles.url= 'http://fake.url.com/0000003191.pdf') 
AND seconds_auteurs.matricule = auteurs.matricule

--Question D

SELECT auteurs.matricule,nom, prenom FROM participations_conferences, auteurs WHERE participations_conferences.matricule NOT IN 
	(SELECT participations_conferences.matricule FROM participations_conferences WHERE participations_conferences.tarif != "author fee" ) 
AND auteurs.matricule = participations_conferences.matricule GROUP BY participations_conferences.matricule ORDER BY participations_conferences.matricule 

--Question E
SELECT  sujets_articles.sujet, COUNT(*) AS occ FROM sujets_articles, articles_conferences WHERE sujets_articles.url = articles_conferences.url 
GROUP BY sujets_articles.sujet ORDER BY occ DESC /*Trouver les sujets de conférence les plus étudiés */

SELECT participations_conferences.matricule, participations_conferences.nom_conference, COUNT(*) AS npart FROM participations_conferences 
WHERE participations_conferences.annee_conference >= 2012 GROUP BY participations_conferences.nom_conference 
ORDER BY npart DESC LIMIT 5 /*5 conférences les plus populaires depuis 2012*/