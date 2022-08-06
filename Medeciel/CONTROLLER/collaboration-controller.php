<?php
// include "../dao/dao-collaboration.php";
include "../DAO/dao-collaboration.php";

$action = $_GET['action'];
$dao = new Daomedeciel_collaboration();

switch ($action) {
    case 'insert':
        $nom= $_POST['nom'];
        $prenom= $_POST['prenom'];
        $telephone = $_POST['telephone'];
        $email = $_POST['email'];
        $description = $_POST['description'];


        if (isset($nom,$prenom, $telephone, $email, $description)) {
            $collboration = new medeciel_collaboration($nom,$prenom, $email, $telephone, $description);
            $dao->save($collboration);
            session_start();
            $_SESSION['collboration'] = $collboration;
            header('Location: ../VIEW/bienvenue_collab.php');
            echo "<script>alert('welcome')</script>";
        }
        break;
   
    case 'deconnexion':
        session_start();
        session_destroy();
        header('Location: ../view/bienvenue.php');
        break;
}
