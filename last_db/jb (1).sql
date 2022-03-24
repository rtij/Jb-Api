-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 21 mars 2022 à 08:54
-- Version du serveur :  5.7.26
-- Version de PHP :  7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `jb`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `IdArticle` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Designation` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Qte` int(8) UNSIGNED DEFAULT NULL,
  `PrixU` float(24,2) DEFAULT NULL,
  `issup` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdArticle`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`IdArticle`, `Designation`, `Type`, `Qte`, `PrixU`, `issup`) VALUES
(1, 'Urne GM', 'Urne', 70, 10000.01, 0),
(2, 'PP', 'Produit', 10800, 200.00, 0),
(3, 'VI', 'Produit', 20800, 200.00, 0),
(4, 'PS', 'Produit', 11800, 200.00, 0),
(5, 'OE', 'Produit', 9800, 200.00, 0),
(6, 'Télé', 'Lot', 10, 2000000000.00, 0);

-- --------------------------------------------------------

--
-- Structure de la table `authtoken`
--

DROP TABLE IF EXISTS `authtoken`;
CREATE TABLE IF NOT EXISTS `authtoken` (
  `idToken` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `dateT` date NOT NULL,
  `CodeU` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  PRIMARY KEY (`idToken`),
  KEY `fk_User_token` (`CodeU`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `authtoken`
--

INSERT INTO `authtoken` (`idToken`, `token`, `dateT`, `CodeU`) VALUES
(83, 'ff6fadd718053003cef974d568a18f3d91c12f654464936890a9b4d8025236f1', '2022-03-21', 00000017);

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `idContacts` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Contacts` varchar(15) NOT NULL,
  `codeU` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  PRIMARY KEY (`idContacts`),
  KEY `fk_users_contacts` (`codeU`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`idContacts`, `Contacts`, `codeU`) VALUES
(00000003, '0345034228', 00000017);

-- --------------------------------------------------------

--
-- Structure de la table `depotu`
--

