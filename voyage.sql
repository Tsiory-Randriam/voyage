-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 12 oct. 2026 à 19:19
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `voyage`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`login`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `nom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`nom`, `email`, `contact`, `idClient`) VALUES
('Mickael', 'mik@gmail.com', '0332505705', 1),
('feno', 'feno@gmail.com', '0332505705', 2),
('Mickael', 'mik@gmail.com', '0332505705', 3),
('Mickael', 'mik@gmail.com', '0332505705', 4),
('Mickael', 'mik@gmail.com', '0332505705', 5);

-- --------------------------------------------------------

--
-- Structure de la table `clientplace`
--

CREATE TABLE `clientplace` (
  `idClientPlace` int(11) NOT NULL,
  `clientPlace` varchar(45) NOT NULL,
  `usernameClient` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clientplace`
--

INSERT INTO `clientplace` (`idClientPlace`, `clientPlace`, `usernameClient`) VALUES
(1, '2', 'Mickael'),
(2, '3', 'Mickael'),
(3, '4', 'Mickael');

-- --------------------------------------------------------

--
-- Structure de la table `date`
--

CREATE TABLE `date` (
  `date` date NOT NULL,
  `idDateReservation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `date`
--

INSERT INTO `date` (`date`, `idDateReservation`) VALUES
('2026-10-06', 1),
('2026-10-06', 2),
('2026-10-09', 3),
('2026-10-09', 4),
('2026-10-09', 5),
('2026-10-09', 6),
('2026-10-09', 7),
('2026-10-09', 8),
('2026-10-09', 9);

-- --------------------------------------------------------

--
-- Structure de la table `destignation`
--

CREATE TABLE `destignation` (
  `destignation` varchar(45) NOT NULL,
  `frais_voyage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `destignation`
--

INSERT INTO `destignation` (`destignation`, `frais_voyage`) VALUES
('Antananarivo', 20000),
('Sainte Marie', 50000),
('Toliara', 80000),
('Fianarantsoa', 40000),
('Antsiranana', 50000);

-- --------------------------------------------------------

--
-- Structure de la table `destignationclient`
--

CREATE TABLE `destignationclient` (
  `idDestignation` int(11) NOT NULL,
  `destignation` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `destignationclient`
--

INSERT INTO `destignationclient` (`idDestignation`, `destignation`) VALUES
(1, 'Antananarivo'),
(2, 'Antananarivo'),
(3, 'Antananarivo'),
(4, 'Antananarivo'),
(5, 'Antananarivo'),
(6, 'Antananarivo'),
(7, 'Antananarivo'),
(8, 'Antananarivo'),
(9, 'Antananarivo');

-- --------------------------------------------------------

--
-- Structure de la table `heure`
--

CREATE TABLE `heure` (
  `heure` enum('08 h','10 h','02 h') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `heure`
--

INSERT INTO `heure` (`heure`) VALUES
('08 h'),
('10 h'),
('02 h');

-- --------------------------------------------------------

--
-- Structure de la table `heurereservation`
--

CREATE TABLE `heurereservation` (
  `idHeureReservation` int(11) NOT NULL,
  `heureReservation` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `heurereservation`
--

INSERT INTO `heurereservation` (`idHeureReservation`, `heureReservation`) VALUES
(1, '08 h'),
(2, '08 h'),
(3, '08 h'),
(4, '08 h'),
(5, '08 h'),
(6, '08 h'),
(7, '08 h'),
(8, '08 h'),
(9, '08 h');

-- --------------------------------------------------------

--
-- Structure de la table `places`
--

CREATE TABLE `places` (
  `numero_place` int(11) DEFAULT NULL,
  `statut_place` enum('None','Disabled') DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `places`
--

INSERT INTO `places` (`numero_place`, `statut_place`) VALUES
(1, 'Disabled'),
(2, 'Disabled'),
(3, 'Disabled'),
(4, 'Disabled');

-- --------------------------------------------------------

--
-- Structure de la table `place_final`
--

CREATE TABLE `place_final` (
  `Numero_place` int(11) NOT NULL,
  `statut` enum('None','Disabled') NOT NULL,
  `heure_voyage_place` enum('08 h','10 h','02 h') NOT NULL,
  `date_voyage` date NOT NULL,
  `destignationPlace` varchar(45) NOT NULL,
  `reservateur` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `place_final`
--

INSERT INTO `place_final` (`Numero_place`, `statut`, `heure_voyage_place`, `date_voyage`, `destignationPlace`, `reservateur`) VALUES
(1, 'Disabled', '08 h', '2026-10-06', 'Antananarivo', NULL),
(2, 'Disabled', '08 h', '2026-10-06', 'Antananarivo', NULL),
(3, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(4, 'Disabled', '08 h', '2026-10-06', 'Antananarivo', NULL),
(5, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(6, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(7, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(8, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(9, 'Disabled', '08 h', '2026-10-06', 'Antananarivo', NULL),
(10, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(11, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(12, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(13, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(14, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(15, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(16, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(17, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(18, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(19, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(20, 'Disabled', '08 h', '2026-10-06', 'Antananarivo', NULL),
(21, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(22, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(23, 'None', '08 h', '2026-10-06', 'Antananarivo', NULL),
(24, 'Disabled', '08 h', '2026-10-06', 'Antananarivo', NULL),
(1, 'Disabled', '08 h', '2026-10-09', 'Antananarivo', NULL),
(2, 'Disabled', '08 h', '2026-10-09', 'Antananarivo', NULL),
(3, 'Disabled', '08 h', '2026-10-09', 'Antananarivo', NULL),
(4, 'Disabled', '08 h', '2026-10-09', 'Antananarivo', NULL),
(5, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(6, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(7, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(8, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(9, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(10, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(11, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(12, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(13, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(14, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(15, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(16, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(17, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(18, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(19, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(20, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(21, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(22, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(23, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL),
(24, 'None', '08 h', '2026-10-09', 'Antananarivo', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `idReservation` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `date_voyage` date NOT NULL,
  `heure_depart` varchar(45) NOT NULL,
  `numero_place` varchar(45) NOT NULL,
  `destignation_reservation` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`idReservation`, `username`, `email`, `contact`, `date_voyage`, `heure_depart`, `numero_place`, `destignation_reservation`) VALUES
(1, 'Mickael', 'mik@gmail.com', '0332505705', '2026-10-09', '08 h', '', 'Antananarivo');

-- --------------------------------------------------------

--
-- Structure de la table `temps`
--

CREATE TABLE `temps` (
  `temps` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `temps`
--

INSERT INTO `temps` (`temps`) VALUES
('2026-09-21 - 08 h - 2026-09-21'),
('2026-09-22 - 02 h - 2026-09-22'),
('2026-09-22 - 10 h - 2026-09-22'),
('2026-09-22 - 10 h - 2026-09-22'),
('2026-09-22 - 10 h - 2026-09-22');

-- --------------------------------------------------------

--
-- Structure de la table `teste_place`
--

CREATE TABLE `teste_place` (
  `Numero_place` int(11) NOT NULL,
  `statut` enum('None','Disabled') NOT NULL,
  `heure_voyage_place` enum('08 h','10 h','02 h') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `teste_place`
--

INSERT INTO `teste_place` (`Numero_place`, `statut`, `heure_voyage_place`) VALUES
(1, 'Disabled', '08 h'),
(2, 'Disabled', '08 h'),
(3, 'Disabled', '08 h'),
(4, 'Disabled', '08 h'),
(1, 'None', '10 h'),
(2, 'Disabled', '10 h'),
(3, 'None', '10 h'),
(4, 'None', '10 h'),
(1, 'None', '02 h'),
(2, 'None', '02 h'),
(3, 'None', '02 h'),
(4, 'None', '02 h');

-- --------------------------------------------------------

--
-- Structure de la table `voyager`
--

CREATE TABLE `voyager` (
  `id_voyage` int(11) NOT NULL,
  `date_Voyage` date NOT NULL,
  `heure_voyage` enum('08 h','10 h','02 h') NOT NULL,
  `destignation` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `voyager`
--

INSERT INTO `voyager` (`id_voyage`, `date_Voyage`, `heure_voyage`, `destignation`) VALUES
(1, '2026-09-22', '02 h', 'Antananarivo'),
(2, '2026-09-22', '10 h', 'Antananarivo'),
(3, '2026-09-22', '08 h', 'Antananarivo');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`);

--
-- Index pour la table `clientplace`
--
ALTER TABLE `clientplace`
  ADD PRIMARY KEY (`idClientPlace`);

--
-- Index pour la table `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`idDateReservation`);

--
-- Index pour la table `destignationclient`
--
ALTER TABLE `destignationclient`
  ADD PRIMARY KEY (`idDestignation`);

--
-- Index pour la table `heurereservation`
--
ALTER TABLE `heurereservation`
  ADD PRIMARY KEY (`idHeureReservation`);

--
-- Index pour la table `places`
--
ALTER TABLE `places`
  ADD UNIQUE KEY `numero_place` (`numero_place`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`idReservation`);

--
-- Index pour la table `voyager`
--
ALTER TABLE `voyager`
  ADD PRIMARY KEY (`id_voyage`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `clientplace`
--
ALTER TABLE `clientplace`
  MODIFY `idClientPlace` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `date`
--
ALTER TABLE `date`
  MODIFY `idDateReservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `destignationclient`
--
ALTER TABLE `destignationclient`
  MODIFY `idDestignation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `heurereservation`
--
ALTER TABLE `heurereservation`
  MODIFY `idHeureReservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `idReservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `voyager`
--
ALTER TABLE `voyager`
  MODIFY `id_voyage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
