

<!DOCTYPE html>
<html>
<head>
	<title>Scientica</title>
</head>
<body>
	<h1>Retrouver mon cul en fct du matricule</h1>
	<?php
	/*if(isset($_SESSION['user'])){
		?>
		
		<?php*/
		if(isset($_POST['matricule'])){
			$bdd = new PDO('mysql:host=ms800.montefiore.ulg.ac.be;dbname=group22;charset=utf8','group22','PKuqfs3Ucm');
			$req = $bdd->prepare('SELECT publications_chercheurs.titre, publications_chercheurs.date_publication, publications_chercheurs.type, 
									GROUP_CONCAT(DISTINCT seconds_auteurs.matricule) AS matricules_seconds_auteurs
								FROM seconds_auteurs
								INNER JOIN(
									SELECT articles.matricule_premier_auteur, articles.titre, articles.date_publication, "articles de journal" AS type, articles.url
									FROM articles, articles_journaux 
									WHERE articles.url = articles_journaux.url 
										AND articles.matricule_premier_auteur = ? 
									UNION
									SELECT articles.matricule_premier_auteur, articles.titre, articles.date_publication, "articles de conférence" AS type, articles.url
									FROM articles, articles_conferences 
									WHERE articles.url = articles_conferences.url 
										AND articles.matricule_premier_auteur = ?
								) AS publications_chercheurs
								ON publications_chercheurs.url = seconds_auteurs.url');

			$req->execute(array($_POST['matricule'], $_POST['matricule']));
			while ($donnees = $req->fetch())
				echo '<p> titre' . $donnees['titre'] .  'seconds_auteurs' .$donnees['matricules_seconds_auteurs']. '</p>';
		}
		else{
			?>
			<div >
				<form method="post" action="ArticleMat.php">
					<label for="matricule ">Matricule</label>
					<input type="number" min="0" name="matricule" autofocus required placeholder="Matricule" id="matricule">
					<input type="submit" value="Valider" id="valider">
				</form>
			</div>
			<?php
		}

	/*}
	else{
		echo "Not connected";
		header("Location: index.php")
	}*/

 	?>
</body>
</html>