DROP TABLE IF EXISTS `depotu`;
CREATE TABLE IF NOT EXISTS `depotu` (
  `Codeu` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `dateD` date NOT NULL,
  `HeureD` time DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `NumU` varchar(255) DEFAULT NULL,
  `Place` varchar(255) DEFAULT NULL,
  `NbEnv` int(3) UNSIGNED DEFAULT NULL,
  `NbAff` int(3) UNSIGNED DEFAULT NULL,
  `idDep` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CodeT` bigint(20) UNSIGNED DEFAULT NULL,
  `isany` int(2) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idDep`),
  KEY `fk_tsena_depot` (`CodeT`),
  KEY `fk_Users_depot` (`Codeu`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `depotu`
--

INSERT INTO `depotu` (`Codeu`, `action`, `dateD`, `HeureD`, `Type`, `NumU`, `Place`, `NbEnv`, `NbAff`, `idDep`, `CodeT`, `isany`) VALUES
(00000018, NULL, '2022-03-10', '16:39:00', NULL, 'kljl15', 'azerzfdssdfgdsf', 50, 2, 1, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `detlivrable`
--

DROP TABLE IF EXISTS `detlivrable`;
CREATE TABLE IF NOT EXISTS `detlivrable` (
  `idLivrables` bigint(20) UNSIGNED DEFAULT NULL,
  `idDetLivrable` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idStocke` bigint(20) UNSIGNED DEFAULT NULL,
  `Sortie` float(20,2) UNSIGNED DEFAULT NULL,
  `Prix` float(20,2) UNSIGNED DEFAULT NULL,
  `T` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`idDetLivrable`),
  KEY `fk_detL_livrable` (`idLivrables`),
  KEY `fk_stocke_detL` (`idStocke`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `detlivrable`
--

INSERT INTO `detlivrable` (`idLivrables`, `idDetLivrable`, `idStocke`, `Sortie`, `Prix`, `T`) VALUES
(7, 1, 2, 15.00, 3000.00, 'V'),
(7, 2, 3, 20.00, 4000.00, 'V'),
(7, 3, 4, 30.00, 6000.00, 'V'),
(7, 4, 5, 20.00, 4000.00, 'V'),
(7, 5, 2, 5.00, 1000.00, 'D'),
(7, 6, 3, 2.00, 400.00, 'D'),
(8, 8, 6, 20.00, 4000.00, 'V'),
(8, 9, 7, 10.00, 2000.00, 'V'),
(8, 10, 8, 10.00, 2000.00, 'V'),
(8, 11, 9, 12.00, 2400.00, 'V'),
(8, 12, 7, 12.00, 2400.00, 'D'),
(8, 13, 6, 6.00, 1200.00, 'D'),
(8, 14, 8, 7.00, 1400.00, 'D'),
(8, 15, 9, 8.00, 1600.00, 'D');

-- --------------------------------------------------------

--
-- Structure de la table `detmvt`
--

DROP TABLE IF EXISTS `detmvt`;
CREATE TABLE IF NOT EXISTS `detmvt` (
  `idDetMvt` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usages` varchar(255) DEFAULT NULL,
  `couleur` varchar(255) DEFAULT NULL,
  `idArticle` bigint(20) UNSIGNED DEFAULT NULL,
  `qte` float(20,2) UNSIGNED DEFAULT NULL,
  `dateR` date DEFAULT NULL,
  `aRetourner` tinyint(1) DEFAULT NULL,
  `ok` tinyint(1) DEFAULT NULL,
  `idmvt` bigint(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idDetMvt`),
  KEY `fk_detMvt_mvt` (`idmvt`),
  KEY `fk_article_detmvt` (`idArticle`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `detmvt`
--

INSERT INTO `detmvt` (`idDetMvt`, `usages`, `couleur`, `idArticle`, `qte`, `dateR`, `aRetourner`, `ok`, `idmvt`) VALUES
(10, 'Stock', '', 1, 100.00, '2022-03-31', 1, 0, 15),
(11, 'Dépôt', '', 1, 10.00, '2022-03-31', 1, 0, 16),
(12, 'Dépôt', '', 1, 10.00, '2022-03-31', 1, 0, 17),
(13, 'Dépôt', '', 1, 10.00, '2022-03-31', 1, 0, 18),
(14, 'Dépôt', '', 1, 10.00, '2022-03-31', 1, 0, 19),
(15, 'Dépôt', '', 1, 10.00, '2022-03-31', 1, 0, 20),
(16, 'Stock', '', 2, 1000.00, NULL, 0, 0, 21),
(17, 'Stock', '', 3, 1000.00, NULL, NULL, 0, 21),
(18, 'Stock', '', 4, 1000.00, NULL, 0, 0, 22),
(19, 'Stock', '', 4, 1000.00, NULL, 0, 0, 23),
(20, 'Stock', '', 5, 1000.00, NULL, NULL, 0, 23),
(21, 'Stock', '', 2, 10000.00, NULL, 0, 0, 24),
(22, 'Stock', '', 3, 10000.00, NULL, NULL, 0, 24),
(23, 'Stock', '', 4, 10000.00, NULL, NULL, 0, 24),
(24, 'Stock', '', 5, 10000.00, NULL, NULL, 0, 24),
(25, 'Stock', '', 6, 10.00, NULL, NULL, 0, 24),
(26, 'Stock', '', 3, 10000.00, NULL, NULL, 0, 24),
(27, 'Animation', '', 2, 100.00, NULL, 0, 0, 25),
(28, 'Animation', '', 3, 100.00, NULL, NULL, 0, 25),
(29, 'Animation', '', 4, 100.00, NULL, NULL, 0, 25),
(30, 'Animation', '', 5, 100.00, NULL, NULL, 0, 25),
(31, 'Animation', '', 2, 20.00, NULL, 0, 0, 26),
(32, 'Animation', '', 2, 20.00, NULL, 0, 0, 27),
(33, 'Animation', '', 3, 20.00, NULL, NULL, 0, 27),
(34, 'Animation', '', 4, 100.00, NULL, NULL, 0, 27),
(35, 'Animation', '', 2, 80.00, NULL, NULL, 0, 27),
(36, 'Animation', '', 3, 80.00, NULL, NULL, 0, 27),
(37, 'Animation', '', 5, 100.00, NULL, NULL, 0, 27);

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `idEquipe` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `equipe` bigint(20) UNSIGNED NOT NULL,
  `IsSup` tinyint(1) NOT NULL DEFAULT '0',
  `zoneA` int(8) UNSIGNED DEFAULT NULL,
  `localite` varchar(255) DEFAULT NULL,
  `faritany` varchar(255) DEFAULT NULL,
  `quartierV` varchar(255) DEFAULT NULL,
  `idVilleI` int(8) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idEquipe`),
  KEY `fk_equipe_VilleI` (`idVilleI`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`idEquipe`, `equipe`, `IsSup`, `zoneA`, `localite`, `faritany`, `quartierV`, `idVilleI`) VALUES
(1, 1, 1, 1, 'Ville Intermédiaire', 'Antsiaranana', 'fff', 2),
(2, 2, 0, 2, 'Grande Ville', 'Antananarivo', 'jjj', NULL),
(3, 4, 0, 1, 'Ville Intermédiaire', 'Toamasina', 'jjj', 3),
(4, 3, 0, 3, 'Grande Ville', 'Antananarivo', 'Antananarivo', NULL),
(5, 1, 0, 2, 'Ville Intermédiaire', 'Antananarivo', 'Imerimanjaka/Antananarivo', 3),
(6, 5, 0, 3, 'Grande Ville', 'Antananarivo', 'Tanjombato/Antananarivo', NULL),
(7, 6, 0, 4, 'Grande Ville', 'Antananarivo', 'Analakely/Antananarivo', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `histoe`
--

DROP TABLE IF EXISTS `histoe`;
CREATE TABLE IF NOT EXISTS `histoe` (
  `idHistoE` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `DateH` date DEFAULT NULL,
  `Appro` float(20,2) UNSIGNED DEFAULT NULL,
  `Vente` float(20,2) UNSIGNED DEFAULT NULL,
  `qteR` float(20,2) UNSIGNED DEFAULT NULL,
  `idStockE` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idHistoE`),
  KEY `fk_stocke_histoe` (`idStockE`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `histoe`
--

INSERT INTO `histoe` (`idHistoE`, `DateH`, `Appro`, `Vente`, `qteR`, `idStockE`) VALUES
(1, '2022-03-08', 0.00, 0.00, 10.00, 1),
(2, '2022-03-20', 100.00, 0.00, 100.00, 2),
(3, '2022-03-20', 100.00, 0.00, 100.00, 3),
(4, '2022-03-20', 100.00, 0.00, 100.00, 4),
(5, '2022-03-20', 100.00, 0.00, 100.00, 5),
(6, '2022-03-20', 20.00, 0.00, 20.00, 6),
(7, '2022-03-20', 20.00, 0.00, 20.00, 7),
(8, '2022-03-20', 100.00, 0.00, 100.00, 8),
(9, '2022-03-20', 80.00, 0.00, 100.00, 6),
(10, '2022-03-20', 80.00, 0.00, 100.00, 7),
(11, '2022-03-20', 100.00, 0.00, 100.00, 9);

-- --------------------------------------------------------

--
-- Structure de la table `histostock`
--

DROP TABLE IF EXISTS `histostock`;
CREATE TABLE IF NOT EXISTS `histostock` (
  `idhisto` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dateH` date NOT NULL,
  `idArticle` bigint(20) UNSIGNED DEFAULT NULL,
  `qteR` float(20,2) UNSIGNED DEFAULT NULL,
  `qteE` float(20,2) UNSIGNED DEFAULT NULL,
  `qteS` float(20,2) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idhisto`),
  KEY `fk_histostock_article` (`idArticle`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `histostock`
--

INSERT INTO `histostock` (`idhisto`, `dateH`, `idArticle`, `qteR`, `qteE`, `qteS`) VALUES
(1, '2022-03-07', 1, 0.00, 0.00, 0.00),
(2, '2022-03-08', 1, 0.00, 0.00, 0.00),
(3, '2022-03-08', 1, 100.00, 100.00, 0.00),
(4, '2022-03-08', 1, 110.00, 10.00, 0.00),
(5, '2022-03-08', 1, 100.00, 0.00, 10.00),
(6, '2022-03-08', 1, 90.00, 0.00, 10.00),
(7, '2022-03-08', 1, 80.00, 0.00, 10.00),
(8, '2022-03-08', 1, 70.00, 0.00, 10.00),
(9, '2022-03-20', 2, 1000.00, 1000.00, 0.00),
(10, '2022-03-20', 3, 1000.00, 1000.00, 0.00),
(11, '2022-03-20', 4, 2000.00, 1000.00, 0.00),
(12, '2022-03-20', 4, 2000.00, 1000.00, 0.00),
(13, '2022-03-20', 2, 11000.00, 10000.00, 0.00),
(14, '2022-03-20', 3, 11000.00, 10000.00, 0.00),
(15, '2022-03-20', 4, 12000.00, 10000.00, 0.00),
(16, '2022-03-20', 5, 10000.00, 10000.00, 0.00),
(17, '2022-03-20', 6, 10.00, 10.00, 0.00),
(18, '2022-03-20', 3, 21000.00, 10000.00, 0.00),
(19, '2022-03-20', 2, 10900.00, 0.00, 100.00),
(20, '2022-03-20', 3, 20900.00, 0.00, 100.00),
(21, '2022-03-20', 4, 11900.00, 0.00, 100.00),
(22, '2022-03-20', 5, 9900.00, 0.00, 100.00),
(23, '2022-03-20', 2, 10880.00, 0.00, 20.00),
(24, '2022-03-20', 3, 20880.00, 0.00, 20.00),
(25, '2022-03-20', 4, 11800.00, 0.00, 100.00),
(26, '2022-03-20', 2, 10800.00, 0.00, 80.00),
(27, '2022-03-20', 3, 20800.00, 0.00, 80.00),
(28, '2022-03-20', 5, 9800.00, 0.00, 100.00);

-- --------------------------------------------------------

--
-- Structure de la table `livrables`
--

DROP TABLE IF EXISTS `livrables`;
CREATE TABLE IF NOT EXISTS `livrables` (
  `idLivrables` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeL` varchar(255) DEFAULT NULL,
  `dateA` date NOT NULL,
  `semaineC` int(3) UNSIGNED DEFAULT NULL,
  `NombreA` int(5) UNSIGNED DEFAULT NULL,
  `RecetteJ` float(24,2) DEFAULT NULL,
  `EnvU` int(5) UNSIGNED DEFAULT NULL,
  `NumU` varchar(255) DEFAULT NULL,
  `CodeU` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `Contact` int(8) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idLivrables`),
  KEY `fk_Users_Livrables` (`CodeU`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `livrables`
--

INSERT INTO `livrables` (`idLivrables`, `typeL`, `dateA`, `semaineC`, `NombreA`, `RecetteJ`, `EnvU`, `NumU`, `CodeU`, `Contact`) VALUES
(6, 'Epicerie', '2022-03-21', 3, 20, 23000.00, 20, '3', 00000018, 250),
(7, 'Animation', '2022-03-22', 2, 50, 25600.00, 30, '5', 00000018, 250),
(8, 'Animation', '2022-03-21', 5, 15, 17000.00, 11, '5', 00000021, 25);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

DROP TABLE IF EXISTS `materiel`;
CREATE TABLE IF NOT EXISTS `materiel` (
  `idTypeA` int(2) UNSIGNED NOT NULL,
  `couleur` varchar(255) NOT NULL,
  PRIMARY KEY (`idTypeA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mvt`
--

DROP TABLE IF EXISTS `mvt`;
CREATE TABLE IF NOT EXISTS `mvt` (
  `idmvt` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `idsourceF` varchar(255) DEFAULT NULL,
  `idSource` int(8) UNSIGNED DEFAULT NULL,
  `idDestinataire` int(8) UNSIGNED DEFAULT NULL,
  `DestinataireF` varchar(255) DEFAULT NULL,
  `livreur` varchar(255) DEFAULT NULL,
  `dateM` date NOT NULL,
  `refDoc` varchar(255) DEFAULT NULL,
  `IdDest` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idmvt`),
  KEY `fk_users_source` (`idSource`),
  KEY `fk_users_destinataire` (`idDestinataire`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mvt`
--

INSERT INTO `mvt` (`idmvt`, `action`, `source`, `idsourceF`, `idSource`, `idDestinataire`, `DestinataireF`, `livreur`, `dateM`, `refDoc`, `IdDest`) VALUES
(15, 'Expédition', 'Fournisseur', 'fgdsfd', NULL, NULL, 'Tandem', 'fgsfgsfg', '2022-03-09', 'RefDoc', 'sdfgdsfg'),
(16, 'Réception', 'Tandem', 'gsdfgsdfg', NULL, NULL, 'Tandem', 'dsfgsdfgsdfg', '2022-03-07', 'ref1', 'sdfgsdfgsd'),
(17, 'Expédition', 'Tandem', 'qdsfqdsfqsf', NULL, 18, 'Equipe', 'qsdfqsdfqsdf', '2022-03-01', 'ref1', ''),
(18, 'Expédition', 'Tandem', 'qdsfqdsfqsf', NULL, 18, 'Equipe', 'qsdfqsdfqsdf', '2022-03-01', 'ref1', ''),
(19, 'Expédition', 'Tandem', 'qdsfqdsfqsf', NULL, 18, 'Equipe', 'qsdfqsdfqsdf', '2022-03-01', 'ref1', ''),
(20, 'Expédition', 'Tandem', 'qdsfqdsfqsf', NULL, 18, 'Equipe', 'qsdfqsdfqsdf', '2022-03-01', 'ref1', ''),
(21, 'Réception', 'Fournisseur', 'sdgdsgdsfg', NULL, NULL, 'Tandem', 'gsdfgdfgsdg', '2022-03-20', 'fghsdfg', 'gsdfgsdfgdsfgsdg'),
(22, 'Réception', 'Fournisseur', 'sfgdsfgsdfg', NULL, NULL, 'Tandem', 'dsgdsfgsdfg', '2022-03-20', 'dgsdfgsdf', 'sdfgdsfgsdfg'),
(23, 'Réception', 'Fournisseur', 'sfgdsfgsdfg', NULL, NULL, 'Tandem', 'dsgdsfgsdfg', '2022-03-20', 'dgsdfgsdf', 'sdfgdsfgsdfg'),
(24, 'Réception', 'Fournisseur', 'qqq', NULL, NULL, 'Tandem', 'fff', '2022-03-20', '123456', 'ggg'),
(25, 'Expédition', 'Tandem', 'ggg', NULL, 18, 'Equipe', 'fff', '2022-03-20', '12356', ''),
(26, 'Expédition', 'Tandem', 'ggg', NULL, 21, 'Equipe', 'fff', '2022-03-20', 'kjkjka', ''),
(27, 'Expédition', 'Tandem', 'ggg', NULL, 21, 'Equipe', 'fff', '2022-03-20', 'kjkjka', '');

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

DROP TABLE IF EXISTS `participation`;
CREATE TABLE IF NOT EXISTS `participation` (
  `idParticipation` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CodeU` int(8) UNSIGNED DEFAULT NULL,
  `dateS` date NOT NULL,
  `numEnv` bigint(20) UNSIGNED NOT NULL,
  `NomP` varchar(255) NOT NULL,
  `telTelma` varchar(13) DEFAULT NULL,
  `telAirtel` varchar(13) DEFAULT NULL,
  `telOrange` varchar(13) DEFAULT NULL,
  `AdrP` varchar(255) DEFAULT NULL,
  `faritany` varchar(255) DEFAULT NULL,
  `nbP` int(8) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idParticipation`),
  KEY `fk_users_participation` (`CodeU`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `participation`
--

INSERT INTO `participation` (`idParticipation`, `CodeU`, `dateS`, `numEnv`, `NomP`, `telTelma`, `telAirtel`, `telOrange`, `AdrP`, `faritany`, `nbP`) VALUES
(8, 18, '2022-03-12', 2, 'Rakoto Paul', '', '0332547896', '', 'Imerimanjaka', 'Antananarivo', 3),
(9, 18, '2022-03-18', 5, 'Rasoa', '', '0331564845', '', 'Imerimanjaka', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `idTypeA` int(2) UNSIGNED NOT NULL,
  `Parfums` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idTypeA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ramassage`
--

DROP TABLE IF EXISTS `ramassage`;
CREATE TABLE IF NOT EXISTS `ramassage` (
  `idRamassage` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dateR` date NOT NULL,
  `CodeT` bigint(20) UNSIGNED DEFAULT NULL,
  `DateR1` date DEFAULT NULL,
  `DateR2` date DEFAULT NULL,
  `RamassageA` tinyint(1) DEFAULT '0',
  `CodeU` int(8) UNSIGNED DEFAULT NULL,
  `idDep` bigint(20) UNSIGNED DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idRamassage`),
  KEY `fk_users_ramassage` (`CodeU`),
  KEY `fk_tsena_ramassage` (`CodeT`),
  KEY `fk_depot_ramassage` (`idDep`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ramassage`
--

INSERT INTO `ramassage` (`idRamassage`, `dateR`, `CodeT`, `DateR1`, `DateR2`, `RamassageA`, `CodeU`, `idDep`, `action`) VALUES
(1, '2022-03-22', 3, NULL, NULL, 0, NULL, 1, NULL),
(2, '2022-03-21', 3, NULL, NULL, 0, 18, 1, 'Saisie ramassage urnes');

-- --------------------------------------------------------

--
-- Structure de la table `stocke`
--

DROP TABLE IF EXISTS `stocke`;
CREATE TABLE IF NOT EXISTS `stocke` (
  `idStockE` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `qte` float(20,2) UNSIGNED NOT NULL,
  `idArticle` bigint(20) UNSIGNED DEFAULT NULL,
  `idEquipe` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idStockE`),
  KEY `fk_equipe_stockE` (`idEquipe`),
  KEY `fk_article_stockE` (`idArticle`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `stocke`
--

INSERT INTO `stocke` (`idStockE`, `qte`, `idArticle`, `idEquipe`) VALUES
(1, 10.00, 1, 2),
(2, 0.00, 2, 2),
(3, 8.00, 3, 2),
(4, 25.00, 4, 2),
(5, 25.00, 5, 2),
(6, 44.00, 2, 5),
(7, 58.00, 3, 5),
(8, 43.00, 4, 5),
(9, 45.00, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `tri`
--

DROP TABLE IF EXISTS `tri`;
CREATE TABLE IF NOT EXISTS `tri` (
  `idTri` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `action` varchar(255) DEFAULT NULL,
  `CodeU` int(8) UNSIGNED DEFAULT NULL,
  `DateTri` date NOT NULL,
  `NumEnv` bigint(20) DEFAULT NULL,
  `feno` tinyint(1) NOT NULL,
  `NbPP` int(2) UNSIGNED DEFAULT NULL,
  `NbVi` int(2) UNSIGNED NOT NULL,
  `NbOe` int(2) UNSIGNED NOT NULL,
  `NbPs` int(2) UNSIGNED NOT NULL,
  `total` int(8) UNSIGNED NOT NULL,
  `MotifInv` varchar(255) DEFAULT NULL,
  `faritany` varchar(255) DEFAULT NULL,
  `nomPrenom` varchar(255) DEFAULT NULL,
  `valide` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idTri`),
  UNIQUE KEY `NumEnv` (`NumEnv`),
  KEY `fk_users_tri` (`CodeU`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tri`
--

INSERT INTO `tri` (`idTri`, `action`, `CodeU`, `DateTri`, `NumEnv`, `feno`, `NbPP`, `NbVi`, `NbOe`, `NbPs`, `total`, `MotifInv`, `faritany`, `nomPrenom`, `valide`) VALUES
(11, 'Saisie', 18, '2022-03-18', 1, 0, 2, 3, 4, 0, 9, 'Nombres insuffisants', 'Antananarivo', 'Rakoto Paul', 0),
(12, 'Saisie', 18, '2022-03-12', 2, 1, 5, 5, 0, 0, 10, '', 'Antananarivo', 'Rakoto Paul', 1),
(13, 'Saisie', 18, '2022-03-18', 3, 1, 5, 5, 0, 0, 10, '', '', 'Rakoto Paul', 1),
(14, 'Saisie', 18, '2022-03-26', 4, 1, 4, 3, 2, 1, 10, 'Autres produits (Calnort, Maman goût, etc)', '', 'Rasoa', 0),
(15, 'Saisie', 18, '2022-03-18', 5, 1, 6, 4, 3, 2, 15, '', '', 'Rasoa', 1),
(16, 'Saisie', 18, '2022-03-21', 6, 1, 5, 5, 3, 0, 13, 'Autres produits (Calnort, Maman goût, etc)', 'Antananarivo', 'Rasoa', 0),
(17, 'Saisie', 18, '2022-03-14', 7, 1, 7, 5, 1, 0, 13, '', 'Antananarivo', 'Rakoto Paul', 1),
(18, 'Saisie', 18, '2022-03-14', 8, 0, 1, 5, 3, 0, 9, 'Autres produits (Calnort, Maman goût, etc)', '', 'Rakoto Paul', 0),
(19, 'Saisie', 18, '2022-03-14', 9, 0, 9, 0, 0, 0, 9, 'Autres contenants (sachet, flyers, etc)', 'Antananarivo', 'Rakoto Paul', 0);

-- --------------------------------------------------------

--
-- Structure de la table `tsena`
--

DROP TABLE IF EXISTS `tsena`;
CREATE TABLE IF NOT EXISTS `tsena` (
  `CodeT` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NomT` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Proprietaire` varchar(255) DEFAULT NULL,
  `AdrT` varchar(255) DEFAULT NULL,
  `Responsable` varchar(255) DEFAULT NULL,
  `AdrT2` varchar(255) DEFAULT NULL,
  `Tel1` varchar(13) DEFAULT NULL,
  `Tel2` varchar(13) DEFAULT NULL,
  `Tel3` varchar(13) DEFAULT NULL,
  `reperage` varchar(255) DEFAULT NULL,
  `Niveau` varchar(255) DEFAULT NULL,
  `HOuverture` time DEFAULT NULL,
  `HFermeture` time DEFAULT NULL,
  `JourF` varchar(255) DEFAULT NULL,
  `DateF` date DEFAULT NULL,
  `Ouvert` tinyint(1) DEFAULT NULL,
  `zone` int(8) UNSIGNED DEFAULT NULL,
  `localite` varchar(255) DEFAULT NULL,
  `faritany` varchar(255) DEFAULT NULL,
  `quartierV` varchar(255) DEFAULT NULL,
  `idVille` int(8) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`CodeT`),
  KEY `fk_VilleI_tsena` (`idVille`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tsena`
--

INSERT INTO `tsena` (`CodeT`, `NomT`, `Type`, `Proprietaire`, `AdrT`, `Responsable`, `AdrT2`, `Tel1`, `Tel2`, `Tel3`, `reperage`, `Niveau`, `HOuverture`, `HFermeture`, `JourF`, `DateF`, `Ouvert`, `zone`, `localite`, `faritany`, `quartierV`, `idVille`) VALUES
(3, 'Tsena1', 'Epicérie', NULL, 'Imerimanjaka', 'kjkljkljkljklj', 'Imerimanjaka', '0345212345', '0345212345', '45646546521', 'azffdfghjj rhdsgsdfgsdfg', 'Niveau 1', '07:00:00', '17:00:00', 'Lundi', '2022-03-31', 1, 2, 'Grande Ville', 'Antananarivo', 'jjj', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `typea`
--

DROP TABLE IF EXISTS `typea`;
CREATE TABLE IF NOT EXISTS `typea` (
  `idTypeA` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `DesTA` varchar(255) NOT NULL,
  PRIMARY KEY (`idTypeA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typeu`
--

DROP TABLE IF EXISTS `typeu`;
CREATE TABLE IF NOT EXISTS `typeu` (
  `idTypeU` int(1) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `DesTypeU` varchar(255) NOT NULL,
  PRIMARY KEY (`idTypeU`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `typeu`
--

INSERT INTO `typeu` (`idTypeU`, `DesTypeU`) VALUES
(1, 'Simple'),
(2, 'Client'),
(3, 'Tandem');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `CodeU` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `NomU` varchar(255) DEFAULT NULL,
  `idTypeU` int(1) UNSIGNED ZEROFILL DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `IsSup` tinyint(1) DEFAULT '0',
  `idEquipe` bigint(20) UNSIGNED DEFAULT NULL,
  `Tel_airtel` varchar(13) DEFAULT NULL,
  `Tel_telma` varchar(13) DEFAULT NULL,
  `Tel_orange` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`CodeU`),
  KEY `fk_User_TypeU` (`idTypeU`),
  KEY `fk_users_equipe` (`idEquipe`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`CodeU`, `NomU`, `idTypeU`, `Password`, `IsSup`, `idEquipe`, `Tel_airtel`, `Tel_telma`, `Tel_orange`) VALUES
(00000017, 'ADMIN', 3, '$argon2i$v=19$m=65536,t=4,p=1$N1NGekFuczZ4QmYuSDNXcQ$XcUFl+xRL9Nl6gGKv9NgvhypkUkfwEvjcVZw4PuCwC0', 0, NULL, NULL, NULL, NULL),
(00000018, 'Rabe', 1, '$argon2i$v=19$m=65536,t=4,p=1$NGF1UHp2L3RlMkN0MnVzdA$uLRSWNm/CUO4mhAiGLyGXpQ5wdlNQsI3N7weACq6/p8', 0, 2, '0331225614', '0345956412', '0326554784'),
(00000019, 'Rakoto', 2, '$argon2i$v=19$m=65536,t=4,p=1$TVU0MS4xVnlTWXFHNTZvYw$QfMyx4Df6SqKedrFgRn2p79yvDLajR8wWXa+zaTDGUo', 0, NULL, '', '', ''),
(00000020, 'Rasoa', 1, '$argon2i$v=19$m=65536,t=4,p=1$NXNpWlB3S0NKSzlMeXBsWA$5/DLXSecbep+73DVW5g8V/anW4xMDDERUjEoay22Ozs', 0, 3, '0332512345', '', '0321548974'),
(00000021, 'Randria', 1, '$argon2i$v=19$m=65536,t=4,p=1$eU1XRmwyOXNpVnVuYktFZA$SvE/YOjvBgosCSw+Fr0vgkq+WvqHTPtumZ+0wgQCq+Y', 0, 5, '', '', '0321248975');

-- --------------------------------------------------------

--
-- Structure de la table `villei`
--

DROP TABLE IF EXISTS `villei`;
CREATE TABLE IF NOT EXISTS `villei` (
  `idVilleI` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(255) NOT NULL,
  `Issup` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idVilleI`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `villei`
--

INSERT INTO `villei` (`idVilleI`, `Libelle`, `Issup`) VALUES
(1, '1', 0),
(2, '1', 1),
(3, '2', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `authtoken`
--
ALTER TABLE `authtoken`
  ADD CONSTRAINT `fk_User_token` FOREIGN KEY (`CodeU`) REFERENCES `users` (`CodeU`);

--
-- Contraintes pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `fk_users_contacts` FOREIGN KEY (`codeU`) REFERENCES `users` (`CodeU`);

--
-- Contraintes pour la table `depotu`
--
ALTER TABLE `depotu`
  ADD CONSTRAINT `fk_Users_depot` FOREIGN KEY (`Codeu`) REFERENCES `users` (`CodeU`),
  ADD CONSTRAINT `fk_tsena_depot` FOREIGN KEY (`CodeT`) REFERENCES `tsena` (`CodeT`);

--
-- Contraintes pour la table `detlivrable`
--
ALTER TABLE `detlivrable`
  ADD CONSTRAINT `fk_detL_livrable` FOREIGN KEY (`idLivrables`) REFERENCES `livrables` (`idLivrables`),
  ADD CONSTRAINT `fk_stocke_detL` FOREIGN KEY (`idStocke`) REFERENCES `stocke` (`idStockE`);

--
-- Contraintes pour la table `detmvt`
--
ALTER TABLE `detmvt`
  ADD CONSTRAINT `fk_article_detmvt` FOREIGN KEY (`idArticle`) REFERENCES `article` (`IdArticle`),
  ADD CONSTRAINT `fk_detMvt_mvt` FOREIGN KEY (`idmvt`) REFERENCES `mvt` (`idmvt`);

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `fk_equipe_VilleI` FOREIGN KEY (`idVilleI`) REFERENCES `villei` (`idVilleI`);

--
-- Contraintes pour la table `histoe`
--
ALTER TABLE `histoe`
  ADD CONSTRAINT `fk_stocke_histoe` FOREIGN KEY (`idStockE`) REFERENCES `stocke` (`idStockE`);

--
-- Contraintes pour la table `histostock`
--
ALTER TABLE `histostock`
  ADD CONSTRAINT `fk_histostock_article` FOREIGN KEY (`idArticle`) REFERENCES `article` (`IdArticle`);

--
-- Contraintes pour la table `livrables`
--
ALTER TABLE `livrables`
  ADD CONSTRAINT `fk_Users_Livrables` FOREIGN KEY (`CodeU`) REFERENCES `users` (`CodeU`);

--
-- Contraintes pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `fk_Materiel_typeA` FOREIGN KEY (`idTypeA`) REFERENCES `typea` (`idTypeA`);

--
-- Contraintes pour la table `mvt`
--
ALTER TABLE `mvt`
  ADD CONSTRAINT `fk_users_destinataire` FOREIGN KEY (`idDestinataire`) REFERENCES `users` (`CodeU`),
  ADD CONSTRAINT `fk_users_source` FOREIGN KEY (`idSource`) REFERENCES `users` (`CodeU`);

--
-- Contraintes pour la table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `fk_users_participation` FOREIGN KEY (`CodeU`) REFERENCES `users` (`CodeU`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_Produit_TypeA` FOREIGN KEY (`idTypeA`) REFERENCES `typea` (`idTypeA`);

--
-- Contraintes pour la table `ramassage`
--
ALTER TABLE `ramassage`
  ADD CONSTRAINT `fk_depot_ramassage` FOREIGN KEY (`idDep`) REFERENCES `depotu` (`idDep`),
  ADD CONSTRAINT `fk_tsena_ramassage` FOREIGN KEY (`CodeT`) REFERENCES `tsena` (`CodeT`),
  ADD CONSTRAINT `fk_users_ramassage` FOREIGN KEY (`CodeU`) REFERENCES `users` (`CodeU`);

--
-- Contraintes pour la table `stocke`
--
ALTER TABLE `stocke`
  ADD CONSTRAINT `fk_article_stockE` FOREIGN KEY (`idArticle`) REFERENCES `article` (`IdArticle`),
  ADD CONSTRAINT `fk_equipe_stockE` FOREIGN KEY (`idEquipe`) REFERENCES `equipe` (`idEquipe`);

--
-- Contraintes pour la table `tri`
--
ALTER TABLE `tri`
  ADD CONSTRAINT `fk_users_tri` FOREIGN KEY (`CodeU`) REFERENCES `users` (`CodeU`);

--
-- Contraintes pour la table `tsena`
--
ALTER TABLE `tsena`
  ADD CONSTRAINT `fk_VilleI_tsena` FOREIGN KEY (`idVille`) REFERENCES `villei` (`idVilleI`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_User_TypeU` FOREIGN KEY (`idTypeU`) REFERENCES `typeu` (`idTypeU`),
  ADD CONSTRAINT `fk_users_equipe` FOREIGN KEY (`idEquipe`) REFERENCES `equipe` (`idEquipe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
