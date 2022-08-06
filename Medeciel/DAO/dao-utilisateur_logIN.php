<?php
include "../MODEL/utilisateur_LogIN.php";

class Daomedeciel_login
{

    private $dbh;

    /**
     * DaoUtilisateur constructeur.
     */
    public function __construct()
    {
        try {
            $this->dbh = new PDO('mysql:host=localhost;dbname=medeciel', "root", "");
        } catch (PDOException $e) {
            print "Erreur !: " . $e->getMessage() . "<br/>";
            die();
        }
    }
    public function save(medeciel_login $utilisateur)
    {
        $stm = $this->dbh->prepare("INSERT INTO medeciel_login VALUES (?, ?, ?, ?, ?)");
        $stm->bindValue(1, $utilisateur->getNom());
        $stm->bindValue(2, $utilisateur->getPrenom());
        $stm->bindValue(3, $utilisateur->getEmail());
        $stm->bindValue(4, $utilisateur->getTelephone());
        $stm->bindValue(5, $utilisateur->getPassword());


        $stm->execute();
    }

    public function findUtilisateur($email, $password)
    {
        $utilisateur = null;
        $stm = $this->dbh->prepare("SELECT * FROM medeciel_login where email=? AND password=?");
        $stm->bindValue(1, $email);
        $stm->bindValue(2, $password);

        $stm->execute();

        $result = $stm->fetch(PDO::FETCH_ASSOC);
        if (!empty($result)) {
            $utilisateur = new medeciel_login($result['nom'],$result['prenom'],$result['email'],$result['telephone'],'' );
        }
        return $utilisateur;
    }
}

?>