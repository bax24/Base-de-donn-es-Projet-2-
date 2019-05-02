<?php session_start(); ?>

<?php 
    //Checking whether the session is already there or not 
    if(isset($_SESSION['user'])){ 
        header("Location: traitement.php");
        die(); // Exit the script without message
    }
 ?>

<!DOCTYPE html>
<html>
    <div class="image"></div>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="style.css" />
        <title>Premiers tests du CSS</title>
    </head>

    <body>
        <div class="login">
                    <form method="post" action="traitement.php"> 
                        <label for="login" > </label>
                        <input type="text" name="login" class="input" id="login" autofocus required placeholder="Identifiant">
                        <label for="passwd" > </label>
                        <input type="password" name="passwd" class="input" id="passwd" required placeholder="Mot de passe">
                        <input type="submit" value="Se connecter" class="moncul" id="prout">
                    </form>
        </div>
    </body>
</html>