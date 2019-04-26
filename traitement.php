<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="style.css" />
	<title>Scientica</title>
</head>
<body>

	<?php 
	if (isset($_POST['passwd']) AND $_POST['passwd'] ==  "hey" AND isset($_POST['login']) AND $_POST['login'] ==  "groupe22") { 
	?>

		<p> je suis dedans </p>

		

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