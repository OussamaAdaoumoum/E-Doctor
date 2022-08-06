<?php
include "../model/collaboration.php";
session_start();
if(isset($_SESSION['collaboration'])){
    $collaboration = $_SESSION['collaboration'];
    echo "Bienvenue ".$collaboration->getNom();
    //echo "</br><a href='../controller/collaboration-controller.php?action=deconnexion'>deconnexion</a>";
} else {
    header('location: ../Oussama2.html');
}
?>