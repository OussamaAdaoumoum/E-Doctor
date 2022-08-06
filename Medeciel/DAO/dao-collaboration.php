<?php
include "../MODEL/collaboration.php";

class Daomedeciel_collaboration
{

    private $dbh;

    /**
     *  constructeur.
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
    public function save(medeciel_collaboration $collaboration)
    {
        $stm = $this->dbh->prepare("INSERT INTO medeciel_collaboration VALUES (?, ?, ?, ?, ?)");
        $stm->bindValue(1, $collaboration->getNom());
        $stm->bindValue(2, $collaboration->getPrenom());
        $stm->bindValue(3, $collaboration->getEmail());
        $stm->bindValue(4, $collaboration->getTelephone());
        $stm->bindValue(5, $collaboration->getDescription());

        $stm->execute();
    }

}

?>