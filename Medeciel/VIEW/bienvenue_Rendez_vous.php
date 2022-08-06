<?php
include "../model/utilisateur.php";
session_start();
if(isset($_SESSION['utilisateur'])){
    $utilisateur = $_SESSION['utilisateur'];
    echo "Bienvenue ".$utilisateur->getNom();
    echo "</br><a href='../controller/utilisateur-controller.php?action=deconnexion'>deconnexion</a>";
} else {
    header('location: login.html');
}
?>