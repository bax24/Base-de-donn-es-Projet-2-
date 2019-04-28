<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="style.css" />
	<title>Scientica</title>
</head>
<body>

	<?php 
	if (isset($_POST['passwd']) AND $_POST['passwd'] ==  "p" AND isset($_POST['login']) AND $_POST['login'] ==  "groupe22") { 
	?>

	<div class="login">
		<form method="post">
			<select name="request"> 
				<option>Afficher des tables</option>
				<option>question 2</option>
				<option>question 3</option>
			</select>
			<p>
				<input type="submit" value="SEARCH" name="search" class="input2">
			</p>
		</form>



	<form method="post" action="request/AfficheTables.php">

			<select name="tables">
				<option>Auteurs</option>
				<option>Institutions</option>
				<option>Articles</option>
				<option>Sujets</option>
				<option>Second auteur</option>
				<option>Articles journal</option>
				<option>Article conférence</option>
				<option>Revue</option>
				<option>Conférence</option>
				<option>Participation conférence</option>
			</select>
		</div>
	</form>


	<?php 

	}

	else{
	?>
		<p> hey baby u're not in</p>

	<?php  
		}
	?>




</body>
</html>