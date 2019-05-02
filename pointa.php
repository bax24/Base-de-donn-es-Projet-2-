<?php
if(isset($_SESSION['user'])){

  if(isset($_POST['table'])){

    $request = 'SELECT * FROM ' . $_POST['table'];
    $namesCol = $_bdd->query('SHOW COLUMNS FROM ' . $_POST['table']);
    $teteTableau = '';
    $first = true;

    while($tmp = $namesCol->fetch(PDO::FETCH_ASSOC)){ // reconstruits la demande

      $teteTableau = $teteTableau . '<th>' . $tmp['Field'] . '</th>';
      if(strcmp($_POST[$tmp['Field']], '*') != 0){

        if($first){
          $first = false;
          $request = $request . ' WHERE ' . $tmp['Field'] . $_POST[$tmp['Field']];
        } 
        else 
          $request = $request . ' AND ' . $tmp['Field'] . $_POST[$tmp['Field']];
      }
    }

    $requete = $_bdd->query($request);

    // écris la tête du tableau
    echo '<h3>Resultats:</h3>
    <div class="table-responsive">
    <table class="table table-bordered">
        <thead><tr>';
    echo $teteTableau;
    echo '</tr></thead>';
  }
}
else{
  echo "Not connected";
  header("Location: index.php");
}
?>