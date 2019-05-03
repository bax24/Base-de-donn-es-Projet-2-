<!DOCTYPE html>
<html>
<head>
	<title>Scientica</title>
</head>
<body>
	<?php 
		$bdd = new PDO('mysql:host=ms800.montefiore.ulg.ac.be;dbname=group22;charset=utf8','group22','PKuqfs3Ucm');
		$reponse = $bdd->query('SELECT matricule_premier_auteur, titre, date_publication, "articles de journal" AS type 
								FROM articles, articles_journaux 
								WHERE articles.url = articles_journaux.url AND articles.matricule_premier_auteur = 5 
								UNION
								SELECT matricule_premier_auteur, titre, date_publication, "articles de conférence" AS type 
								FROM articles, articles_conferences 
								WHERE articles.url = articles_conferences.url AND articles.matricule_premier_auteur = 5');


		while ($donnees = $reponse->fetch()){
			echo '<p>' . $donnees['titre'] . '</p>';
		}

 	?>
</body>
</html>