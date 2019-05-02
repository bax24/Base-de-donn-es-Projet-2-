<?php session_start(); ?>
<?php 
	if(isset($_POST['login']) AND isset($_POST['passwd']) AND 
		$_POST['login'] == "group22" AND $_POST['passwd'] == "p"){
		$_SESSION['user'] = $_POST['login'];
	}
	?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<link rel="stylesheet" href="style.css" />
		<title>Scientica</title>
	</head>
	<?php 
	if(isset($_SESSION['user'])){
	?>
		<body>
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



			<form method="post" action="traitement.php">

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
			<div id="logout">
				<a href='logout.php'> Logout</a>
			</div>
		</body>
	<?php 
	}
	else{
		echo "Not connected";
		header("Location: index.php");
	}
	?>
</html>