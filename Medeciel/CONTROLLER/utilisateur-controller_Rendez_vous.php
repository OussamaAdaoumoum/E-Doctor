<?php
include "../DAO/dao-utilisateur_Rendez_vous.php";

$action = $_GET['action'];
$dao = new Daomedeciel_rendez_vous();

switch ($action) {
    case 'insert':
        $date = $_POST['date'];
        $description = $_POST['description'];

        if (isset($date, $description)) {
            $rdv = new medeciel_rendez_vous($id,$date, $description);
            $dao->save($rdv);
            echo "<script>alert('Hello! I am an alert box!');</script>";

            header('location: ../index.html');

        }
        break;
    
    // case 'deconnexion':
    //     session_start();
    //     session_destroy();
    //     header('location: ../view/bienvenue.php');
    //     break;
}
