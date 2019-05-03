<!DOCTYPE html>
<html>
<head>
	<title>Scientica</title>
</head>
<body>
	<?php 
		$bdd = new PDO('mysql:host=ms800.montefiore.ulg.ac.be;dbname=group22;charset=utf8','group22','PKuqfs3Ucm');
		$reponse = $bdd->query('SELECT * FROM auteurs');
		while ($donnees = $reponse->fetch()){
			echo '<p>' . $donnees['nom'] . '</p>';
		}

	?>
</body>
</html>