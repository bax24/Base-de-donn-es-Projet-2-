

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<link rel="stylesheet"  href="../style.css"/>
	<title>Scientica</title>
</head>
<body>
	<h1>Retrouver l'ensemble des publications d'un chercheur en fonction de son matricule</h1>
	<?php
		if(isset($_POST['matricule'])){
			$bdd = new PDO('mysql:host=ms800.montefiore.ulg.ac.be;dbname=group22;charset=utf8','group22','PKuqfs3Ucm');
			$req = $bdd->prepare('SELECT publications_chercheurs.titre, publications_chercheurs.date_publication, publications_chercheurs.type, seconds_auteurs.matricule
								FROM seconds_auteurs
								RIGHT JOIN(
									SELECT articles.matricule_premier_auteur, articles.titre, articles.date_publication, "journal" AS type, articles.url
									FROM articles, articles_journaux 
									WHERE articles.url = articles_journaux.url 
										AND articles.matricule_premier_auteur = ? 
									UNION
									SELECT articles.matricule_premier_auteur, articles.titre, articles.date_publication, "conférence" AS type, articles.url
									FROM articles, articles_conferences 
									WHERE articles.url = articles_conferences.url 
										AND articles.matricule_premier_auteur = ?
								) AS publications_chercheurs
								ON publications_chercheurs.url = seconds_auteurs.url
								ORDER BY publications_chercheurs.date_publication DESC');

			$req->execute(array($_POST['matricule'], $_POST['matricule']));
	?>
			
			<div class="Table">
				<table class="TableResult">
				        <tr>
				            <td> <h2>Titre</h2></td>
							<td><h2>Date de publication</h2></td>
							<td><h2>Type</h2></td>
							<td><h2>Matricule(s) second(s) auteur(s)</h2></td>
				        </tr>
				        <?php
				    		while ($donnees = $req->fetch()){
									echo("<tr>");
									echo("<td>".$donnees['titre']."</td>");
									echo("<td>".$donnees['date_publication']."</td>");
									echo("<td>".$donnees['type']."</td>");
									echo("<td>".$donnees['matricule']."</td>");
									echo("</tr>");
							}
						?>
						
				</table>
			</div>
		<?php
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

 	?>
</body>
</html>