-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 09 juin 2022 à 17:14
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cabinet`
--

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE `consultation` (
  `id` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `heure` time DEFAULT NULL,
  `montant` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `compte_rendu` varchar(100) DEFAULT NULL,
  `recu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`id`, `patientID`, `date`, `heure`, `montant`, `status`, `compte_rendu`, `recu`) VALUES
(14, 83, '2022-02-10', '22:08:00', 600, 'non payée', 'afin de ', NULL),
(15, 83, '2022-02-10', '22:08:00', 400, 'non payée', 'afin de ', NULL),
(20, 83, '2022-02-12', '15:27:00', 250, 'non payée', 'sdqsdsdsd', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fichier`
--

CREATE TABLE `fichier` (
  `id` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `Consult_ID` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `chemin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fichier`
--

INSERT INTO `fichier` (`id`, `patientID`, `Consult_ID`, `type`, `chemin`) VALUES
(55, 83, 14, 'ordanance', 'http://localhost/Doctor/fpdf/Saved/ordonance83.pdf'),
(56, 83, 14, 'ordanance', 'http://localhost/Doctor/fpdf/Saved/ordonance83.pdf');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `cin` varchar(20) NOT NULL,
  `birth` date DEFAULT NULL,
  `date_d_ajout` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id`, `Nom`, `Prenom`, `sex`, `address`, `telephone`, `email`, `cin`, `birth`, `date_d_ajout`) VALUES
(83, 'Ihyadn', 'Ayoub', 'homme', 'DR TAMASSIT ASNI ELHOUZ', 649480644, 'ihyadnayoub@gmail.com', 'EF1213', '2000-10-16', '2022-01-05'),
(85, 'Sidki', 'ahmed', 'homme', 'zzz-zzz-zzzzz', 7231213, 'ahmedsidki@gmail.com', 'AE5432', '0000-00-00', '2022-01-11'),
(87, 'Bouzaidi', 'Idriss', 'homme', 'aaa-aaa-aaaa', 6348732, 'bouzaidi@gmail.com', 'XA123', '0000-00-00', '2022-01-11');

-- --------------------------------------------------------

--
-- Structure de la table `rendezvous`
--

CREATE TABLE `rendezvous` (
  `id` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `start_event` datetime NOT NULL,
  `end_event` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `rendezvous`
--

INSERT INTO `rendezvous` (`id`, `patientID`, `start_event`, `end_event`) VALUES
(81, 83, '2022-02-17 08:00:00', '2022-02-17 09:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `password`, `role`, `nom`, `prenom`) VALUES
(1, 'medecin@gmail.com', '123456', 'medecin', 'Medecin', 'Med'),
(2, 'secretaire@gmail.com', '12345', 'secretaire', 'Secretaire', 'Sec');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientID` (`patientID`);

--
-- Index pour la table `fichier`
--
ALTER TABLE `fichier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientID` (`patientID`),
  ADD KEY `Consult_ID` (`Consult_ID`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientID` (`patientID`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `fichier`
--
ALTER TABLE `fichier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`id`);

--
-- Contraintes pour la table `fichier`
--
ALTER TABLE `fichier`
  ADD CONSTRAINT `fichier_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `fichier_ibfk_2` FOREIGN KEY (`Consult_ID`) REFERENCES `consultation` (`id`);

--
-- Contraintes pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD CONSTRAINT `rendezvous_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
