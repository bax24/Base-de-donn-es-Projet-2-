--Question B

SELECT matricule_premier_auteur, titre, date_publication, 'articles de journal' AS type 
FROM articles, articles_journaux 
WHERE articles.url = articles_journaux.url 
	AND articles.matricule_premier_auteur = 5 
UNION
SELECT matricule_premier_auteur, titre, date_publication, 'articles de conférence' AS type 
FROM articles, articles_conferences 
WHERE articles.url = articles_conferences.url 
	AND articles.matricule_premier_auteur = 5 

-- Récupérer les seconds auteurs si il y en a 

SELECT  nom, prenom, auteurs.matricule 
FROM seconds_auteurs, auteurs 
WHERE EXISTS 
	( SELECT * FROM articles 
	WHERE articles.url = seconds_auteurs.url 
		AND articles.url= 'http://fake.url.com/0000003191.pdf') 
	AND seconds_auteurs.matricule = auteurs.matricule

--Final version
SELECT publications_chercheurs.titre, publications_chercheurs.date_publication, publications_chercheurs.type, GROUP_CONCAT(DISTINCT seconds_auteurs.matricule) AS matricules_seconds_auteurs
FROM seconds_auteurs
INNER JOIN(
	SELECT articles.matricule_premier_auteur, articles.titre, articles.date_publication, 'articles de journal' AS type, articles.url
	FROM articles, articles_journaux 
	WHERE articles.url = articles_journaux.url 
		AND articles.matricule_premier_auteur = 5 
	UNION
	SELECT articles.matricule_premier_auteur, articles.titre, articles.date_publication, 'articles de conférence' AS type, articles.url
	FROM articles, articles_conferences 
	WHERE articles.url = articles_conferences.url 
		AND articles.matricule_premier_auteur = 5
) AS publications_chercheurs
ON publications_chercheurs.url = seconds_auteurs.url

--Question D

SELECT auteurs.matricule,nom, prenom 
FROM participations_conferences, auteurs 
WHERE participations_conferences.matricule NOT IN 
	(SELECT participations_conferences.matricule 
		FROM participations_conferences 
		WHERE participations_conferences.tarif != "author fee" ) 
	AND auteurs.matricule = participations_conferences.matricule 
GROUP BY participations_conferences.matricule 
ORDER BY participations_conferences.matricule 

--Question E

/*sujets de ces articles*/
SELECT sujets_articles.sujet, COUNT(*) as occ
FROM sujets_articles
INNER JOIN(
	/*articles présentés dans ces 5 conférences*/
	SELECT articles_conferences.url, articles_conferences.nom_conference	
	FROM articles_conferences
	INNER JOIN(
		/*5 conférences les plus populaires depuis 2012*/
		SELECT participations_conferences.nom_conference, COUNT(*) AS npart 
		FROM participations_conferences 
		WHERE participations_conferences.annee_conference >= 2012 
		GROUP BY participations_conferences.nom_conference 
		ORDER BY npart DESC LIMIT 5 
	) AS top_conf

	ON articles_conferences.nom_conference = top_conf.nom_conference
) AS top_articles
ON sujets_articles.url = top_articles.url 
GROUP BY sujets_articles.sujet
ORDER BY occ DESC