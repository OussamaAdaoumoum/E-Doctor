<?php
include "../MODEL/utilisateur_Rendez_vous.php";

class Daomedeciel_rendez_vous
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
    public function save(medeciel_rendez_vous $rdv)
    {
        $stm = $this->dbh->prepare("INSERT INTO medeciel_rendez_vous VALUES (?,?, ?)");

        $stm->bindValue(1, $rdv->getId());
        $stm->bindValue(2, $rdv->getDate());
        $stm->bindValue(3, $rdv->getDescription());

        $stm->execute();
    }

    public function findRdv($id, $date)
    {
        $rdv = null;
        $stm = $this->dbh->prepare("SELECT * FROM medeciel_rendez_vous where id=? AND date=?");
        $stm->bindValue(1, $id);
        $stm->bindValue(2, $date);

        $stm->execute();

        $result = $stm->fetch(PDO::FETCH_ASSOC);
        if (!empty($result)) {
            $rdv = new medeciel_rendez_vous($result['id'],$result['date'],$result['description']);
        }
        return $rdv;
    }
}

?>