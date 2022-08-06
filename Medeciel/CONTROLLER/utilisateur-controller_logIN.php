<?php
include "../DAO/dao-utilisateur_logIN.php";

$action = $_GET['action'];
$dao = new Daomedeciel_login();

switch ($action) {
    case 'insert':
        $nom= $_POST['nom'];
        $prenom= $_POST['prenom'];
        $telephone = $_POST['telephone'];
        $email = $_POST['email'];
        $password = $_POST['password'];


        if (isset($nom,$prenom, $telephone, $email, $password)) {
            $utilisateur = new medeciel_login($nom,$prenom, $email, $telephone, $password);
            $dao->save($utilisateur);
            session_start();
            $_SESSION['utilisateur'] = $utilisateur;
            echo "<script>alert('welcome')</script>";
            header('Location: ../VIEW/Rendez_vous.html');
        }
        break;
    case 'login':
        $email = $_POST['email'];
        $password = $_POST['password'];

        $utilisateur = $dao->findUtilisateur($email, $password);
        if ($utilisateur != null) {
            session_start();
            $_SESSION['utilisateur'] = $utilisateur;
            // header('Location: ../view/bienvenue.php');
            echo "<script>alert('test is correct')</script>";
            header('Location: ../VIEW/Rendez_vous.html');

        } else {
            echo "echec de connexion!";
            echo "<script>alert('test is incorrect')</script>";
       }
        
        break;
    case 'deconnexion':
        session_start();
        session_destroy();
        header('Location: ../view/bienvenue.php');
        break;
}
