-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 15 fév. 2022 à 14:20
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
-- Base de données :  `ists_test`
--

-- --------------------------------------------------------

--
-- Structure de la table `annee_universitaire`
--

DROP TABLE IF EXISTS `annee_universitaire`;
CREATE TABLE IF NOT EXISTS `annee_universitaire` (
  `IDAnnee_universitaire` bigint(20) NOT NULL AUTO_INCREMENT,
  `Annee` varchar(50) DEFAULT '',
  `encours` tinyint(4) DEFAULT '0',
  `Suppr` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`IDAnnee_universitaire`),
  KEY `encours` (`encours`),
  KEY `Suppr` (`Suppr`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `annee_universitaire`
--

INSERT INTO `annee_universitaire` (`IDAnnee_universitaire`, `Annee`, `encours`, `Suppr`) VALUES
(1, '2019-2020', 0, NULL),
(2, '2020-2021', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `compteur`
--

DROP TABLE IF EXISTS `compteur`;
CREATE TABLE IF NOT EXISTS `compteur` (
  `IDcompteur` bigint(20) NOT NULL AUTO_INCREMENT,
  `Etudiant` bigint(20) UNSIGNED DEFAULT '0',
  `Professeur` bigint(20) UNSIGNED DEFAULT '0',
  `Employe` bigint(20) UNSIGNED DEFAULT '0',
  PRIMARY KEY (`IDcompteur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compteur`
--

INSERT INTO `compteur` (`IDcompteur`, `Etudiant`, `Professeur`, `Employe`) VALUES
(1, 356, 80, 10);

-- --------------------------------------------------------

--
-- Structure de la table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
CREATE TABLE IF NOT EXISTS `conversation` (
  `IDEtudiant` bigint(20) NOT NULL,
  `IDProfesseur` bigint(20) NOT NULL,
  `IDConversation` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`IDConversation`),
  KEY `fk_etudiant_conversation` (`IDEtudiant`),
  KEY `fk_professeur_conversation` (`IDProfesseur`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `conversation`
--

INSERT INTO `conversation` (`IDEtudiant`, `IDProfesseur`, `IDConversation`) VALUES
(1, 1, 1),
(2, 1, 2),
(2, 3, 3),
(2, 8, 4),
(2, 15, 5),
(2, 15, 6),
(2, 15, 7),
(2, 15, 8);

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `IDDocument` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) DEFAULT '',
  `Titre` varchar(50) DEFAULT '',
  `Description` longtext,
  `Creation` date DEFAULT NULL,
  `Diffusion` date DEFAULT NULL,
  `Expiration` date DEFAULT NULL,
  `A_rendre` date DEFAULT NULL,
  `IDParcours` bigint(20) DEFAULT '0',
  `IDNiveau` bigint(20) DEFAULT '0',
  `IDModule` bigint(20) DEFAULT '0',
  `IDProfesseur` bigint(20) DEFAULT '0',
  `IDAnnee_universitaire` bigint(20) DEFAULT '0',
  `Suppr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDDocument`),
  KEY `Type` (`Type`),
  KEY `Titre` (`Titre`),
  KEY `Creation` (`Creation`),
  KEY `Diffusion` (`Diffusion`),
  KEY `Expiration` (`Expiration`),
  KEY `A_rendre` (`A_rendre`),
  KEY `IDParcours` (`IDParcours`),
  KEY `IDNiveau` (`IDNiveau`),
  KEY `IDModule` (`IDModule`),
  KEY `IDProfesseur` (`IDProfesseur`),
  KEY `IDAnnee_universitaire` (`IDAnnee_universitaire`),
  KEY `Suppr` (`Suppr`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`IDDocument`, `Type`, `Titre`, `Description`, `Creation`, `Diffusion`, `Expiration`, `A_rendre`, `IDParcours`, `IDNiveau`, `IDModule`, `IDProfesseur`, `IDAnnee_universitaire`, `Suppr`) VALUES
(1, 'ASSIMILATION', 'TEST', 'test', '2021-08-04', '2021-08-04', '2021-08-18', '2021-08-28', 1, 1, 2, 1, 2, 0),
(2, 'ASSIMILATION', 'TEST 2', 'test 2', '2021-08-04', '2021-08-04', '2021-08-06', '2021-08-07', 1, 1, 2, 1, 2, 0),
(3, 'ASSIMILATION', 'TEST3', 'test 3', '2021-08-04', '2021-08-04', '2021-08-07', '2021-08-16', 1, 1, 2, 1, 2, 0),
(4, 'ASSIMILATION', 'TEST ENVOI LECON', 'Administration social', '2021-08-04', '2021-08-04', '2021-08-07', NULL, 2, 3, 41, 55, 2, 0),
(5, 'ASSIMILATION', 'TESSS TT', 'ybdq dsjkj', '2021-08-04', '2021-08-04', '2021-08-07', '2021-08-14', 1, 1, 3, 3, 2, 0),
(6, 'EXERCICE', 'EXO1', 'Exo1', '2021-08-04', '2021-08-04', '2021-08-05', '2021-08-05', 1, 1, 2, 1, 2, 1),
(7, 'ASSIMILATION', 'AZERTY', 'QGSDFGK', '2021-08-04', '2021-08-04', '2021-08-05', '2021-08-06', 1, 1, 3, 3, 2, 0),
(8, 'ASSIMILATION', 'AZERTY333', 'aert333', '2021-08-04', '2021-08-04', '2021-08-06', '2021-08-07', 1, 1, 3, 3, 2, 0),
(9, 'ASSIMILATION', 'MULTIFICHER', 'MULTIFICHER', '2021-08-09', '2021-08-09', '2021-08-14', NULL, 1, 1, 2, 1, 2, 0),
(10, 'ASSIMILATION', 'TEST21', 'test21', '2021-08-10', '2021-08-10', '2021-08-21', NULL, 1, 1, 2, 1, 2, 1),
(12, 'Assimilation', 'Titre be', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nisi modi explicabo eligendi ad repellat non dolorum illum? Temporibus debitis ut aliquam, quo tenetur id, quasi tempore corporis quis vitae nesciunt!', '2021-12-26', '2021-12-27', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 1),
(13, 'Assimilation', 'Titre be', '\n  Lorem, ipsum dolor sit amet consectetur adipisicing elit. Debitis vero, officiis odio sed cum quaerat, minus, amet magni sequi fugiat quidem reiciendis maxime? Molestiae dolor quos esse tempora unde pariatur!', '2021-12-27', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 1),
(14, 'Assimilation', 'Titre be', '\n  Lorem, ipsum dolor sit amet consectetur adipisicing elit. Debitis vero, officiis odio sed cum quaerat, minus, amet magni sequi fugiat quidem reiciendis maxime? Molestiae dolor quos esse tempora unde pariatur!', '2021-12-27', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 1),
(15, 'Assimilation', 'Titre be', '\n  Lorem, ipsum dolor sit amet consectetur adipisicing elit. Debitis vero, officiis odio sed cum quaerat, minus, amet magni sequi fugiat quidem reiciendis maxime? Molestiae dolor quos esse tempora unde pariatur!', '2021-12-27', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 1),
(16, 'Assimilation', 'Titre be', '\n  Lorem, ipsum dolor sit amet consectetur adipisicing elit. Debitis vero, officiis odio sed cum quaerat, minus, amet magni sequi fugiat quidem reiciendis maxime? Molestiae dolor quos esse tempora unde pariatur!', '2021-12-27', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 1),
(17, 'Assimilation', 'Nouveau leçon', '\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Repellendus ab officiis error odio deserunt nam eaque similique debitis sunt culpa eos, vel doloremque inventore delectus sapiente rerum quam. Culpa, tempora!', '2021-12-27', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 0),
(18, 'Assimilation', 'Nouveau leçon', '\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Repellendus ab officiis error odio deserunt nam eaque similique debitis sunt culpa eos, vel doloremque inventore delectus sapiente rerum quam. Culpa, tempora!', '2021-12-27', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 0),
(19, 'Assimilation', 'Nouveau leçon', '\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Repellendus ab officiis error odio deserunt nam eaque similique debitis sunt culpa eos, vel doloremque inventore delectus sapiente rerum quam. Culpa, tempora!', '2021-12-27', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 0),
(20, 'Assimilation', 'Nouveau leçon', '\nLorem ipsum, dolor sit amet consectetur adipisicing elit. Repellendus ab officiis error odio deserunt nam eaque similique debitis sunt culpa eos, vel doloremque inventore delectus sapiente rerum quam. Culpa, tempora!', '2021-12-27', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 0),
(21, 'Assimilation', 'Titre be', 'Lorem\nLorem ipsum dolor sit amet consectetur adipisicing elit. In tempora illo nulla optio temporibus animi vero repellat nostrum incidunt? Incidunt pariatur commodi magni, adipisci nulla minus officiis veniam? Numquam, reiciendis.', '2021-12-27', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 0),
(22, 'Assimilation', 'Titre be', 'Lorem\nLorem ipsum dolor sit amet consectetur adipisicing elit. In tempora illo nulla optio temporibus animi vero repellat nostrum incidunt? Incidunt pariatur commodi magni, adipisci nulla minus officiis veniam? Numquam, reiciendis.', '2021-12-27', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 0),
(23, 'Assimilation', 'Lesona vaovao', '\nLorem ipsum dolor sit amet consectetur adipisicing elit. In tempora illo nulla optio temporibus animi vero repellat nostrum incidunt? Incidunt pariatur commodi magni, adipisci nulla minus officiis veniam? Numquam, reiciendis.', '2021-12-27', '2022-01-09', '2022-01-08', '2022-01-09', NULL, NULL, NULL, 1, 2, 0),
(24, 'Assimilation', 'Lesona vaovao', '\nLorem ipsum dolor sit amet consectetur adipisicing elit. In tempora illo nulla optio temporibus animi vero repellat nostrum incidunt? Incidunt pariatur commodi magni, adipisci nulla minus officiis veniam? Numquam, reiciendis.', '2021-12-27', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 0),
(25, 'Assimilation', 'Intro à la travail social chapitre 2', '\nLorem ipsum dolor sit amet consectetur adipisicing elit. Minus quidem sed accusantium maxime eum provident dolorum eos excepturi adipisci enim saepe nisi, consectetur asperiores dolore veniam? Esse totam ut molestias.', '2021-12-28', '2021-12-31', '2021-12-31', '2021-12-31', NULL, NULL, NULL, 1, 2, 1),
(26, 'Assimilation', 'Intro à la travail social chapitre 3', '\n  Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis quae est a soluta maxime eos placeat omnis. Fuga fugiat laboriosam accusamus facilis sed a cupiditate in corrupti ratione, aspernatur molestias.', '2021-12-28', '2021-12-31', '2022-01-08', '2022-01-07', 1, 1, 2, 1, 2, 0),
(27, 'Assimilation', 'Intro à la travail social chapitre 4', '\n  Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eveniet eaque ipsum modi molestiae nisi corrupti unde velit iste quisquam iusto, culpa nulla mollitia rem expedita perspiciatis accusantium animi assumenda autem.', '2021-12-28', '2022-01-03', '2022-01-07', '2022-01-07', 1, 1, 2, 1, 2, 0),
(28, 'Assimilation', 'Intro à la travail social chapitre 5', '\n  Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eveniet eaque ipsum modi molestiae nisi corrupti unde velit iste quisquam iusto, culpa nulla mollitia rem expedita perspiciatis accusantium animi assumenda autem.', '2021-12-28', '2022-01-03', '2022-01-07', '2022-01-07', 1, 1, 2, 1, 2, 0),
(29, 'Assimilation', 'Intro à la travail social chapitre 6', '\n  Lorem, ipsum dolor sit amet consectetur adipisicing elit. Laboriosam sequi, inventore eligendi, nemo optio ab, ratione architecto est laudantium minima quasi. Commodi atque reiciendis dolorem quam aut doloribus temporibus. Sint!', '2021-12-28', '2022-01-03', '2022-01-08', '2022-01-07', 1, 1, 2, 1, 2, 0),
(30, 'Assimilation', 'Intro à la travail social chapitre 7', '\n  Lorem ipsum dolor sit amet consectetur adipisicing elit. Blanditiis non ipsam, quo inventore quaerat esse porro ratione consequatur qui voluptate sit libero nulla temporibus tenetur magnam et in. Delectus, nihil.', '2021-12-28', '2021-12-31', '2022-01-03', '2021-12-31', 1, 1, 2, 1, 2, 0),
(31, 'Assimilation', 'Intro à la travail social chapitre 8', '\n  Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores facere cupiditate sit quasi excepturi vero hic. Cupiditate sequi nulla assumenda ab, dolores consequuntur dicta! Temporibus facere repudiandae sunt aperiam. Incidunt?', '2021-12-28', '2021-12-31', '2022-01-03', '2022-01-07', 1, 1, 2, 1, 2, 0),
(32, 'Assimilation', 'Intro à la travail social chapitre 8', '\n  Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores facere cupiditate sit quasi excepturi vero hic. Cupiditate sequi nulla assumenda ab, dolores consequuntur dicta! Temporibus facere repudiandae sunt aperiam. Incidunt?', '2021-12-28', '2022-01-06', '2021-12-31', '2021-12-31', 1, 1, 2, 1, 2, 0),
(33, 'Assimilation', 'Intro à la travail social chapitre 9', '\n  Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores facere cupiditate sit quasi excepturi vero hic. Cupiditate sequi nulla assumenda ab, dolores consequuntur dicta! Temporibus facere repudiandae sunt aperiam. Incidunt?', '2021-12-28', '2021-12-30', '2022-01-01', '2022-01-07', 1, 1, 2, 1, 2, 0),
(34, 'Assimilation', 'Intro à la travail social chapitre 9', '\n  Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores facere cupiditate sit quasi excepturi vero hic. Cupiditate sequi nulla assumenda ab, dolores consequuntur dicta! Temporibus facere repudiandae sunt aperiam. Incidunt?', '2021-12-28', '2021-12-30', '2022-01-01', '2022-01-07', 1, 1, 2, 1, 2, 0),
(35, 'Assimilation', 'Lesona vaovao 2', '\n  Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem deleniti incidunt quas ipsam nesciunt, repudiandae aliquam iure. At illo ea sed facere impedit, cum quo cumque veritatis praesentium aperiam nulla?', '2021-12-28', '2021-12-31', '2021-12-31', '2021-12-31', 1, 1, 2, 1, 2, 1),
(36, 'Assimilation', 'Lesona vaovao 3', '\n  Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique, hic? Ducimus reiciendis totam perspiciatis consequatur sed laboriosam quod nam possimus repellendus hic numquam natus in, non deleniti. Laudantium, placeat et?', '2021-12-28', '2021-12-31', '2021-12-31', '2021-12-31', 1, 1, 2, 1, 2, 0),
(37, 'Assimilation', 'Lesona vaovao 4', '\n  Lorem ipsum dolor sit amet consectetur adipisicing elit. Similique, hic? Ducimus reiciendis totam perspiciatis consequatur sed laboriosam quod nam possimus repellendus hic numquam natus in, non deleniti. Laudantium, placeat et?', '2021-12-28', '2021-12-30', '2021-12-30', '2022-01-07', 1, 1, 2, 1, 2, 0),
(38, 'Assimilation', 'Lesona vaovao 4', 'This tool was created because we wanted random text for our web designs. When we show a design to a client we want to have some text that doesn\'t mean anything in particular just to indicate that \"here is where the text will be\". So why shouldn\'t we just copy-paste a single sentence and get a block of text ? Have a look at the following examples:', '2021-12-28', '2021-12-31', '2021-12-31', '2021-12-31', 1, 1, 2, 1, 2, 0),
(39, 'Assimilation', 'Lesona vaovao 5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2021-12-28', '2021-12-30', '2021-12-30', '2022-01-07', 1, 1, 2, 1, 2, 0),
(40, 'Assimilation', 'Lesona vaovao 6', 'Random Text Generator is a web application which provides true random text which you can use in your documents or web designs. How does it work? First we took many books available on project Gutenberg and stored their contents in a database. Then a computer algorithm takes the words we stored earlier and shuffles them into sentences and paragraphs.\n\nThe algorithm takes care to create text that looks similar to an ordinary book but without any real meaning. The reason we want our text to be meaningless is that we want the person viewing the resulting random text to focus on the design we are presenting, rather than try to read and understand the text.', '2021-12-28', '2022-01-07', '2022-01-31', '2022-01-10', 1, 1, 2, 1, 2, 0),
(41, 'Assimilation', 'Nouveau leçon 1', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2021-12-28', '2021-12-31', '2021-12-31', '2022-01-07', 1, 1, 2, 1, 2, 0);

-- --------------------------------------------------------

--
-- Structure de la table `doc_encadrement`
--

DROP TABLE IF EXISTS `doc_encadrement`;
CREATE TABLE IF NOT EXISTS `doc_encadrement` (
  `IDdoc_encadrement` bigint(20) NOT NULL AUTO_INCREMENT,
  `Titre` varchar(50) DEFAULT '',
  `url` longtext,
  `Extension` varchar(5) DEFAULT '',
  `Nom_Fichier` varchar(200) DEFAULT '',
  `IDProfesseur` bigint(20) DEFAULT '0',
  `IDEtudiant` bigint(20) DEFAULT '0',
  PRIMARY KEY (`IDdoc_encadrement`),
  KEY `Titre` (`Titre`),
  KEY `IDProfesseur` (`IDProfesseur`),
  KEY `IDEtudiant` (`IDEtudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `doc_etudiant`
--

DROP TABLE IF EXISTS `doc_etudiant`;
CREATE TABLE IF NOT EXISTS `doc_etudiant` (
  `IDdoc_etudiant` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Titre` varchar(50) DEFAULT '',
  `Description` longtext,
  `Nom_Fichier` varchar(200) DEFAULT '',
  `Type` varchar(20) DEFAULT '',
  `url` longtext,
  `Tailles` varchar(10) DEFAULT NULL,
  `Extension` varchar(50) DEFAULT '',
  `IDEtudiant` bigint(20) DEFAULT '0',
  `IDDocument` int(11) DEFAULT '0',
  `Vu` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`IDdoc_etudiant`),
  KEY `Date` (`Date`),
  KEY `Titre` (`Titre`),
  KEY `Type` (`Type`),
  KEY `IDEtudiant` (`IDEtudiant`),
  KEY `IDDocument` (`IDDocument`),
  KEY `Vu` (`Vu`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `doc_etudiant`
--

INSERT INTO `doc_etudiant` (`IDdoc_etudiant`, `Date`, `Titre`, `Description`, `Nom_Fichier`, `Type`, `url`, `Tailles`, `Extension`, `IDEtudiant`, `IDDocument`, `Vu`) VALUES
(28, '2022-01-31', 'Lorem ispum', 'fdgsdfgsdfgsdg', '0187-formation-merise.pdf', NULL, 'c2db2f843d561680488bd000295261b6.pdf', NULL, 'pdf', 1, 40, 1);

-- --------------------------------------------------------

--
-- Structure de la table `doc_lien`
--

DROP TABLE IF EXISTS `doc_lien`;
CREATE TABLE IF NOT EXISTS `doc_lien` (
  `IDdoc_lien` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `IDDocument` int(11) DEFAULT NULL,
  `Nom_Fichier` varchar(200) DEFAULT NULL,
  `url` longtext,
  `Tailles` varchar(10) DEFAULT NULL,
  `Extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`IDdoc_lien`),
  KEY `IDDocument` (`IDDocument`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `doc_lien`
--

INSERT INTO `doc_lien` (`IDdoc_lien`, `IDDocument`, `Nom_Fichier`, `url`, `Tailles`, `Extension`) VALUES
(00000000000000000001, 1, '21.pdf', '/Mes_fichiers/Parcours1/Niveau1/Module2/ASSIMILATION/21.pdf', '999 Ko', '.pdf'),
(00000000000000000002, 2, 'FastPHP.pdf', '/Mes_fichiers/Parcours1/Niveau1/Module2/ASSIMILATION/FastPHP.pdf', '999 Ko', '.pdf'),
(00000000000000000003, 3, 'brochure-WX26.pdf', '/Mes_fichiers/Parcours1/Niveau1/Module2/ASSIMILATION/brochure-WX26.pdf', '999 Ko', '.pdf'),
(00000000000000000004, 4, 'calendrier-2020.pdf', '/Mes_fichiers/Parcours2/Niveau3/Module41/ASSIMILATION/calendrier-2020.pdf', '999 Ko', '.pdf'),
(00000000000000000005, 5, 'CRUD Application PHP with Source Code.mkv', '/Mes_fichiers/Parcours1/Niveau1/Module3/ASSIMILATION/CRUD Application PHP with Source Code.mkv', '999 Ko', '.mkv'),
(00000000000000000006, 7, 'page0018.pdf', '/Mes_fichiers/Parcours1/Niveau1/Module3/ASSIMILATION/page0018.pdf', '999 Ko', '.pdf'),
(00000000000000000007, 8, 'page0019.pdf', '/Mes_fichiers/Parcours1/Niveau1/Module3/ASSIMILATION/page0019.pdf', '167263', '.pdf'),
(00000000000000000008, 9, 'brochure-WX26.pdf', '/Mes_fichiers/Parcours1/Niveau1/Module2/ASSIMILATION/brochure-WX26.pdf', '999 Ko', '.pdf'),
(00000000000000000009, 9, 'FastPHP.pdf', '/Mes_fichiers/Parcours1/Niveau1/Module2/ASSIMILATION/FastPHP.pdf', '999 Ko', '.pdf'),
(00000000000000000010, 9, 'COURS_COMPLET.mp4', '/Mes_fichiers/Parcours1/Niveau1/Module2/ASSIMILATION/COURS_COMPLET.mp4', '999 Ko', '.mp4'),
(00000000000000000011, NULL, 'bd9e644d018d937c9c1e614e88b363d8.jpg', NULL, NULL, NULL),
(00000000000000000012, NULL, '74519734f3f1011de4967fbe1f9bf24f.jpg', NULL, NULL, NULL),
(00000000000000000013, NULL, '0c29282bd42c63daa50923e632d1d1ea.jpg', NULL, NULL, NULL),
(00000000000000000014, 21, 'ff3a0bf650b4b3729ef8996155fe8c32.jpg', NULL, NULL, NULL),
(00000000000000000015, 21, '909fd68d86bad2e733448c795f49e53e.txt', NULL, NULL, NULL),
(00000000000000000016, 23, '3c49a07d012e95df4eefab084d0b21c0.pdf', NULL, NULL, NULL),
(00000000000000000017, 23, '3c77bb863e955112320cafc5a4615291.pdf', NULL, NULL, NULL),
(00000000000000000018, 23, '94f8999191c69232835b4b2011ec92e5.pdf', NULL, NULL, NULL),
(00000000000000000019, 24, '1cf881304595edc0e1679db6ab4b1c74.pdf', NULL, NULL, NULL),
(00000000000000000020, 24, '09aa031f63ba19668e897e25d9da3d64.pdf', NULL, NULL, NULL),
(00000000000000000021, 26, 'fbf0c97d15afb6eed2c173290b028b68.pdf', NULL, NULL, NULL),
(00000000000000000022, 26, '023c4417730c23e5e9709aa564d39d8d.pdf', NULL, NULL, NULL),
(00000000000000000023, 27, 'pdf', '0899d0e27fb1eae3a44505a4eafeb098.pdf', NULL, NULL),
(00000000000000000024, 27, 'pdf', 'f6935805d18d8b00c9bb18bee29a449e.pdf', NULL, NULL),
(00000000000000000025, 30, '.png', '6616de531c012f169807ae2a77135353.png', NULL, 'png'),
(00000000000000000026, 31, 'Acces-securise-a-des-documents.pdf', '1a04d5f831cb699484e48461e1c6d28d.pdf', NULL, 'pdf'),
(00000000000000000027, 31, 'Create user.txt', 'a5f66f300bfd50aeb2aa3b5e2a523677.txt', NULL, 'txt'),
(00000000000000000028, 32, 'Adopter-un-style-de-programmation-clair-avec-le-modele-mvc.pdf', '50e9df065153c033aed266b57718c738.pdf', NULL, 'pdf'),
(00000000000000000029, 35, 'Lisezmoi.pdf', '5c15dcee144a090dcfdf239abb5581d7.pdf', NULL, 'pdf'),
(00000000000000000030, 38, 'Beignet de crevette.jpg', '9688e7ecae14f5e9465f809af29a9f74.jpg', NULL, 'jpg'),
(00000000000000000031, 38, 'Beignet de poulet.jpg', 'f91f876abf1907f6ab986ae13d6c6453.jpg', NULL, 'jpg'),
(00000000000000000032, 39, 'Nouveau document texte (2).txt', 'e768d6da7f13b7ee480bdfe7673da989.txt', NULL, 'txt'),
(00000000000000000033, 39, 'Plesk.txt', 'aa39814fd5725283ffe9f174ea164ecf.txt', NULL, 'txt'),
(00000000000000000034, 39, 'Récapitulatif SINGER.pdf', '81f739226a0f3dd65b47a782c1648126.pdf', NULL, 'pdf'),
(00000000000000000035, 39, 'Récapitulatif VISTA.pdf', '8f446bbc55255930408479b3715d343a.pdf', NULL, 'pdf'),
(00000000000000000040, 41, 'Recap ISTS.pdf', 'd8723f67239f1cde66477d85323cbed8.pdf', NULL, 'pdf'),
(00000000000000000041, 41, 'Récapitulatif SINGER.pdf', 'a2b6b7ceb59032dcc4e95ecd75c2c743.pdf', NULL, 'pdf');

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `IDEmploye` bigint(20) NOT NULL AUTO_INCREMENT,
  `Code` varchar(50) DEFAULT '',
  `Civilite_num` tinyint(3) UNSIGNED DEFAULT '0',
  `Civilite` varchar(4) DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `Prenom` varchar(50) DEFAULT '',
  `dateNaiss` date DEFAULT NULL,
  `Contact` varchar(50) DEFAULT '',
  `Email` varchar(50) DEFAULT '',
  `Motdepasse` varchar(50) DEFAULT '',
  `A_creer` tinyint(4) DEFAULT '0',
  `Suppr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDEmploye`),
  UNIQUE KEY `Code` (`Code`),
  KEY `NomPrenom` (`Nom`,`Prenom`),
  KEY `A_creer` (`A_creer`),
  KEY `Suppr` (`Suppr`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`IDEmploye`, `Code`, `Civilite_num`, `Civilite`, `Nom`, `Prenom`, `dateNaiss`, `Contact`, `Email`, `Motdepasse`, `A_creer`, `Suppr`) VALUES
(1, 'ADD', 6, 'Mr', 'DIGITAL', 'Technology', '2007-01-01', '0340920806', 'email@digitec.mg', '0', 0, 0),
(2, 'ADANDJ1909932', 6, 'Mr', 'ANDRINOMENJANAHARY', 'Joany henintsoa', '1993-09-19', '0343636530', 'cema.ists@moov.mg', 'HopeKely99HOPE:)', 1, 0),
(3, 'ADRASB2502773', 4, 'Sr', 'RASOAMBOLATIANA', 'Berthine', '1977-02-25', '0341039197', 'berthembolatiana@gmail.com', 'SoeurDE21', 1, 0),
(4, 'ADTAHL1010104', 4, 'Sr', 'TAHIRINIAINA', 'Léa', '1010-10-10', '', '', '0000', 1, 0),
(5, 'ADRAJV0408205', 6, 'Mr', 'RAJAONARISOA', 'Velo', '2020-08-04', '0330000000', 'rajaonarisoavelo@gmail.com', '1234', 1, 1),
(6, 'ADRAJV1406216', 6, 'Mr', 'RAJAONARISOA', 'Veloniaina', '2021-06-14', '033000000', 'rajaonarisoaveloniaina@gmail.com', '0000', 1, 1),
(7, 'ADRABD2403217', 6, 'Mr', 'RABENARIVO', 'Daniellah', '2021-03-24', '', '', '0000', 1, 1),
(8, 'ADRABJ0203218', 6, 'Mr', 'RABENARIVO', 'Joh', '2021-03-02', '0330000000', '', '0000', 1, 1),
(9, 'ADRABF3006219', 6, 'Mr', 'RABENARIVO', 'Fandresena', '2021-06-30', '', '', '1234', 0, 1),
(10, 'ADRAVD27118510', 6, 'Mr', 'RAVAOSOLO', 'Dera', '1985-11-27', '', '', '0650', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `encadrement`
--

DROP TABLE IF EXISTS `encadrement`;
CREATE TABLE IF NOT EXISTS `encadrement` (
  `IDencadrement` bigint(20) NOT NULL AUTO_INCREMENT,
  `IDEtudiant` bigint(20) DEFAULT '0',
  `IDAnnee_universitaire` bigint(20) DEFAULT '0',
  `IDProfesseur` bigint(20) DEFAULT '0',
  PRIMARY KEY (`IDencadrement`),
  KEY `IDEtudiantIDAnnee` (`IDEtudiant`,`IDAnnee_universitaire`),
  KEY `IDEtudiant` (`IDEtudiant`),
  KEY `IDAnnee_universitaire` (`IDAnnee_universitaire`),
  KEY `IDProfesseur` (`IDProfesseur`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `encadrement`
--

INSERT INTO `encadrement` (`IDencadrement`, `IDEtudiant`, `IDAnnee_universitaire`, `IDProfesseur`) VALUES
(1, 1, 2, 1),
(2, 2, 2, 1),
(3, 3, 2, 1),
(4, 6, 2, 1),
(5, 10, 2, 1),
(6, 118, 2, 1),
(7, 119, 2, 1),
(8, 132, 2, 1),
(9, 133, 2, 1),
(10, 136, 2, 1),
(11, 159, 2, 1),
(12, 161, 2, 1),
(13, 312, 2, 1),
(14, 314, 2, 1),
(15, 319, 2, 1),
(16, 322, 2, 1),
(17, 328, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `IDEtudiant` bigint(20) NOT NULL AUTO_INCREMENT,
  `Matricule` varchar(10) DEFAULT '',
  `Code` varchar(50) DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `Prenom` varchar(50) DEFAULT '',
  `dateNaiss` date DEFAULT NULL,
  `Contact` varchar(50) DEFAULT '',
  `Email` varchar(50) DEFAULT '',
  `Motdepasse` varchar(20) DEFAULT '',
  `IDParcours` bigint(20) DEFAULT '0',
  `IDNiveau` bigint(20) DEFAULT '0',
  `IDAnnee_universitaire` bigint(20) DEFAULT NULL,
  `A_creer` tinyint(4) DEFAULT '0',
  `Rattrapage` tinyint(4) DEFAULT '0',
  `Suppr` tinyint(4) DEFAULT '0',
  `Photos` text,
  PRIMARY KEY (`IDEtudiant`),
  UNIQUE KEY `Code` (`Code`),
  KEY `Matricule` (`Matricule`),
  KEY `IDParcours` (`IDParcours`),
  KEY `IDNiveau` (`IDNiveau`),
  KEY `A_creer` (`A_creer`),
  KEY `Suppr` (`Suppr`),
  KEY `IDAnnee_universitaire` (`IDAnnee_universitaire`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`IDEtudiant`, `Matricule`, `Code`, `Nom`, `Prenom`, `dateNaiss`, `Contact`, `Email`, `Motdepasse`, `IDParcours`, `IDNiveau`, `IDAnnee_universitaire`, `A_creer`, `Rattrapage`, `Suppr`, `Photos`) VALUES
(1, '01', 'ETA', 'ANDRIAMAHATRATRA', 'Andoniaina Miangaly', '2001-01-01', '', '', '111111', 1, 1, 2, 1, 1, 0, NULL),
(2, '02', 'ETAN', 'ANDRIAMANAMPISOA', 'Valériah Fahasoavana', '2001-01-01', '', '', '0', 1, 1, 2, 1, 0, 0, NULL),
(3, '03', 'ETF', 'FINARITRA', 'Tony Faramalala', '2001-01-01', '', '', '0', 1, 1, 2, 1, 0, 0, NULL),
(4, '04', 'ETHASF0101014', 'HASINJANAHARY', 'Fenosoa Hoby Lalaina Léonie', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(5, '05', 'ETMIHA0101015', 'MIHARISOARIVONIAINA', 'Anjarasoa Eléonore', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(6, '06', 'ETNOMA0101016', 'NOMENJANAHARY', 'Aina Sarobidy', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(7, '07', 'ETNOTF0101017', 'NOTIAVIN’NY', 'Fo Andriamalala', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(8, '07', 'ETNOTF0101018', 'NOTIAVIN’NY', 'Fo Andriamalala', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 1, NULL),
(9, '08', 'ETONTS0101019', 'ONTINIAINA', 'Sariaka', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(10, '09', 'ETRAFH01010110', 'RAFANOMEZANJANAHARIMALALA', 'Hanitriniaina Solange', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(11, '10', 'ETRAFT01010111', 'RAFANOMEZANTSOA', 'Tsilavina Nathanaël', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(12, '11', 'ETRAFE01010112', 'RAFENOMANDRANTO', 'Edoxie Lydia', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(13, '12', 'ETRAHR01010113', 'RAHERIMANDRANTO', 'Rindra Sidonie', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(14, '13', 'ETRAJT01010114', 'RAJAOBELINA', 'Tafita Sarobidy ', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(15, '14', 'ETRAJM01010115', 'RAJAONARISON', 'Mendrika Princya', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(16, '14', 'ETRAJM01010116', 'RAJAONARISON', 'Mendrika Princya', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 1, NULL),
(17, '15', 'ETRAKK01010117', 'RAKOTOARIVELO', 'Koloina Nandrianina', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(18, '16', 'ETRAKJ01010118', 'RAKOTONANDRASANA', 'Jean Rodin Judicaël', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(19, '17', 'ETRAMS01010119', 'RAMANAMBOKATRA', 'Sitraka Herman', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(20, '17', 'ETRAMS01010120', 'RAMANAMBOKATRA', 'Sitraka Herman', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 1, NULL),
(21, '18', 'ETRAMD01010121', 'RAMBOLANIRINASOA', 'Dorisse Raphaëlle', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(22, '19', 'ETRANA01010122', 'RANAIVOSON', 'Andriamialisoa', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(23, '20', 'ETRAND01010123', 'RANDRIAMALALA', 'Dady Michel', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(24, '21', 'ETRANF01010124', 'RANDRIAMALALA', 'Fanomezantsoa Carolle', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(25, '22', 'ETRANT01010125', 'RANDRIAMANJAKA', 'Tombo Norbert', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(26, '23', 'ETRANM01010126', 'RANDRIANANTENAINA', 'Mahefanirina Erica', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(27, '24', 'ETRANK01010127', 'RANDRIANANTOANDRO', 'Kezia Raharinjatovo', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(28, '25', 'ETRANS01010128', 'RANDRIANJATOVO', 'Santatra', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(29, '26', 'ETRANH01010129', 'RANIVOSON', 'Haritojomamy Jules', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(30, '27', 'ETRAST01010130', 'RASOAMANDRESY', 'Tianjanahary Marie Angéla', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(31, '28', 'ETRASE01010131', 'RASOANANDRIANINA', 'Eliane Séraphine', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(32, '29', 'ETRASN01010132', 'RASOANOMENJANAHARY', 'Noarina Françine', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(33, '30', 'ETRATF01010133', 'RATOVONIAINA ', 'Faneva Nirindah Alida', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(34, '31', 'ETRAZS01010134', 'RAZAFIMALALA ', 'Soanome Esther', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(35, '32', 'ETRAZA01010135', 'RAZAFINDRATSIMA ', 'Anjara Nambinintsoa', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(36, '33', 'ETRAZV01010136', 'RAZAFINIRINA ', 'Véronique', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(37, '34', 'ETRIVF01010137', 'RIVONIAINA ', 'Faneva Jean Rico', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(38, '35', 'ETANDI01010138', 'ANDRIAMIHARISOA ', 'Iangola Ihonty Miangaly ', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(39, '36', 'ETANDT01010139', 'ANDRIANJATOVO ', 'Tantely Andoniaina', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(40, '37', 'ETFANN01010140', 'FANANTENANA ', 'Nalanto Andrianambinina', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(41, '38', 'ETHANJ01010141', 'HANITRINIAINA ', 'Jackie Victoire', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(42, '39', 'ETHANH01010142', 'HANTANIAINA ', 'Harisoa Prisca', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(43, '40', 'ETNAMF01010143', 'NAMBININJANAHARY ', 'Fitiavana Iarantsoa', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(44, '41', 'ETRAFR01010144', 'RAFANOHARANA ', 'Rovafitia Suzanna', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(45, '42', 'ETRAHJ01010145', 'RAHARISON ', 'Josie  Liantsoa', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(46, '43', 'ETRAHN01010146', 'RAHERIMALALA  ', 'Nomenaniaina Hortensia', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(47, '44', 'ETRAJC01010147', 'RAJAONAH ', 'Christian Nicia', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(48, '45', 'ETRAJM01010148', 'RAJAONARIMANANA ', 'Mamisoa  Fandresena', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(49, '46', 'ETRAJK01010149', 'RAJAONARY ', 'Kelly Mirasoa', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(50, '47', 'ETRAJM01010150', 'RAJAONARY ', 'Mamitina Lova Kanto', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(51, '48', 'ETRAKT01010151', 'RAKOTOARINIVO ', 'Tiffany Minosoa', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(52, '49', 'ETRAKF01010152', 'RAKOTOARISOA ', 'Fandresena Sylvano', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(53, '50', 'ETRAKN01010153', 'RAKOTOARISOA ', 'Ny Aro', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(54, '51', 'ETRAKJ01010154', 'RAKOTOMAHEFA ', 'Jaona Zakaria', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(55, '52', 'ETRAKH01010155', 'RAKOTOMALALA ', 'Heritiana Joany Fabrice', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(56, '53', 'ETRAKJ01010156', 'RAKOTONIRINA ', 'Jeanny Brice', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(57, '54', 'ETRALA01010157', 'RALPHIN ', 'Anjatiana Karen Mickaëla', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(58, '55', 'ETRAMN01010158', 'RAMANANTSOA ', 'Ny Kanto Muriella', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(59, '56', 'ETRANH01010159', 'RANDRIAMANANA ', 'Heriniaina Prisca', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(60, '57', 'ETRANE01010160', 'RANDRIAMANANTSOA ', 'Edmond Jules', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(61, '58', 'ETRANM01010161', 'RANDRIANAVONY ', 'Mino Henintsoa Tsiresy', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(62, '59', 'ETRANF01010162', 'RANIRISON ', 'Fitiavana Mickael', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(63, '60', 'ETRASB01010163', 'RASOANANTENAINA ', 'Bienvenue Angéla ', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(64, '61', 'ETRASN01010164', 'RASOANIRINA ', 'Nina Angela', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(65, '62', 'ETRASV01010165', 'RASOARILALANIRINA ', 'Victoire', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(66, '63', 'ETRATF01010166', 'RATANIMISAINA ', 'Fahasoavana Soniah', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(67, '64', 'ETRAZT01010167', 'RAZAFINIAINA ', 'Tanjonirina Fanomezantsoa', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(68, '65', 'ETRAZR01010168', 'RAZAFINJATO ', 'Rari-Vola Maellie', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(69, '66', 'ETSENS01010169', 'SENDRASOA ', 'Stenia Vanela', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(70, '67', 'ETSOLM01010170', 'SOLOHASIMBOLA ', 'Miora Fandresena', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(71, '68', 'ETTELK01010171', 'TELINSTOA ', 'Kassie Antsa Mitia', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(72, '69', 'ETTOJF01010172', 'TOJONIRINA ', 'Fanja Fanantenana Omega', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(73, '70', 'ETTOVR01010173', 'TOVONASY ', 'Roberto Fortunat', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(74, '71', 'ETVOLR01010174', 'VOLOLONIAINA ', 'Rovasoa Tanjona', '2001-01-01', '', '', '0000', 1, 1, 2, 1, 0, 0, NULL),
(75, 'ADS0682', 'ETAMEJ02020275', 'AMEDINIRINA ', 'Jouanna Shaïda', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(76, 'ADS0683', 'ETANDL02020276', 'ANDRIANOME ', 'Lanja Henintsoa', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(77, 'ADS0684', 'ETANDV02020277', 'ANDRIANTSOA ', 'VAHATRINIAINA  HERINIRINA', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(78, 'ADS0685', 'ETCHAA02020278', 'CHARAFUDINE ', 'Abdulwahab Fadel Tahinjanahary', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(79, 'ADS0686	', 'ETHANF02020279', 'HANITRINIAINA  ', 'FLORINE LUCIENNE', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(80, 'ADS0687	', 'ETRAFT02020280', 'RAFALIMANANA ', 'Tafitasoa Aina Judicaëlle', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(81, 'ADS0688	', 'ETRAFJ02020281', 'RAFANAMBINASON ', 'Jean Ernest Emilien ', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(82, 'ADS0689	', 'ETRAFJ02020282', 'RAFETISOAMAHAFALY  ', 'Justin Désiré', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(83, 'ADS0690	', 'ETRAHM02020283', 'RAHANTANIRINA ', 'MARIE CHANTAL', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(84, 'ADS0691	', 'ETRAHA02020284', 'RAHARIMIZAKA ', 'ANGE', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(85, 'ADS0692	', 'ETRAHV02020285', 'RAHARIVONIMALALA ', 'VERONIAINA', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(86, 'ADS0693	', 'ETRAKV02020286', 'RAKOTOARISON RANDRIA ', 'Valisoa Andon’aina', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(87, 'ADS0694	', 'ETRAKL02020287', 'RAKOTOMALALA', 'Lantoniaina Fenositraka Célestin', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(88, 'ADS0695	', 'ETRAKM02020288', 'RAKOTOMALALA ', 'Marie Tahina', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(89, 'ADS0696	', 'ETRANN02020289', 'RANAIVONJATO ', 'Njaka Lucien', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(90, 'ADS0697	', 'ETRANM02020290', 'RANDRIANIFAHANANA ', 'Marie Kevinah', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(91, 'ADS0698	', 'ETRAVC02020291', 'RAVAOARIMALALA ', 'CHRISTIANE', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(92, 'ADS0699	', 'ETRAVM02020292', 'RAVAOARISENDRA ', 'MIRANA ANNA', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(93, 'ADS0700	', 'ETRAZT02020293', 'RAZAFIMAHATRATRA ', 'Tojo Hary Jao', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(94, 'ADS0701	', 'ETTARO02020294', 'TARATRINIAINA SEDERA ', 'Onilanto Norohasina', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(95, 'ADS0702	', 'ETTOLH02020295', 'TOLOTRINIAINA ', 'Herizo', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(96, 'ADS0703	', 'ETANDM02020296', 'ANDRIAHOARISOA ', 'Miarintsara Emilio', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(97, 'ADS0704	', 'ETANDS02020297', 'ANDRIANOMENTSOA ', 'Salohy Heriniaina', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(98, 'ADS0705	', 'ETMAHC02020298', 'MAHAVORY ', 'Chantia', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(99, 'ADS0706	', 'ETRAHM02020299', 'RAHARIDERA ', 'Mialitiana Nirintsoa', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(100, 'ADS0707	', 'ETRAKS020202100', 'RAKOTOMALALA ', 'Sophie Cynthia', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(101, 'ADS0708	', 'ETRAKM020202101', 'RAKOTONDRAZAKA ', 'Miora Sarobidy', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(102, 'ADS0709	', 'ETRAKA020202102', 'RAKOTORAHALAHY ', 'Anja Valisoa', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(103, 'ADS0710	', 'ETRAKA020202103', 'RAKOTOSON', 'Aina Nirina Navalona', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(104, 'ADS0711	', 'ETRAMN020202104', 'RAMANANTENASOA ', 'Nandrianina', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(105, 'ADS0712	', 'ETRAMN020202105', 'RAMAROMANANA LAHATRA ', 'Nomen’ny Avo Diary', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(106, 'ADS0713	', 'ETRAMJ020202106', 'RAMIARA NIRINA MARIE ', 'Julia Hana', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(107, 'ADS0714	', 'ETRANA020202107', 'RANAIVO ', 'Antenaina Sergio', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(108, 'ADS0715	', 'ETRANS020202108', 'RANDRIAMANANA ', 'Sitraka Fandresena Gael', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(109, 'ADS0716	', 'ETRANT020202109', 'RANDRIANILANA ', 'Tahina Christian', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(110, 'ADS0717	', 'ETRAVN020202110', 'RAVALOSAONA', 'Ny Ambinintsoa Tsiory', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(111, 'ADS0718	', 'ETRAZH020202111', 'RAZAFIMAMONJY ', 'Helisoa Elysa', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(112, 'ADS0719	', 'ETRAZM020202112', 'RAZAFIMANDIMBY ', 'Mandresy Ismaël', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(113, 'ADS0720	', 'ETRAZN020202113', 'RAZAFINARIVO ', 'Narindra Isabelle', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(114, 'ADS0721	', 'ETSOLT020202114', 'SOLOHARIZAKA ', 'Tahina Beniti', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(115, 'ADS0722	', 'ETTOLX020202115', 'TOLONJANAHARY ', 'Xavier NKhonrathe', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(116, 'ADS0723	', 'ETVELG020202116', 'VELONTRASINA ', 'Gazi', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 0, NULL),
(117, 'ADS0723	', 'ETVELG020202117', 'VELONTRASINA ', 'Gazi', '2002-02-02', '', '', '0000', 3, 2, 2, 1, 0, 1, NULL),
(118, 'AS01428	', 'ETANDR020202118', 'ANDRIAMIHAJA ', 'Rojotiana Seraphine', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(119, 'AS01429	', 'ETANDN020202119', 'ANDRIANASOLONIAINA', 'Narindra Finaritra', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(120, 'AS01430	', 'ETANJF020202120', 'ANJARAMAMINAMPIONONA ', 'Fitahiana', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(121, 'AS01431	', 'ETBODN020202121', 'BODOARIMANANA ', 'Nomena Teachia', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(122, 'AS01432	', 'ETHENA020202122', 'HENINTSOA ', 'Ange Marie Rose', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(123, 'AS01433	', 'ETRAHB020202123', 'RAHARIMALALA', 'Bakolinirina Fabienne', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(124, 'AS01434	', 'ETRAHM020202124', 'RAHARINIRAINY ', 'Miangalisoa', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(125, 'AS01435	', 'ETRAHN020202125', 'RAHARISOA SAMBATRA ', 'Nirina Brun Là', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(126, 'AS01436	', 'ETRAHH020202126', 'RAHARISON ', 'Haingomalala Placide', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(127, 'AS01437	', 'ETRAHM020202127', 'RAHELIARISOA', 'Marie Jean Brigitte', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(128, 'AS01438	', 'ETRAHV020202128', 'RAHELIARISOA ', 'Volatiana Nambinina Irène', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(129, 'AS01439	', 'ETRAHT020202129', 'RAHERINIAINA ', 'Tsiky Natacha', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(130, 'AS01440	', 'ETRAJR020202130', 'RAJAONARIVELO', 'Riantsoa Joelle', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(131, 'AS01441	', 'ETRAKD020202131', 'RAKOTOARIMINO', 'Derasoa Marie Françoise', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(132, 'AS01442	', 'ETRAKP020202132', 'RAKOTOARISOA ', 'Patricia', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(133, 'AS01443	', 'ETRAKH020202133', 'RAKOTOARISOLO ', 'Hasinjaka Sylvia', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(134, 'AS01408	', 'ETRAKN020202134', 'RAKOTOARISON ', 'Nomenjanahary Henri', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(135, 'AS01444	', 'ETRAKS020202135', 'RAKOTOMALALA ', 'Sandy Lucette', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(136, 'AS01445	', 'ETRAKH020202136', 'RAKOTONDRASOA ', 'Hasiniaina Jessica Annah', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(137, 'AS01446	', 'ETRAKF020202137', 'RAKOTONIRINA ', 'Finoana Mampiandra', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(138, 'AS01447	', 'ETRALM020202138', 'RALANTOHASIMBOLA ', 'Miora', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(139, 'AS01448	', 'ETRANA020202139', 'RANDRIANARISOA', 'Anjara Narindra Seraphine', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(140, 'AS01449	', 'ETRASH020202140', 'RASAMINDISA ', 'Harenasoa ', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(141, 'AS01450	', 'ETRASV020202141', 'RASENDRASOA ', 'Velomanandaza Roseline Marie Lydie', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(142, 'AS01451	', 'ETRASH020202142', 'RASOAFARA ', 'Hantanirina Antoinette', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(143, 'AS01452	', 'ETRASM020202143', 'RASOARIMALALA ', 'Marie  Bernadette', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(144, 'AS01453	', 'ETRASP020202144', 'RASOARIMANDIMBY HENRIETTE ', 'Paul Larissia ', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(145, 'AS01454	', 'ETRASN020202145', 'RASOARIMIHAJA ', 'Nantenaina Henintsoa', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(146, 'AS01455	', 'ETRASM020202146', 'RASOAZANANY', 'Mahenintsoa Rianah', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(147, 'AS01456	', 'ETRASJ020202147', 'RASOLOFOHERINDRAINY ', 'Jaona  Victoria', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(148, 'AS01457	', 'ETRATR020202148', 'RATSIFA ', 'Raymonde Cynthia', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(149, 'AS01458	', 'ETRAVR020202149', 'RAVELOARISOA ', 'Rojo Sarobidy Balbine', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(150, 'AS01459	', 'ETRAVR020202150', 'RAVELONJANAHARY', 'Riantsoa Tsiory Victoria', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(151, 'AS01460	', 'ETRAVH020202151', 'RAVOARISOA ', 'Hajanirina Edina', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(152, 'AS01461	', 'ETRAVL020202152', 'RAVONIARISOA ', 'Lalatiana Henriette', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(153, 'AS01462	', 'ETRAZK020202153', 'RAZAFIARIMALALA ', 'Kanto Sylvia Cynthia', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(154, 'AS01463	', 'ETRAZM020202154', 'RAZAFIARIMANANA ', 'Mialisolo Patricia Marie Mélanie', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(155, 'AS01464	', 'ETRAZV020202155', 'RAZAFIARISOA ', 'Victorine', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(156, 'AS01465	', 'ETRAZC020202156', 'RAZAFIMAHEFA ', 'Chayah Wolfgang', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(157, 'AS01466	', 'ETRAZV020202157', 'RAZAFIMAMITIANA ', 'Viollà', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(158, 'AS01467	', 'ETRAZS020202158', 'RAZAFINANDRIANA ', 'Salohy', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(159, 'AS01468	', 'ETRAZM020202159', 'RAZAFINDRAIBE ', 'Miantsa Fifaliana', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(160, 'AS01469	', 'ETVOLI020202160', 'VOLOLONIAINA ', 'Izainatolony Isaotrazy', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(161, 'AS01470	', 'ETVOLM020202161', 'VOLOLONIRINA ', 'Marie Sentia', '2002-02-02', '', '', '0000', 2, 2, 2, 1, 0, 0, NULL),
(162, 'ES0348	', 'ETAINT020202162', 'AINA NOMENJANAHARY ', 'Tahiana Eliah', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(163, 'ES0349	', 'ETANDM020202163', 'ANDRIAMANANTENASOA ', 'Mitia Norohasina', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(164, 'ES0350	', 'ETANDK020202164', 'ANDRIANARIJAONA MIRADOMALALA', 'Kevin Maherina', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(165, 'ES0351	', 'ETANDJ020202165', 'ANDRIANIRINA ', 'Jean Aimé', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(166, 'ES0352	', 'ETANDF020202166', 'ANDRIANORO ', 'Fitia', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(167, 'ES0353	', 'ETFARN020202167', 'FARALAHY ', 'Norova', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(168, 'ES0354	', 'ETRAFH020202168', 'RAFIDIARIJEMISA ', 'Handoarilala Miangaly', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(169, 'ES0355	', 'ETRAHH020202169', 'RAHARIMANANA ', 'Hanitriniaina Hermine', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(170, 'ES0356	', 'ETRAKN020202170', 'RAKOTOBE ', 'Nirinalisoa Karnelia', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(171, 'ES0357	', 'ETRAMZ020202171', 'RAMAROLAHY ', 'Zoara Leslie', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(172, 'ES0358	', 'ETRANT020202172', 'RANAIVOARIMANANA ', 'Tokitina Fandresena', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(173, 'ES0359	', 'ETRANT020202173', 'RANDRIANAMBININA ', 'Théodore', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(174, 'ES0360	', 'ETRASF020202174', 'RASOANAIVO MANAMPISOA ', 'Faramalala Ny Aina', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(175, 'ES0361	', 'ETRASM020202175', 'RASOLOFOMANDIMBY ', 'Manalintsoa Sahaza', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(176, 'ES0362	', 'ETRATR020202176', 'RATSIMBAZAFY ', 'Raitra Tiavina', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(177, 'ES0363	', 'ETRAVF020202177', 'RAVELOARIMANANA ', 'Finaritra Lilie Olivianne', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(178, 'ES0364	', 'ETRAZN020202178', 'RAZAFIMANDIMBY ', 'Noroniaina Amina', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(179, 'ES0365	', 'ETSAMK020202179', 'SAMIHARY ', 'Keith Leenhouts Florida', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(180, 'ES0366	', 'ETTAHP020202180', 'TAHINJANAHARY ', 'Pierre Thomasien', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(181, 'ES0367	', 'ETTAVJ020202181', 'TAVOUKOU ', 'Javaning Proker', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(182, 'ES0368	', 'ETTOLH020202182', 'TOLOJANAHARY', 'Hery Dominique', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(183, 'ES0369	', 'ETTSAC020202183', 'TSANTANIRINA LOVASOA ', 'Casimira ', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 0, NULL),
(184, 'ES0369	', 'ETTSAC020202184', 'TSANTANIRINA LOVASOA ', 'Casimira ', '2002-02-02', '', '', '0000', 4, 2, 2, 1, 0, 1, NULL),
(185, 'ADS0618	', 'ETRAOF030303185', 'RAONJAHARISOA', 'Faramalala', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(186, 'ADS0640	', 'ETANDF030303186', 'ANDRIAMIRANTOVALISOA ', 'Fitahiana Ella Sophie', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(187, 'ADS0641	', 'ETBOTT030303187', 'BOTONIRINA ', 'Tozinantenaina André', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(188, 'ADS0642	', 'ETFELW030303188', 'FELIX  ', 'Wilfred Nicolin Lemiel', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(189, 'ADS0643	', 'ETFETR030303189', 'FETIANDRIANJAFY ', 'Raymond', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(190, 'ADS0644	', 'ETLEMM030303190', 'LEMAHERINIAINA ', 'Mbolatiana', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(191, 'ADS0645	', 'ETMAHH030303191', 'MAHARAVO', 'Haritiana Mariella', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(192, 'ADS0646	', 'ETRAFR030303192', 'RAFANOMEZANJANAHARY ', 'Radosoa', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(193, 'ADS0647	', 'ETRAHN030303193', 'RAHELIMBOLOINA ', 'Nofy Rova Dimbiniala', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(194, 'ADS0648	', 'ETRAKS030303194', 'RAKOTOARIMALALA ', 'Safidy Manantsoa', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(195, 'ADS0649	', 'ETRAKR030303195', 'RAKOTONDRAINIBE  ', 'Romule Angelo', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(196, 'ADS0651	', 'ETRAMS030303196', 'RAMBOLAMANANTIANA ', 'Sylvie Claudine', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(197, 'ADS0652	', 'ETRANA030303197', 'RANDRIAMIALISOA ', 'Andoniaina Noeline', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(198, 'ADS0653	', 'ETRANO030303198', 'RANDRIANANTENAINA ', 'Olia Caela', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(199, 'ADS0654	', 'ETRANG030303199', 'RANDRIANTEFY ', 'Girèsse Adolphe', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(200, 'ADS0655	', 'ETRASR030303200', 'RASAMOELSON  ', 'Rovaniaina Ismael', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(201, 'ADS0656	', 'ETRAST030303201', 'RASOLOMANANA ', 'Tojonirina Miando Luc Thierry', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(202, 'ADS0657	', 'ETRATE030303202', 'RATSIMBAZAFY ', 'Ernesto Elie', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(203, 'ADS0658	', 'ETRONC030303203', 'RONALDIA ', 'Couesnon Maximilienne', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(204, 'ADS0660	', 'ETTOVA030303204', 'TOVONIRINA ', 'Aina Finaritra', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(205, 'ADS0661	', 'ETVAOI030303205', 'VAOMALANDY', 'Irène Andréas', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(206, 'ADS0572', 'ETANDN030303206', 'ANDRIAMIHARISOA ', 'Ny Riambentso Onenantsoa ', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(207, 'ADS0624', 'ETRAZB030303207', 'RAZAFIARILALARISON ', 'Baovalisoa', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(208, 'ADS0624', 'ETRAZB030303208', 'RAZAFIARILALARISON ', 'Baovalisoa', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 1, NULL),
(209, 'ADS0662', 'ETANDI030303209', 'ANDRIANTSOA ', 'Ianjamirenty Alpha', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(210, 'ADS0662', 'ETANDI030303210', 'ANDRIANTSOA ', 'Ianjamirenty Alpha', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 1, NULL),
(211, 'ADS0663', 'ETBOTL030303211', 'BOTOVAO ', 'Landry', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(212, 'ADS0664', 'ETFIDN030303212', 'FIDINTSOA ', 'Nantenaina', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(213, 'ADS0665', 'ETHERR030303213', 'HERIMAMPIONONA ', 'Remi Prédon', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(214, 'ADS0666', 'ETMANS030303214', 'MANAMPISOA ', 'Sederanirina Armandine', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(215, 'ADS0667', 'ETRAHV030303215', 'RAHANITRINIAINA', 'Volatiana Seheno', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(216, 'ADS0668', 'ETRAKJ030303216', 'RAKOTONINDRINA ', 'Joachin', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(217, 'ADS0670', 'ETRAMA030303217', 'RAMBOAMIHARINTSOA ', 'Andrianandrainarivo Koloina', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(218, 'ADS0671', 'ETRANE030303218', 'RANDRIAMANANTENA ', 'Espenol', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(219, 'ADS0672', 'ETRANM030303219', 'RANDRIANARIVELO ', 'Mandresy Fenohasina', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(220, 'ADS0673', 'ETRANL030303220', 'RANOMBOLA ', 'Lantomalala Nicole', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(221, 'ADS0674', 'ETRASD030303221', 'RASOANANDRIANINA ', 'Dina Haripana', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(222, 'ADS0675', 'ETRASM030303222', 'RASOAVELONIRINA ', 'Mamisoa Sylvia', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(223, 'ADS0676', 'ETRATS030303223', 'RATEFIARISON ', 'Santar’Haingo Nomentsoa ', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(224, 'ADS0678', 'ETRAVM030303224', 'RAVAOSOLO ', 'Marie Angèle', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(225, 'ADS0679', 'ETRAZN030303225', 'RAZAFINDRAKOTO  ', 'Nambinintsoa Abel', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(226, 'ADS0680', 'ETRAZH030303226', 'RAZAFINDRAKOTO', 'Herimalala Nambinintsoa Eveline', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(227, 'ADS0681', 'ETRIVN030303227', 'RIVOMANIRY ', 'Nisa Fihobiana', '2003-03-03', '', '', '0000', 3, 3, 2, 1, 0, 0, NULL),
(228, 'AS01366	', 'ETANDN030303228', 'ANDRIANIAINA ', 'Nekena Heriniavo', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(229, 'AS01367	', 'ETBAKN030303229', 'BAKOLIMALALA ', 'Nadia Eulalie', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(230, 'AS01368	', 'ETFANH030303230', 'FANJANIRINA ', 'Haingondrainy Victoire Antonie', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(231, 'AS01369	', 'ETFANM030303231', 'FANOMEZANJANAHARY ', 'Marthe Léontine', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(232, 'AS01371	', 'ETHARR030303232', 'HARINTSOA', 'Ravo Mampionona', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(233, 'AS01372	', 'ETIHAT030303233', 'IHARIMALALA ', 'Tiana Marie Anna', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(234, 'AS01373	', 'ETLONG030303234', 'LONGE', '', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(235, 'AS01374	', 'ETRAHH030303235', 'RAHOLINIAINA ', 'Henintsoa Marie Josephine', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(236, 'AS01375	', 'ETRAJM030303236', 'RAJARISON ', 'Miora Nantenaina Julia', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(237, 'AS01376	', 'ETRAKS030303237', 'RAKOTOMALALA ', 'Solofoniaina Sarobidy', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(238, 'AS01378	', 'ETRAKF030303238', 'RAKOTONARIVO ', 'Famenontsoa Nasandratra', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(239, 'AS01379	', 'ETRAKA030303239', 'RAKOTONIAINA ', 'Annie Stella', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(240, 'AS01380', 'ETRAKT030303240', 'RAKOTOVAO ', 'Toky Mark', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(241, 'AS01381	', 'ETRAMR030303241', 'RAMAMONJY ', 'Ravakiniaina Alisoa', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(242, 'AS01382	', 'ETRAMF030303242', 'RAMBOLANAVALONA ', 'Faliah', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(243, 'AS01383	', 'ETRANM030303243', 'RANDRIARIMAMONJY ', 'Manuelah Myriame', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(244, 'AS01384	', 'ETRANZ030303244', 'RANDRIAMANANA ', 'Zo Tantely', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(245, 'AS01385	', 'ETRANF030303245', 'RANDRIAMANANTENASOA ', 'Fitahiana  Henintsoa ', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(246, 'AS01386	', 'ETRASF030303246', 'RASANDRATRINIAVO ', 'Faly', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(247, 'AS01387	', 'ETRAVN030303247', 'RAVAOARISOA ', 'Nomenjanahary Zinah', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(248, 'AS01388	', 'ETRAVB030303248', 'RAVELOARIMANANA ', 'Bryana Virginie', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(249, 'AS01389	', 'ETRAVN030303249', 'RAVOLAHARINIAINA  ', 'Nomenjanahary Sambatra', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(250, 'AS01390	', 'ETRAZT030303250', 'RAZAFIMANANTSOA  ', 'Tiavina Fanambinana', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(251, 'AS01391	', 'ETRAZR030303251', 'RAZAFINDRATOVO ', 'Rocine', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(252, 'AS01392	', 'ETRAZM030303252', 'RAZAFINIMBONANA ', 'Marie Perlette', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(253, 'AS01393	', 'ETSAHS030303253', 'SAHALA ', 'Sabrina Nancy', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(254, 'AS01394	', 'ETSARN030303254', 'SARAH FARANIAINA ', 'Nenisoa', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(255, 'AS01395	', 'ETTANN030303255', 'TANTELINIRINA ', 'Nambinintsoa Fitia', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(256, 'AS01396	', 'ETVONE030303256', 'VONINTSARA ', 'Elsa', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(257, 'AS01355	', 'ETRANF030303257', 'RANDRIAMIONISOA ', 'Felanirina', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(258, 'AS01397	', 'ETANDA030303258', 'ANDRIAMITANA ', 'Aina Faniry', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(259, 'AS01398	', 'ETBAKM030303259', 'BAKOLIARIVELO ', 'Mamitiana Rochelle', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(260, 'AS01399	', 'ETBELK030303260', 'BELALAHY PAULIN ', 'Karrel', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(261, 'AS01400	', 'ETMAHM030303261', 'MAHARAMBY  ', 'Michel Jackson Ulrich', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(262, 'AS01402	', 'ETRADA030303262', 'RADALIZAFY ', 'Augustina  Lycardhiucia', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(263, 'AS01403	', 'ETRAEH030303263', 'RAELISOA ', 'Henintsoa Géneviève', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(264, 'AS01404	', 'ETRAFF030303264', 'RAFALIMANANA ', 'Florette', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(265, 'AS01406	', 'ETRAHM030303265', 'RAHARIMALALA ', 'Miora Nirina', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(266, 'AS01407	', 'ETRAHM030303266', 'RAHOENINTSOA ', 'Marie Eliane', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(267, 'AS01409	', 'ETRAKA030303267', 'RAKOTOHARISOA ', 'Antsa Herizo', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(268, 'AS01410	', 'ETRAKN030303268', 'RAKOTONARIVO ', 'Nomentsoa Lova Joël', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(269, 'AS01411	', 'ETRAKF030303269', 'RAKOTONDRAMIADANA ', 'Finoanamihaja Mickaela', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(270, 'AS01412	', 'ETRAKS030303270', 'RAKOTOVAO ', 'Sariaka Angela', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(271, 'AS01412	', 'ETRAKS030303271', 'RAKOTOVAO ', 'Sariaka Angela', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 1, NULL),
(272, 'AS01413	', 'ETRAMF030303272', 'RAMANAMIRIJA ', 'Fy Ny Anjara Mandaharivola', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(273, 'AS01414	', 'ETRAMM030303273', 'RAMAROLAHY ', 'Marie Benjamine', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(274, 'AS01415	', 'ETRANS030303274', 'RANDRIAMANANA ', 'Safidiniaina Fanambinantsoa', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(275, 'AS01416	', 'ETRANN030303275', 'RANDRIAMPARANY ', 'Narindra Charly', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(276, 'AS01417	', 'ETRANH030303276', 'RANDRIARISOA ', 'Heriniaina Miholy Nambinina', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(277, 'AS01419	', 'ETRASH030303277', 'RASALAMANIRINA ', 'Hanitriniaina Léa Charline', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(278, 'AS01420	', 'ETRASF030303278', 'RASAMIMANANA RAKOTOARIVONY', 'Faniry Navaly', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(279, 'AS01421	', 'ETRAST030303279', 'RASOAVOLOLONA ', 'Tiana Sarah', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(280, 'AS01422	', 'ETRAVM030303280', 'RAVELOSON ', 'Malalatiana Mirasoa Nancia', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(281, 'AS01423	', 'ETRAVV030303281', 'RAVOLAHANTA ', 'Vohangy Benedicte Marie Julien', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(282, 'AS01424', 'ETRAZH030303282', 'RAZAFIARIVELO ', 'Holy Eliane', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(283, 'AS01425	', 'ETRAZJ030303283', 'RAZAFIMANDIMBY ', 'Jean Félicien Urbain', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(284, 'AS01426	', 'ETRAZM030303284', 'RAZANABAO ', 'Marie Anna', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(285, 'AS01427	', 'ETVOLS030303285', 'VOLOLONIRINA ', 'Solotina', '2003-03-03', '', '', '0000', 2, 3, 2, 1, 0, 0, NULL),
(286, 'ES0324	', 'ETANDN030303286', 'ANDRIAMAMPANDRY ', 'Nirianambinina  Antonella', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(287, 'ES0325	', 'ETANDV030303287', 'ANDRIAMANIRY ', 'Voar’Augustin', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(288, 'ES0326	', 'ETANDT030303288', 'ANDRIAMITANTSOA ', 'Tokiniaina Jacky', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(289, 'ES0327	', 'ETANDN030303289', 'ANDRIANOMENJANAHARY ', 'Ny Ony Mireille Jimmy', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(290, 'ES0328	', 'ETMBAN030303290', 'MBAFOUMOU ', 'Nahidà', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(291, 'ES0329	', 'ETMAHM030303291', 'MAHEFANIAINA ', 'Mamisoa Annick', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(292, 'ES0330	', 'ETMASD030303292', 'MASINOFINIDY ', 'Dimbiniala ', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(293, 'ES0331	', 'ETNJAR030303293', 'NJARANIAINA ', 'Raissa', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(294, 'ES0332	', 'ETNOMP030303294', 'NOMENJANAHARY ', 'Pascaline', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(295, 'ES0333	', 'ETRAFT030303295', 'RAFALIARISOA ', 'Tsiriniaina', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(296, 'ES0334	', 'ETRAFF030303296', 'RAFANOMEZANTSOA ', 'Fidèle  ', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(297, 'ES0335	', 'ETRAHM030303297', 'RAHARITIANA ', 'Malala Nantenaina Clara', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(298, 'ES0336	', 'ETRAKH030303298', 'RAKOTOARIVELO ', 'Hasiniony Anja Henintsoa ', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(299, 'ES0337	', 'ETRAKN030303299', 'RAKOTOMALALA ', 'Notahiana Tinah Alyda', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(300, 'ES0338	', 'ETRAKN030303300', 'RAKOTONIAINA ', 'Nomenjanahary Alphonse Romuald', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(301, 'ES0339	', 'ETRAMN030303301', 'RAMAROZATOVO ', 'Nomena Lalaina ', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(302, 'ES0340	', 'ETRANN030303302', 'RANAIVOSON  ', 'Ny Aina Fabiola Casthie ', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(303, 'ES0347	', 'ETRASB030303303', 'RASOAMAZAVA ', 'Berthine', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(304, 'ES0341	', 'ETRASV030303304', 'RASOANAIVO', 'Vahatriniaina Ravaka Laurent ', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(305, 'ES0342	', 'ETRASE030303305', 'RASOASY ', 'Emmelie', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(306, 'ES0343	', 'ETRAZE030303306', 'RAZAFINIRINA ', 'Elysa', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(307, 'ES0344	', 'ETTAFJ030303307', 'TAFARASOA ', 'Jean ', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(308, 'ES0345	', 'ETTAHE030303308', 'TAHIRISOA ', 'Edverinas', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(309, 'ES0346	', 'ETTOVH030303309', 'TOVONTSOA  ', 'Hanitranirina Marie Mitia', '2003-03-03', '', '', '0000', 4, 3, 2, 1, 0, 0, NULL),
(310, 'M100309	', 'ETANDH040404310', 'ANDRIANALITIANARIVELO', 'Hery Tafitasoa Jean ', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(311, 'M100310	', 'ETANDM040404311', 'ANDRIANIRINA ', 'Miora Malala', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(312, 'M100311	', 'ETFANC040404312', 'FANORENA ', 'Christine Tiaray', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(313, 'M100312	', 'ETHERF040404313', 'HERIMAHEFASOA ', 'Faliniriana  Baliaka', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(314, 'M100313	', 'ETMAHN040404314', 'MAHASOA ', 'Niandriniaina Filémon', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(315, 'M100314', 'ETMAHJ040404315', 'MAHAVILAZA ', 'Jean Bert Bertrand ', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(316, 'M100315	', 'ETMAHJ040404316', 'MAHAZARA ', 'Jean Jacques Jacquinot', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(317, 'M100316	', 'ETMIHM040404317', 'MIHARIARIMALALA ANDRIANARIVONY', 'Mihaja', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(318, 'M100317	', 'ETRAMM040404318', 'RAMBININTSOA  ', 'Mbolatiana Harivony', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(319, 'M100318	', 'ETRAHF040404319', 'RAHAINGOMAHEFA RAKOTONDRASOA ', 'Finoana', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(320, 'M100319	', 'ETRAHV040404320', 'RAHARINJATOVOMANANJARA ', 'Vonintsoa Mbolatian', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(321, 'M100320	', 'ETRAHN040404321', 'RAHARINIRINA  ', 'Nini', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(322, 'M100321	', 'ETRAKF040404322', 'RAKOTOARIVONY ', 'Fenosoa Tanjona Robert', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(323, 'M100322	', 'ETRAKM040404323', 'RAKOTONDRAMANITRA ', 'Mamy Harena Maherimanana', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(324, 'M100323	', 'ETRAKS040404324', 'RAKOTOVOAHANGY ', 'Serge Frederic', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(325, 'M100324	', 'ETRAKF040404325', 'RAKOTOVAO ', 'Fifaliana Manou', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(326, 'M100325	', 'ETRAMP040404326', 'RAMAHAFADRAHONA ', 'Prisca Lalaina', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(327, 'M100326	', 'ETRANL040404327', 'RANDRIAMIHAJA  ', 'LOUIS DE GONZAGUE', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(328, 'M100327	', 'ETRANA040404328', 'RANDRIANARIJAONA ', 'Albert Didier', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(329, 'M100328	', 'ETRANT040404329', 'RANDRIANIRINA ', 'Tolojanahary', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(330, 'M100329	', 'ETRASN040404330', 'RASOLONANDRAINA ', 'Noel Marie Armel', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(331, 'M100330	', 'ETRAVR040404331', 'RAVOSON ', 'RINDRA AMBININTSOA', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(332, 'M100331	', 'ETRAZS040404332', 'RAZAFIMANDIMBY ', 'Seraphin', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(333, 'M100332	', 'ETRAZN040404333', 'RAZAFIMANANTSOA DIMBY ', 'Narindra Robison', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(334, 'M100333	', 'ETRAZM040404334', 'RAZAFINDRAVALO ', 'Mifaly Aina', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(335, 'M100334	', 'ETRAZM040404335', 'RAZAFINATOLOJANAHARY ', 'Mirana Tsylavina  ', '2004-04-04', '', '', '0000', 5, 4, 2, 1, 0, 0, NULL),
(336, 'M200146	', 'ETANDS050505336', 'ANDRIAMAHEFA ', 'Sarindra Harisoa', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(337, 'M200147	', 'ETHAIR050505337', 'HAINGONIRINA ', 'Razafimahateza ', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(338, 'M200148	', 'ETHANM050505338', 'HANTANIRINA ', 'Maholisoa Narindra', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(339, 'M200149	', 'ETRAHN050505339', 'RAHELIMAMPIANINA ', 'Narindra Volamanitra', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(340, 'M200150	', 'ETRAHV050505340', 'RAHERISON ', 'Vololomampionona Tambiniaina Nirina', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(341, 'M200151	', 'ETRAKM050505341', 'RAKOTOHARINANAHARY ', 'Miora Christelle', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(342, 'M200152	', 'ETRAKH050505342', 'RAKOTOLAHY ', 'Herilanja Ando Miharivola', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(343, 'M200153	', 'ETRATM050505343', 'RATOLOJANAHARY ', 'Mandimby Rina Olive Henintsoa', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(344, 'M200154	', 'ETRAZF050505344', 'RAZAFIMAHATRATRA ', 'Finoana Nandrianina', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(345, 'M200155	', 'ETRAZD050505345', 'RAZAFIMAHEFA ', 'Doris', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(346, 'M200156	', 'ETRAZM050505346', 'RAZAFINDRAKOTO ', 'Mirana Nathalie', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(347, 'M200157	', 'ETTAHZ050505347', 'TAHINA ', 'Zo Elysé', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(348, 'M200158	', 'ETTIAS050505348', 'TIAVINA RAKOTOSALAMA ', 'Salohy', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(349, 'M200159	', 'ETRAKH050505349', 'RAKOTONDRAFARA MANANIARIVO ', 'Hervé', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(350, 'M200160	', 'ETRAKI050505350', 'RAKOTOVAO ', 'Iarizo ', '2005-05-05', '', '', '0000', 5, 5, 2, 1, 0, 0, NULL),
(351, 'TC301', 'ETRAMS010101351', 'RAMANDROSOA', 'Sombiniaina Manoa', '2001-01-01', '', '', '0000', 7, 1, 2, 1, 0, 0, NULL),
(352, 'TC302', 'ETRAKF010101352', 'RAKOTONIAINA', 'Fanomenzatsoa Elison', '2001-01-01', '', '', '0000', 7, 1, 2, 1, 0, 0, NULL),
(353, 'TC303', 'ETRAZA010101353', 'RAZAFINDRALAMBO', 'Aina', '2001-01-01', '', '', '0000', 7, 3, 2, 1, 0, 0, NULL),
(354, 'TC304', 'ETANDP010101354', 'ANDRIAPARAZATO', 'Pierre Clower', '2001-01-01', '', '', '0000', 7, 1, 2, 1, 0, 0, NULL),
(355, 'TC305', 'ETVERF010101355', 'VEROMANITRA', 'Francklone', '2001-01-01', '', '', '0000', 7, 1, 2, 1, 0, 0, NULL),
(356, 'TC303', 'ETRAZA010101356', 'RAZAFINDRALAMBO', 'Aina', '2001-01-01', '', '', '0000', 7, 1, 2, 1, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `exam_choix`
--

DROP TABLE IF EXISTS `exam_choix`;
CREATE TABLE IF NOT EXISTS `exam_choix` (
  `idchoix` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `choix` text NOT NULL,
  `IDexam_question` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idchoix`),
  KEY `exam_question_question_choix` (`IDexam_question`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `exam_choix`
--

INSERT INTO `exam_choix` (`idchoix`, `choix`, `IDexam_question`) VALUES
(14, 'John', 15),
(15, 'Jonathan', 15),
(16, 'Africain', 16),
(17, 'Asiatique', 16),
(18, 'Americain', 16),
(19, 'sous-developpé', 16);

-- --------------------------------------------------------

--
-- Structure de la table `exam_etudiant`
--

DROP TABLE IF EXISTS `exam_etudiant`;
CREATE TABLE IF NOT EXISTS `exam_etudiant` (
  `IDexam_etudiant` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `IDEtudiant` bigint(20) DEFAULT NULL,
  `IDExam_titre` bigint(20) DEFAULT NULL,
  `note` float(4,2) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`IDexam_etudiant`),
  KEY `fk_etudiant_exam_etudiant` (`IDEtudiant`),
  KEY `fk_exam_titre_exam_etudiant` (`IDExam_titre`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `exam_etudiant`
--

INSERT INTO `exam_etudiant` (`IDexam_etudiant`, `IDEtudiant`, `IDExam_titre`, `note`) VALUES
(20, 1, 29, NULL),
(21, 2, 29, 12.00);

-- --------------------------------------------------------

--
-- Structure de la table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE IF NOT EXISTS `exam_question` (
  `IDexam_question` bigint(20) NOT NULL AUTO_INCREMENT,
  `IDexam_titre` bigint(20) DEFAULT '0',
  `Num_question` smallint(5) UNSIGNED DEFAULT '0',
  `Question` longtext,
  `Reponse` longtext,
  `idtype` int(1) UNSIGNED ZEROFILL DEFAULT NULL,
  PRIMARY KEY (`IDexam_question`),
  KEY `IDexam_titre` (`IDexam_titre`),
  KEY `fk_exam_question_question_type` (`idtype`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `exam_question`
--

INSERT INTO `exam_question` (`IDexam_question`, `IDexam_titre`, `Num_question`, `Question`, `Reponse`, `idtype`) VALUES
(14, 29, 1, 'My Name is\n', NULL, 1),
(15, 29, 2, 'Mon prénom est', NULL, 2),
(16, 29, 3, 'Madagascar est un pays', NULL, 3),
(18, 29, 4, 'Madagascar president', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `exam_reponse`
--

DROP TABLE IF EXISTS `exam_reponse`;
CREATE TABLE IF NOT EXISTS `exam_reponse` (
  `IDExam_question` bigint(20) DEFAULT NULL,
  `IDReponse` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idchoix` int(10) UNSIGNED DEFAULT NULL,
  `Reponse` text,
  `IDExam_etudiant` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`IDReponse`),
  KEY `fk_exam_question_exam_reponse` (`IDExam_question`),
  KEY `fk_exam_reponse_exam_choix` (`idchoix`),
  KEY `fk_exam_reponse_exam_etudiant` (`IDExam_etudiant`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `exam_reponse`
--

INSERT INTO `exam_reponse` (`IDExam_question`, `IDReponse`, `idchoix`, `Reponse`, `IDExam_etudiant`) VALUES
(14, 21, NULL, NULL, 20),
(18, 22, NULL, NULL, 20),
(14, 23, NULL, '\nLorem ipsum dolor sit amet consectetur adipisicing elit. Beatae a totam fuga fugiat vero delectus architecto blanditiis dignissimos eum accusamus provident quis, quam vel magni voluptatum doloremque quisquam repellendus eligendi.\nQuae suscipit reiciendis soluta ullam enim voluptatem deleniti dolores. Culpa porro commodi provident ea! Consequuntur odio iusto labore deserunt, dignissimos quisquam eius. Iste, exercitationem magnam. Officiis, aspernatur facilis. Minus, sequi.\nMaiores quia aspernatur impedit cum veritatis eaque, ea sunt adipisci? Sunt sint vero veniam excepturi natus alias unde quasi, voluptatem velit eum praesentium voluptatum nobis ratione, aliquam, delectus fugit odio.\nMaiores, soluta corporis. Unde quas mollitia officia laborum reiciendis, vero alias dicta tempora totam optio cum numquam officiis, non repellendus beatae! Ipsam iste reiciendis soluta alias quo est sed nesciunt?\nNam perspiciatis deserunt laboriosam nobis quasi reprehenderit ex commodi excepturi quae fugiat tempore pariatur totam ipsa sunt, nesciunt porro optio voluptatum. Ducimus rerum praesentium quo alias ratione ad, obcaecati modi?\nAd dolorum perferendis corporis inventore eaque rerum totam atque autem, aliquid consectetur necessitatibus quae dolor maiores at in cupiditate molestiae praesentium! Blanditiis earum tenetur ad sapiente laboriosam quisquam, perferendis quo?\nNecessitatibus ratione dolor, placeat repudiandae molestiae, assumenda saepe nesciunt asperiores illo magni sunt quia harum ea, delectus officia voluptatem error ex consequatur odit! Dicta asperiores quis ea delectus, illo modi.\nDolores, eaque fuga? Ab illum, maiores atque quam voluptatem aut autem ipsam molestiae adipisci nihil quod fugit excepturi tempora sunt inventore mollitia ut deleniti saepe debitis laudantium sapiente. Unde, facere.\nNobis nesciunt, a, nostrum quisquam, quasi animi quam ducimus deleniti beatae eveniet expedita tempore quibusdam ipsa dicta saepe ullam fugiat dolorem at sapiente praesentium assumenda aliquid? Voluptate quos quis ipsum!\nEum labore maiores natus nulla sit aut soluta recusandae perferendis sunt veniam blanditiis ipsum quod nemo debitis, in explicabo beatae fuga officia libero numquam molestiae! Dicta, blanditiis? Molestiae, consequuntur illo?\nQuae velit, magni, tenetur incidunt alias cum provident exercitationem ducimus magnam corrupti pariatur, delectus dolor illum eos. Inventore dolor commodi consequuntur quam, est itaque. Optio minus ad numquam. Ad, tempora?\nFugit consequatur molestias unde tenetur facilis veniam officiis temporibus dignissimos quisquam voluptatem hic eum rerum nemo non quam est blanditiis doloribus, praesentium iure consequuntur? Quisquam impedit repellat aspernatur cumque quo!\nNulla quam similique officia consequatur repellat, dicta aspernatur totam maiores, doloremque pariatur magni dolor excepturi veritatis alias vero impedit! Voluptatem sunt quisquam, unde repellat sint sit quibusdam nam quae similique.\nQuasi commodi iusto labore temporibus harum illum id beatae aperiam, alias quibusdam impedit eligendi perferendis tempora deleniti numquam quis minima debitis est fugit sit? Consectetur maiores aperiam sequi iusto architecto!\nAtque culpa incidunt expedita corrupti illum, animi rem. Dolorem minima quis necessitatibus error quas eaque consequuntur amet suscipit deserunt, soluta accusantium nulla itaque, est at sit vitae laboriosam dolores. Voluptatum?\nLabore id quos atque natus consequatur eveniet, quasi quas porro illo sunt, exercitationem odit pariatur ex iste ratione ipsa ab at culpa saepe minus molestias. Unde, natus. Expedita, cupiditate numquam!\nSed at laudantium qui autem ad dolores dolor amet, nihil accusamus aliquid reprehenderit optio perspiciatis quia fugit quo. Temporibus minima architecto saepe odit dicta molestiae vitae voluptatem perspiciatis nemo aspernatur.\nEligendi amet tenetur unde aperiam molestiae minima pariatur earum? Distinctio vero, accusantium repellat veniam repellendus doloribus vel asperiores deleniti optio tempore, et illum! Optio impedit distinctio, facilis tenetur dolorum totam.\nQuod quos repellat sint magnam quasi odio eaque quam quo. Aliquam, perspiciatis ut! Voluptatibus similique placeat nemo soluta id facere, in impedit, sunt hic totam laboriosam, ea illum? Voluptatum, placeat!\nError nesciunt omnis, et iste laboriosam eaque mollitia laudantium adipisci neque harum. Molestias, exercitationem cum laborum porro dolor, neque eveniet ex consectetur hic expedita eos laboriosam minus numquam nemo similique.', 21),
(15, 24, 15, NULL, 21),
(16, 25, 16, NULL, 21),
(16, 26, 19, NULL, 21),
(18, 27, NULL, '\nLorem ipsum dolor sit amet consectetur adipisicing elit. Beatae a totam fuga fugiat vero delectus architecto blanditiis dignissimos eum accusamus provident quis, quam vel magni voluptatum doloremque quisquam repellendus eligendi.\nQuae suscipit reiciendis soluta ullam enim voluptatem deleniti dolores. Culpa porro commodi provident ea! Consequuntur odio iusto labore deserunt, dignissimos quisquam eius. Iste, exercitationem magnam. Officiis, aspernatur facilis. Minus, sequi.\nMaiores quia aspernatur impedit cum veritatis eaque, ea sunt adipisci? Sunt sint vero veniam excepturi natus alias unde quasi, voluptatem velit eum praesentium voluptatum nobis ratione, aliquam, delectus fugit odio.\nMaiores, soluta corporis. Unde quas mollitia officia laborum reiciendis, vero alias dicta tempora totam optio cum numquam officiis, non repellendus beatae! Ipsam iste reiciendis soluta alias quo est sed nesciunt?\nNam perspiciatis deserunt laboriosam nobis quasi reprehenderit ex commodi excepturi quae fugiat tempore pariatur totam ipsa sunt, nesciunt porro optio voluptatum. Ducimus rerum praesentium quo alias ratione ad, obcaecati modi?\nAd dolorum perferendis corporis inventore eaque rerum totam atque autem, aliquid consectetur necessitatibus quae dolor maiores at in cupiditate molestiae praesentium! Blanditiis earum tenetur ad sapiente laboriosam quisquam, perferendis quo?\nNecessitatibus ratione dolor, placeat repudiandae molestiae, assumenda saepe nesciunt asperiores illo magni sunt quia harum ea, delectus officia voluptatem error ex consequatur odit! Dicta asperiores quis ea delectus, illo modi.\nDolores, eaque fuga? Ab illum, maiores atque quam voluptatem aut autem ipsam molestiae adipisci nihil quod fugit excepturi tempora sunt inventore mollitia ut deleniti saepe debitis laudantium sapiente. Unde, facere.\nNobis nesciunt, a, nostrum quisquam, quasi animi quam ducimus deleniti beatae eveniet expedita tempore quibusdam ipsa dicta saepe ullam fugiat dolorem at sapiente praesentium assumenda aliquid? Voluptate quos quis ipsum!\nEum labore maiores natus nulla sit aut soluta recusandae perferendis sunt veniam blanditiis ipsum quod nemo debitis, in explicabo beatae fuga officia libero numquam molestiae! Dicta, blanditiis? Molestiae, consequuntur illo?\nQuae velit, magni, tenetur incidunt alias cum provident exercitationem ducimus magnam corrupti pariatur, delectus dolor illum eos. Inventore dolor commodi consequuntur quam, est itaque. Optio minus ad numquam. Ad, tempora?\nFugit consequatur molestias unde tenetur facilis veniam officiis temporibus dignissimos quisquam voluptatem hic eum rerum nemo non quam est blanditiis doloribus, praesentium iure consequuntur? Quisquam impedit repellat aspernatur cumque quo!\nNulla quam similique officia consequatur repellat, dicta aspernatur totam maiores, doloremque pariatur magni dolor excepturi veritatis alias vero impedit! Voluptatem sunt quisquam, unde repellat sint sit quibusdam nam quae similique.\nQuasi commodi iusto labore temporibus harum illum id beatae aperiam, alias quibusdam impedit eligendi perferendis tempora deleniti numquam quis minima debitis est fugit sit? Consectetur maiores aperiam sequi iusto architecto!\nAtque culpa incidunt expedita corrupti illum, animi rem. Dolorem minima quis necessitatibus error quas eaque consequuntur amet suscipit deserunt, soluta accusantium nulla itaque, est at sit vitae laboriosam dolores. Voluptatum?\nLabore id quos atque natus consequatur eveniet, quasi quas porro illo sunt, exercitationem odit pariatur ex iste ratione ipsa ab at culpa saepe minus molestias. Unde, natus. Expedita, cupiditate numquam!\nSed at laudantium qui autem ad dolores dolor amet, nihil accusamus aliquid reprehenderit optio perspiciatis quia fugit quo. Temporibus minima architecto saepe odit dicta molestiae vitae voluptatem perspiciatis nemo aspernatur.\nEligendi amet tenetur unde aperiam molestiae minima pariatur earum? Distinctio vero, accusantium repellat veniam repellendus doloribus vel asperiores deleniti optio tempore, et illum! Optio impedit distinctio, facilis tenetur dolorum totam.\nQuod quos repellat sint magnam quasi odio eaque quam quo. Aliquam, perspiciatis ut! Voluptatibus similique placeat nemo soluta id facere, in impedit, sunt hic totam laboriosam, ea illum? Voluptatum, placeat!\nError nesciunt omnis, et iste laboriosam eaque mollitia laudantium adipisci neque harum. Molestias, exercitationem cum laborum porro dolor, neque eveniet ex consectetur hic expedita eos laboriosam minus numquam nemo similique.', 21);

-- --------------------------------------------------------

--
-- Structure de la table `exam_titre`
--

DROP TABLE IF EXISTS `exam_titre`;
CREATE TABLE IF NOT EXISTS `exam_titre` (
  `IDexam_titre` bigint(20) NOT NULL AUTO_INCREMENT,
  `IDProfesseur` bigint(20) DEFAULT '0',
  `IDParcours` bigint(20) DEFAULT '0',
  `IDNiveau` bigint(20) DEFAULT '0',
  `IDModule` bigint(20) DEFAULT '0',
  `Titre` varchar(50) DEFAULT '',
  `Diffusion` date NOT NULL,
  `H_debut` time DEFAULT '00:00:00',
  `Duree` time DEFAULT '00:00:00',
  `duree_i` varchar(10) DEFAULT NULL,
  `finished` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`IDexam_titre`),
  KEY `IDProfesseur` (`IDProfesseur`),
  KEY `IDParcours` (`IDParcours`),
  KEY `IDNiveau` (`IDNiveau`),
  KEY `IDModule` (`IDModule`),
  KEY `Titre` (`Titre`),
  KEY `Diffusion` (`Diffusion`),
  KEY `H_debut` (`H_debut`),
  KEY `Duree` (`Duree`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `exam_titre`
--

INSERT INTO `exam_titre` (`IDexam_titre`, `IDProfesseur`, `IDParcours`, `IDNiveau`, `IDModule`, `Titre`, `Diffusion`, `H_debut`, `Duree`, `duree_i`, `finished`) VALUES
(29, 1, 1, 1, 2, 'Examen Semestre 1', '2022-01-28', '12:00:00', '13:00:00', '13:00', 1);

-- --------------------------------------------------------

--
-- Structure de la table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `file_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `flash_info`
--

DROP TABLE IF EXISTS `flash_info`;
CREATE TABLE IF NOT EXISTS `flash_info` (
  `IDflash_info` bigint(20) NOT NULL AUTO_INCREMENT,
  `Datesaisie` date DEFAULT NULL,
  `Diffusion` date DEFAULT NULL,
  `Expiration` date DEFAULT NULL,
  `Info` longtext,
  PRIMARY KEY (`IDflash_info`),
  KEY `Datesaisie` (`Datesaisie`),
  KEY `Diffusion` (`Diffusion`),
  KEY `Expiration` (`Expiration`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `flash_info`
--

INSERT INTO `flash_info` (`IDflash_info`, `Datesaisie`, `Diffusion`, `Expiration`, `Info`) VALUES
(1, '2022-01-31', '2022-01-31', '2022-02-05', 'ceci est un flash info'),
(2, '2022-01-31', '2022-01-31', '2022-02-05', 'Affichage des liste de repéchage le Samedi .....'),
(3, '2022-02-02', '2022-02-02', '2022-02-05', 'Miarahaba antsika mpianatra'),
(4, '2022-02-02', '2022-02-02', '2022-01-05', 'Miarahaba antsika mpianatra'),
(5, '2022-02-02', '2022-02-02', '2022-01-05', 'Miarahaba antsika mpianatra');

-- --------------------------------------------------------

--
-- Structure de la table `histo_etu`
--

DROP TABLE IF EXISTS `histo_etu`;
CREATE TABLE IF NOT EXISTS `histo_etu` (
  `IDhisto_etu` bigint(20) NOT NULL AUTO_INCREMENT,
  `IDEtudiant` bigint(20) DEFAULT NULL,
  `IDAnnee_universitaire` bigint(20) DEFAULT NULL,
  `IDParcours` bigint(20) DEFAULT NULL,
  `IDNiveau` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`IDhisto_etu`),
  KEY `IDEtudiant` (`IDEtudiant`),
  KEY `IDAnnee_universitaire` (`IDAnnee_universitaire`),
  KEY `IDParcours` (`IDParcours`),
  KEY `IDNiveau` (`IDNiveau`),
  KEY `IDEtudiantIDAnnee` (`IDEtudiant`,`IDAnnee_universitaire`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `histo_etu`
--

INSERT INTO `histo_etu` (`IDhisto_etu`, `IDEtudiant`, `IDAnnee_universitaire`, `IDParcours`, `IDNiveau`) VALUES
(1, 1, 2, 1, 1),
(2, 2, 2, 1, 1),
(3, 3, 2, 1, 1),
(4, 4, 2, 1, 1),
(5, 5, 2, 1, 1),
(6, 6, 2, 1, 1),
(7, 7, 2, 1, 1),
(8, 8, 2, 1, 1),
(9, 9, 2, 1, 1),
(10, 10, 2, 1, 1),
(11, 11, 2, 1, 1),
(12, 12, 2, 1, 1),
(13, 13, 2, 1, 1),
(14, 14, 2, 1, 1),
(15, 15, 2, 1, 1),
(16, 16, 2, 1, 1),
(17, 17, 2, 1, 1),
(18, 18, 2, 1, 1),
(19, 19, 2, 1, 1),
(20, 20, 2, 1, 1),
(21, 21, 2, 1, 1),
(22, 22, 2, 1, 1),
(23, 23, 2, 1, 1),
(24, 24, 2, 1, 1),
(25, 25, 2, 1, 1),
(26, 26, 2, 1, 1),
(27, 27, 2, 1, 1),
(28, 28, 2, 1, 1),
(29, 29, 2, 1, 1),
(30, 30, 2, 1, 1),
(31, 31, 2, 1, 1),
(32, 32, 2, 1, 1),
(33, 33, 2, 1, 1),
(34, 34, 2, 1, 1),
(35, 35, 2, 1, 1),
(36, 36, 2, 1, 1),
(37, 37, 2, 1, 1),
(38, 38, 2, 1, 1),
(39, 39, 2, 1, 1),
(40, 40, 2, 1, 1),
(41, 41, 2, 1, 1),
(42, 42, 2, 1, 1),
(43, 43, 2, 1, 1),
(44, 44, 2, 1, 1),
(45, 45, 2, 1, 1),
(46, 46, 2, 1, 1),
(47, 47, 2, 1, 1),
(48, 48, 2, 1, 1),
(49, 49, 2, 1, 1),
(50, 50, 2, 1, 1),
(51, 51, 2, 1, 1),
(52, 52, 2, 1, 1),
(53, 53, 2, 1, 1),
(54, 54, 2, 1, 1),
(55, 55, 2, 1, 1),
(56, 56, 2, 1, 1),
(57, 57, 2, 1, 1),
(58, 58, 2, 1, 1),
(59, 59, 2, 1, 1),
(60, 60, 2, 1, 1),
(61, 61, 2, 1, 1),
(62, 62, 2, 1, 1),
(63, 63, 2, 1, 1),
(64, 64, 2, 1, 1),
(65, 65, 2, 1, 1),
(66, 66, 2, 1, 1),
(67, 67, 2, 1, 1),
(68, 68, 2, 1, 1),
(69, 69, 2, 1, 1),
(70, 70, 2, 1, 1),
(71, 71, 2, 1, 1),
(72, 72, 2, 1, 1),
(73, 73, 2, 1, 1),
(74, 74, 2, 1, 1),
(75, 75, 2, 3, 2),
(76, 76, 2, 3, 2),
(77, 77, 2, 3, 2),
(78, 78, 2, 3, 2),
(79, 79, 2, 3, 2),
(80, 80, 2, 3, 2),
(81, 81, 2, 3, 2),
(82, 82, 2, 3, 2),
(83, 83, 2, 3, 2),
(84, 84, 2, 3, 2),
(85, 85, 2, 3, 2),
(86, 86, 2, 3, 2),
(87, 87, 2, 3, 2),
(88, 88, 2, 3, 2),
(89, 89, 2, 3, 2),
(90, 90, 2, 3, 2),
(91, 91, 2, 3, 2),
(92, 92, 2, 3, 2),
(93, 93, 2, 3, 2),
(94, 94, 2, 3, 2),
(95, 95, 2, 3, 2),
(96, 96, 2, 3, 2),
(97, 97, 2, 3, 2),
(98, 98, 2, 3, 2),
(99, 99, 2, 3, 2),
(100, 100, 2, 3, 2),
(101, 101, 2, 3, 2),
(102, 102, 2, 3, 2),
(103, 103, 2, 3, 2),
(104, 104, 2, 3, 2),
(105, 105, 2, 3, 2),
(106, 106, 2, 3, 2),
(107, 107, 2, 3, 2),
(108, 108, 2, 3, 2),
(109, 109, 2, 3, 2),
(110, 110, 2, 3, 2),
(111, 111, 2, 3, 2),
(112, 112, 2, 3, 2),
(113, 113, 2, 3, 2),
(114, 114, 2, 3, 2),
(115, 115, 2, 3, 2),
(116, 116, 2, 3, 2),
(117, 117, 2, 3, 2),
(118, 118, 2, 2, 2),
(119, 119, 2, 2, 2),
(120, 120, 2, 2, 2),
(121, 121, 2, 2, 2),
(122, 122, 2, 2, 2),
(123, 123, 2, 2, 2),
(124, 124, 2, 2, 2),
(125, 125, 2, 2, 2),
(126, 126, 2, 2, 2),
(127, 127, 2, 2, 2),
(128, 128, 2, 2, 2),
(129, 129, 2, 2, 2),
(130, 130, 2, 2, 2),
(131, 131, 2, 2, 2),
(132, 132, 2, 2, 2),
(133, 133, 2, 2, 2),
(134, 134, 2, 2, 2),
(135, 135, 2, 2, 2),
(136, 136, 2, 2, 2),
(137, 137, 2, 2, 2),
(138, 138, 2, 2, 2),
(139, 139, 2, 2, 2),
(140, 140, 2, 2, 2),
(141, 141, 2, 2, 2),
(142, 142, 2, 2, 2),
(143, 143, 2, 2, 2),
(144, 144, 2, 2, 2),
(145, 145, 2, 2, 2),
(146, 146, 2, 2, 2),
(147, 147, 2, 2, 2),
(148, 148, 2, 2, 2),
(149, 149, 2, 2, 2),
(150, 150, 2, 2, 2),
(151, 151, 2, 2, 2),
(152, 152, 2, 2, 2),
(153, 153, 2, 2, 2),
(154, 154, 2, 2, 2),
(155, 155, 2, 2, 2),
(156, 156, 2, 2, 2),
(157, 157, 2, 2, 2),
(158, 158, 2, 2, 2),
(159, 159, 2, 2, 2),
(160, 160, 2, 2, 2),
(161, 161, 2, 2, 2),
(162, 162, 2, 4, 2),
(163, 163, 2, 4, 2),
(164, 164, 2, 4, 2),
(165, 165, 2, 4, 2),
(166, 166, 2, 4, 2),
(167, 167, 2, 4, 2),
(168, 168, 2, 4, 2),
(169, 169, 2, 4, 2),
(170, 170, 2, 4, 2),
(171, 171, 2, 4, 2),
(172, 172, 2, 4, 2),
(173, 173, 2, 4, 2),
(174, 174, 2, 4, 2),
(175, 175, 2, 4, 2),
(176, 176, 2, 4, 2),
(177, 177, 2, 4, 2),
(178, 178, 2, 4, 2),
(179, 179, 2, 4, 2),
(180, 180, 2, 4, 2),
(181, 181, 2, 4, 2),
(182, 182, 2, 4, 2),
(183, 183, 2, 4, 2),
(184, 184, 2, 4, 2),
(185, 185, 2, 3, 3),
(186, 186, 2, 3, 3),
(187, 187, 2, 3, 3),
(188, 188, 2, 3, 3),
(189, 189, 2, 3, 3),
(190, 190, 2, 3, 3),
(191, 191, 2, 3, 3),
(192, 192, 2, 3, 3),
(193, 193, 2, 3, 3),
(194, 194, 2, 3, 3),
(195, 195, 2, 3, 3),
(196, 196, 2, 3, 3),
(197, 197, 2, 3, 3),
(198, 198, 2, 3, 3),
(199, 199, 2, 3, 3),
(200, 200, 2, 3, 3),
(201, 201, 2, 3, 3),
(202, 202, 2, 3, 3),
(203, 203, 2, 3, 3),
(204, 204, 2, 3, 3),
(205, 205, 2, 3, 3),
(206, 206, 2, 3, 3),
(207, 207, 2, 3, 3),
(208, 208, 2, 3, 3),
(209, 209, 2, 3, 3),
(210, 210, 2, 3, 3),
(211, 211, 2, 3, 3),
(212, 212, 2, 3, 3),
(213, 213, 2, 3, 3),
(214, 214, 2, 3, 3),
(215, 215, 2, 3, 3),
(216, 216, 2, 3, 3),
(217, 217, 2, 3, 3),
(218, 218, 2, 3, 3),
(219, 219, 2, 3, 3),
(220, 220, 2, 3, 3),
(221, 221, 2, 3, 3),
(222, 222, 2, 3, 3),
(223, 223, 2, 3, 3),
(224, 224, 2, 3, 3),
(225, 225, 2, 3, 3),
(226, 226, 2, 3, 3),
(227, 227, 2, 3, 3),
(228, 228, 2, 2, 3),
(229, 229, 2, 2, 3),
(230, 230, 2, 2, 3),
(231, 231, 2, 2, 3),
(232, 232, 2, 2, 3),
(233, 233, 2, 2, 3),
(234, 234, 2, 2, 3),
(235, 235, 2, 2, 3),
(236, 236, 2, 2, 3),
(237, 237, 2, 2, 3),
(238, 238, 2, 2, 3),
(239, 239, 2, 2, 3),
(240, 240, 2, 2, 3),
(241, 241, 2, 2, 3),
(242, 242, 2, 2, 3),
(243, 243, 2, 2, 3),
(244, 244, 2, 2, 3),
(245, 245, 2, 2, 3),
(246, 246, 2, 2, 3),
(247, 247, 2, 2, 3),
(248, 248, 2, 2, 3),
(249, 249, 2, 2, 3),
(250, 250, 2, 2, 3),
(251, 251, 2, 2, 3),
(252, 252, 2, 2, 3),
(253, 253, 2, 2, 3),
(254, 254, 2, 2, 3),
(255, 255, 2, 2, 3),
(256, 256, 2, 2, 3),
(257, 257, 2, 2, 3),
(258, 258, 2, 2, 3),
(259, 259, 2, 2, 3),
(260, 260, 2, 2, 3),
(261, 261, 2, 2, 3),
(262, 262, 2, 2, 3),
(263, 263, 2, 2, 3),
(264, 264, 2, 2, 3),
(265, 265, 2, 2, 3),
(266, 266, 2, 2, 3),
(267, 267, 2, 2, 3),
(268, 268, 2, 2, 3),
(269, 269, 2, 2, 3),
(270, 270, 2, 2, 3),
(271, 271, 2, 2, 3),
(272, 272, 2, 2, 3),
(273, 273, 2, 2, 3),
(274, 274, 2, 2, 3),
(275, 275, 2, 2, 3),
(276, 276, 2, 2, 3),
(277, 277, 2, 2, 3),
(278, 278, 2, 2, 3),
(279, 279, 2, 2, 3),
(280, 280, 2, 2, 3),
(281, 281, 2, 2, 3),
(282, 282, 2, 2, 3),
(283, 283, 2, 2, 3),
(284, 284, 2, 2, 3),
(285, 285, 2, 2, 3),
(286, 286, 2, 4, 3),
(287, 287, 2, 4, 3),
(288, 288, 2, 4, 3),
(289, 289, 2, 4, 3),
(290, 290, 2, 4, 3),
(291, 291, 2, 4, 3),
(292, 292, 2, 4, 3),
(293, 293, 2, 4, 3),
(294, 294, 2, 4, 3),
(295, 295, 2, 4, 3),
(296, 296, 2, 4, 3),
(297, 297, 2, 4, 3),
(298, 298, 2, 4, 3),
(299, 299, 2, 4, 3),
(300, 300, 2, 4, 3),
(301, 301, 2, 4, 3),
(302, 302, 2, 4, 3),
(303, 303, 2, 4, 3),
(304, 304, 2, 4, 3),
(305, 305, 2, 4, 3),
(306, 306, 2, 4, 3),
(307, 307, 2, 4, 3),
(308, 308, 2, 4, 3),
(309, 309, 2, 4, 3),
(310, 310, 2, 5, 4),
(311, 311, 2, 5, 4),
(312, 312, 2, 5, 4),
(313, 313, 2, 5, 4),
(314, 314, 2, 5, 4),
(315, 315, 2, 5, 4),
(316, 316, 2, 5, 4),
(317, 317, 2, 5, 4),
(318, 318, 2, 5, 4),
(319, 319, 2, 5, 4),
(320, 320, 2, 5, 4),
(321, 321, 2, 5, 4),
(322, 322, 2, 5, 4),
(323, 323, 2, 5, 4),
(324, 324, 2, 5, 4),
(325, 325, 2, 5, 4),
(326, 326, 2, 5, 4),
(327, 327, 2, 5, 4),
(328, 328, 2, 5, 4),
(329, 329, 2, 5, 4),
(330, 330, 2, 5, 4),
(331, 331, 2, 5, 4),
(332, 332, 2, 5, 4),
(333, 333, 2, 5, 4),
(334, 334, 2, 5, 4),
(335, 335, 2, 5, 4),
(336, 336, 2, 5, 5),
(337, 337, 2, 5, 5),
(338, 338, 2, 5, 5),
(339, 339, 2, 5, 5),
(340, 340, 2, 5, 5),
(341, 341, 2, 5, 5),
(342, 342, 2, 5, 5),
(343, 343, 2, 5, 5),
(344, 344, 2, 5, 5),
(345, 345, 2, 5, 5),
(346, 346, 2, 5, 5),
(347, 347, 2, 5, 5),
(348, 348, 2, 5, 5),
(349, 349, 2, 5, 5),
(350, 350, 2, 5, 5),
(351, 351, 2, 7, 1),
(352, 352, 2, 7, 1),
(353, 353, 2, 7, 3),
(354, 354, 2, 7, 1),
(355, 355, 2, 7, 1),
(356, 356, 2, 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `message_etu`
--

DROP TABLE IF EXISTS `message_etu`;
CREATE TABLE IF NOT EXISTS `message_etu` (
  `IDmessage_etu` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Heure` time DEFAULT NULL,
  `Message` longtext,
  `IDEtudiant` bigint(20) DEFAULT '0',
  `IDProfesseur` bigint(20) DEFAULT '0',
  `Vu` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDmessage_etu`),
  KEY `Date` (`Date`),
  KEY `IDEtudiant` (`IDEtudiant`),
  KEY `IDProfesseur` (`IDProfesseur`),
  KEY `Vu` (`Vu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `message_etudiant`
--

DROP TABLE IF EXISTS `message_etudiant`;
CREATE TABLE IF NOT EXISTS `message_etudiant` (
  `idmessage` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` text,
  `urlFile` text,
  `vue` tinyint(1) DEFAULT '0',
  `IDEtudiant` bigint(20) DEFAULT NULL,
  `IDProfesseur` bigint(20) DEFAULT NULL,
  `dateM` date NOT NULL,
  `heureM` time NOT NULL,
  `ProfesseurM` tinyint(1) DEFAULT '0',
  `filename` text,
  PRIMARY KEY (`idmessage`),
  KEY `fk_etudiant_message_etudiant` (`IDEtudiant`),
  KEY `fk_professeur_message_etudiant` (`IDProfesseur`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `message_etudiant`
--

INSERT INTO `message_etudiant` (`idmessage`, `message`, `urlFile`, `vue`, `IDEtudiant`, `IDProfesseur`, `dateM`, `heureM`, `ProfesseurM`, `filename`) VALUES
(1, 'Bonjour!', NULL, 0, 1, 1, '2022-01-20', '14:09:10', 0, NULL),
(2, 'kdfgsjdklfgjsdklfg', NULL, 0, 1, 27, '2022-01-25', '06:39:31', 0, NULL),
(3, 'kdfgsjdklfgjsdklfg', NULL, 0, 1, 27, '2022-01-25', '06:40:11', 0, NULL),
(4, NULL, NULL, 0, 1, 27, '2022-01-25', '06:58:05', 0, NULL),
(5, NULL, NULL, 0, 1, 1, '2022-01-25', '07:01:04', 0, NULL),
(6, 'Bonjour ! ', NULL, 0, 1, 1, '2022-02-01', '07:32:42', 0, NULL),
(7, NULL, '8487c324a3f568898d32f1ab8d78ebf5.jpg', 0, 1, 1, '2022-02-01', '07:32:43', 0, 'Week-end.jpg'),
(8, '\nLorem ipsum dolor sit amet consectetur adipisicing elit. Harum explicabo animi, non vel accusamus deleniti? Repellendus, itaque dicta eaque eius aperiam dolores quo obcaecati quos animi natus recusandae tempore minima.\nFacilis consectetur asperiores tempore doloribus sapiente sunt delectus aliquid! Commodi ipsa, deserunt pariatur corrupti reprehenderit nesciunt a fuga perferendis nam sapiente inventore et est ex obcaecati blanditiis necessitatibus veniam quas.\nQuod veritatis enim veniam fuga? Optio, sunt unde magni ad iusto aut quo beatae saepe odio similique, iste nulla animi placeat est, labore aspernatur delectus omnis consequatur? Quae, dolorum error?\nAperiam error cupiditate maxime ab natus nostrum, in id quas at omnis aliquam iste voluptatem eum sapiente asperiores ex architecto impedit, tempore vero? Maiores ipsa illum perspiciatis ipsum provident qui!\nAperiam a sapiente unde sunt eos debitis inventore excepturi quaerat explicabo! Explicabo aperiam voluptas provident inventore! Laboriosam vel iure cum alias, tempora quam! In veritatis culpa perspiciatis minus, tempora accusantium.\nSit, commodi magni temporibus cupiditate aperiam at rerum possimus. Deleniti atque accusantium consequuntur. Excepturi magnam, aut modi id harum ea at sint quis sed labore inventore a omnis error provident.\nNostrum, placeat, cumque quam voluptatibus ullam atque natus, odio nemo obcaecati alias aperiam! Tenetur nisi, ex, reprehenderit, laudantium ea magnam ducimus architecto labore mollitia earum consequuntur magni nihil. Cumque, delectus!\nNeque non asperiores voluptatum adipisci corporis qui ex! Odio officiis natus velit sunt quo corrupti delectus fugiat temporibus vel, magnam doloribus culpa officia accusantium quod excepturi? Non voluptatem esse in.\nMolestias beatae possimus quasi unde! Sed cumque ipsum voluptatem amet ullam dolor voluptatum doloribus ipsa quibusdam labore nulla eligendi, officia maxime dolorum harum aut ducimus nemo deserunt soluta atque quos!\nOdio, vitae! Odit itaque maiores quis minus neque temporibus, numquam ea similique molestiae hic quaerat exercitationem eos in perspiciatis quisquam veniam iure rerum adipisci libero soluta? In sit libero iure.\nFacilis aspernatur incidunt ea cumque nesciunt perferendis deleniti ipsam molestias reprehenderit asperiores. Numquam, ipsum quae quidem eius laborum, exercitationem deleniti nihil aperiam dolores corrupti unde quaerat aut quisquam quo magnam.\nIpsam, nihil! Aliquid laboriosam dolores quia alias maxime numquam temporibus est dolorum quis debitis quam, doloremque iusto dignissimos illo quaerat possimus. Necessitatibus delectus ut, neque cum voluptas consectetur autem eaque.\nAlias, soluta? A iusto eligendi nulla quidem. Ex molestiae eaque quas veniam enim quisquam fuga eum inventore accusantium cum, doloremque quasi qui, ad praesentium exercitationem id vitae quis facilis itaque.\nIste inventore sequi quos vero quae deleniti, cumque pariatur quisquam alias ad, nihil quaerat enim nam vel odio iusto corrupti architecto ducimus officiis amet sapiente incidunt corporis non. Molestiae, possimus.\nIusto, a fuga! Sed, mollitia enim corrupti similique debitis consectetur eos quam, incidunt deleniti sit quis, harum quae culpa dolor provident doloribus odit nostrum laborum quasi assumenda iusto voluptas ad?\nAut harum deserunt facere minus iste temporibus quod vero perferendis beatae alias, eaque eum ipsa aliquam reprehenderit ipsam optio, nulla iusto, fugit aperiam. Architecto nisi dolorem quo error delectus aliquid?\nSaepe explicabo modi enim soluta maxime deserunt, quisquam, id nesciunt nam, autem amet voluptate qui eaque ut incidunt ducimus in asperiores ipsa optio. Autem esse animi ea culpa molestias quos.\nVoluptatibus temporibus doloremque, recusandae illo cum aliquam asperiores sit! Deleniti excepturi vero distinctio magnam asperiores beatae dolorem, fuga magni natus suscipit. Eos eius repellendus maxime, doloremque perferendis voluptatum necessitatibus soluta.\nExpedita unde dignissimos atque recusandae ipsa, eligendi inventore praesentium fuga itaque distinctio, numquam aperiam cumque sint vero neque consectetur totam cupiditate magni. Nesciunt sequi eaque itaque quos aperiam, quasi eligendi.\nNon accusantium id pariatur quisquam impedit, magni tempore nisi minus mollitia aut ipsum iusto, ullam eius recusandae nostrum ipsa facere aliquam eum maiores in doloremque, explicabo praesentium rem? Doloremque, suscipit?\nIllo saepe dignissimos eius in inventore soluta, iusto commodi temporibus ipsa ullam odit explicabo est libero eos, alias rem quod voluptas consectetur unde. Voluptatibus molestiae hic architecto repudiandae! Deserunt, ratione?\nPraesentium, inventore. Aspernatur qui tenetur ea exercitationem neque at! Dolor, id perspiciatis iure nostrum sint placeat quia totam reiciendis voluptates commodi aliquam veritatis voluptate! Iusto maxime tempora deserunt unde nam?\nPerspiciatis repellendus cumque maxime dolor est corrupti excepturi, commodi vel perferendis aspernatur doloremque exercitationem amet eligendi et recusandae cum reiciendis delectus deleniti qui, consequuntur aliquam? Perferendis consequatur ullam animi enim?\nLaborum facere amet quia. Fugit maxime autem rerum nemo amet. Asperiores, doloribus quidem. Ad, nihil vero asperiores quos voluptatem error totam placeat porro minus assumenda nam, earum, nemo voluptatum! Perferendis?\nAutem ipsum, iusto suscipit harum minus ipsa recusandae id, laboriosam quis totam sint. Vitae reprehenderit quae iste placeat sit laboriosam, possimus animi debitis vel at, natus rerum facilis odit adipisci.\nDeleniti excepturi, sequi adipisci quisquam, consectetur labore autem eius asperiores laborum omnis ex incidunt veritatis fugit et iusto provident optio eum quis architecto? Magnam, aut ipsa! Numquam eligendi minus explicabo.\nObcaecati nemo vel ea voluptatibus culpa, excepturi, accusantium quibusdam placeat ullam ipsum consequuntur ex adipisci dolores quo aut sapiente, saepe dolorum autem earum voluptatem omnis iste a provident consequatur! Earum?\nNatus enim qui unde ducimus similique labore ipsam, tempore totam nulla doloribus nesciunt sed. Ea labore obcaecati possimus explicabo cum, optio minima nobis nostrum dolores accusamus. Sed perspiciatis fugiat magni?\nSequi quis non eaque cumque exercitationem, est magnam molestias culpa alias sint unde fugit nam dignissimos suscipit quibusdam deserunt quae nisi nulla, asperiores odio quasi tenetur? Voluptas nostrum maxime odit.\nSuscipit nostrum deleniti dignissimos sapiente, atque itaque, illum beatae quia voluptatem vitae in ipsum! Magnam esse impedit ipsam! Vitae placeat ipsam ratione voluptatum debitis delectus nisi maiores voluptatem quod consequatur?\nHarum similique iure exercitationem veritatis quibusdam qui placeat accusantium illo corrupti. Iure earum, ad vel esse mollitia asperiores quo tempore dolores aliquid quaerat quibusdam nam quidem quisquam neque, suscipit eius!\nVitae unde debitis minima mollitia reprehenderit asperiores ullam fuga possimus at repellendus non dolorum consectetur, incidunt nihil voluptate tempore id deserunt ipsum assumenda cupiditate doloremque pariatur voluptatibus quisquam? Molestias, sit.\nTenetur ipsum, nobis rerum dolore consectetur eius facere delectus esse, sint quod vitae neque amet. Distinctio quas debitis quos dolores tenetur laudantium! Qui, dolor blanditiis voluptates quasi exercitationem reprehenderit neque!\nMollitia vero asperiores, alias dolore voluptas quo enim dignissimos, quisquam voluptate temporibus eius, veritatis reprehenderit ad commodi maxime aperiam ullam quaerat suscipit consectetur omnis ab. Numquam corporis magni cum dolores.\nVeritatis omnis molestiae qui in, sit quae, rerum, a provident officiis animi pariatur. Architecto similique ut ducimus neque consequatur, sapiente delectus saepe maiores provident quia cum corporis aperiam rerum. Eaque?\nQuibusdam corporis dolore repudiandae est exercitationem assumenda numquam autem, voluptate deserunt neque debitis culpa possimus nulla perferendis tempore laboriosam illum amet aliquid! Ipsum asperiores deserunt iure minus id fugit quo?\nA minima magni molestias sed asperiores et pariatur modi veritatis nesciunt est. Odit porro ratione veniam. Iste ad ipsam quia dolorum natus nam aliquam dicta debitis animi! Quod, sapiente ex.\nIllo, repellendus sapiente. Id magnam, quam perspiciatis suscipit, sequi earum blanditiis consectetur perferendis maxime veritatis culpa necessitatibus repudiandae nemo corporis enim explicabo dolor pariatur cumque molestias mollitia beatae molestiae ullam.\nDeserunt, totam voluptatibus quisquam incidunt vero consectetur enim dolore quas temporibus consequatur, autem nihil voluptatum repellat deleniti ducimus. Velit consequuntur sed veniam cum rerum veritatis hic itaque unde neque facere.\nSint sequi nobis adipisci fugit aut et provident aliquid magni pariatur dolor ducimus consequatur modi similique praesentium cumque eaque quae, corrupti nulla eligendi dicta ea laborum officiis. Ipsa, totam ipsum.', NULL, 0, 1, 27, '2022-02-01', '07:48:48', 0, NULL),
(9, NULL, 'f057feab3b8a85a95cfc1337a66d4e10.png', 0, 310, 1, '2022-02-01', '13:40:54', 0, 'cry.PNG'),
(10, '\nLorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus animi distinctio consequatur enim nostrum molestias minus, architecto accusamus eveniet, reprehenderit ea quidem veniam ad dolores. At possimus beatae reiciendis odio!\nIste atque exercitationem porro corrupti? Quisquam voluptate animi excepturi minima, inventore esse ducimus nobis quam placeat corporis voluptates ipsum magnam provident nam cum facilis quidem, dolor ab itaque aliquid totam!\nRecusandae, repellendus quidem? Minima odio nihil cumque esse! Accusamus sequi, assumenda labore dolore optio, ipsum maxime deleniti dolorem fugit officiis iusto non unde, ducimus cum distinctio rerum corrupti quod expedita!\nLibero sit voluptatem suscipit cupiditate iste, eum quisquam temporibus aut mollitia quis nostrum magnam, veritatis officia illum velit molestiae et qui nobis unde deserunt similique voluptas aperiam. Ad, et repellendus.\nAperiam id, veniam minima vitae rerum, impedit beatae blanditiis quibusdam iure tempora dolores ipsam corrupti nisi voluptatem itaque quas laudantium eligendi magnam maiores non distinctio porro? Officiis placeat excepturi non!\nTotam delectus inventore quos aliquam minus odio quasi commodi fuga expedita. Iure, a? Quas consequatur minima, incidunt cum tenetur magni sequi. Sapiente vero cum recusandae iure atque adipisci similique tenetur.\nMolestiae quo labore consequatur nostrum delectus placeat natus commodi est maxime minima. Vero alias similique sint, harum molestiae facere, voluptatibus incidunt vitae sed illum voluptatem at ex error numquam laborum.\nAnimi, nostrum tenetur corporis, totam culpa, nihil voluptates atque unde amet numquam impedit provident assumenda incidunt pariatur beatae. Rerum ducimus laborum doloribus vero fugiat, sunt earum. Quasi repellat debitis ipsa.\nUnde dolores, totam dolorum, cum aliquam quidem officia adipisci sit voluptatum neque velit magni saepe veniam id reiciendis delectus accusantium, temporibus cumque harum incidunt repudiandae alias suscipit iste quibusdam! Quas.\nA corporis labore consequuntur totam error voluptate dolorum distinctio deserunt asperiores dolores sint nostrum, exercitationem odio, cupiditate iure iste illo similique sapiente. Facere quae, saepe tempore eaque minima quos enim!', NULL, 0, 310, 1, '2022-02-01', '13:40:56', 0, NULL),
(11, '\n        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Illum, sapiente! Dicta vero commodi ut, labore pariatur eum vel, iste repudiandae nostrum modi itaque eaque fuga ipsa sequi dignissimos eveniet laboriosam!\n        Impedit itaque perspiciatis modi voluptatibus adipisci amet illum officia optio sequi id recusandae, officiis laboriosam ut, nostrum dignissimos reprehenderit architecto cum omnis praesentium magnam aliquid. Similique, quod veritatis. Vitae, temporibus?\n        Assumenda similique saepe reprehenderit. Nisi nostrum in quod rerum nihil iusto, consequuntur laboriosam architecto eaque, ullam beatae esse harum eligendi neque unde exercitationem molestiae! Eius error reprehenderit id vitae amet.\n        Autem, necessitatibus officia quam ducimus mollitia odio architecto ab voluptatum unde debitis eos. Rem non corporis repudiandae aut necessitatibus perferendis. Reiciendis accusamus iure quia error laboriosam eos doloremque quas aperiam!\n        Officia, soluta architecto. Iusto ab temporibus placeat ea harum deserunt, odit earum. Fuga perspiciatis architecto laboriosam laudantium non in incidunt sed, maxime harum blanditiis ea repellendus quaerat nemo quia repudiandae.\n        Voluptatum, impedit. Corrupti perspiciatis tenetur maxime doloribus optio sunt doloremque? Cum quidem pariatur odit, quas rem ullam iusto perferendis! Corrupti eligendi iste eos consectetur enim harum unde sit vitae expedita!\n        Tenetur a adipisci eum maxime similique quibusdam impedit nam pariatur molestias, optio aliquid debitis odio saepe nobis iure perferendis aliquam at hic reprehenderit veritatis aut alias facilis. Reiciendis, autem necessitatibus!\n        Incidunt praesentium eaque placeat deleniti animi perferendis corporis illo quos quaerat, vero qui sit quis nobis asperiores dicta vitae maiores possimus delectus et temporibus nisi. Quidem perspiciatis est pariatur? Voluptatem!\n        Vitae repellat dicta necessitatibus similique tenetur voluptatem sequi aliquid, fugit, asperiores labore tempora cumque minima molestias? Maxime facere rerum, quibusdam assumenda est, illum quam aperiam officia corporis in ad odio.\n        Eius in incidunt enim sapiente maxime consectetur laboriosam illo temporibus delectus inventore nisi veritatis officia repellat, magni iste numquam repellendus, amet aut! Eum libero dolorum voluptate fugiat, atque autem aspernatur.\n        Expedita ea sequi vitae repudiandae suscipit odio ipsam possimus ullam. Explicabo similique culpa qui obcaecati odit iste error aliquam. Illum distinctio soluta officia neque beatae, quasi et modi laborum ipsam.\n        Facere, vero laboriosam. Eligendi minima aliquam assumenda illo exercitationem eaque est dolore esse facilis quisquam iste vitae mollitia earum cum placeat natus fugiat, fuga cumque soluta perspiciatis. Nisi, unde consectetur?\n        Commodi error necessitatibus impedit voluptates nihil repellat, at facere? Obcaecati tempore porro fuga laborum dignissimos, quam accusamus nihil dolor eum minima aut, hic in necessitatibus inventore earum repudiandae enim praesentium.\n        Accusamus, temporibus quis nisi aliquam ut rerum veritatis vero beatae possimus dolor repudiandae natus quam commodi, enim, eum assumenda? Tempore ratione ipsum facilis inventore, eum omnis ducimus nisi necessitatibus aspernatur!\n        Amet repellat vel assumenda, quisquam necessitatibus delectus maiores quae doloribus quod quibusdam exercitationem architecto numquam rem commodi reprehenderit voluptatem placeat inventore aliquid eius. Iste, quaerat perspiciatis sit delectus alias accusamus.\n        Aut, laborum ut rem nulla atque dolorem hic nesciunt veritatis itaque possimus alias repellat illo eveniet pariatur neque voluptatibus delectus vero. Quaerat non cum alias necessitatibus quas quasi ullam iste?\n        Repudiandae dolores sapiente nulla omnis consequuntur, recusandae eligendi qui porro! Non et adipisci totam minus nam deleniti provident quo, exercitationem fugit voluptatibus. Adipisci possimus autem, mollitia quis quae nisi voluptatem?\n        Perferendis non delectus odio tempora, aliquid provident rerum, dicta nulla beatae nemo omnis repudiandae quisquam necessitatibus consequuntur minima nam, molestias optio animi sit dolorum sapiente ratione. Optio natus totam sit.\n        Odio neque at, dicta repellat quasi consequatur tempora harum optio tempore rem excepturi blanditiis laborum ratione id. Molestiae, error. Voluptates placeat perspiciatis facere reprehenderit. Voluptate optio sunt cupiditate dicta cum.\n        Quos architecto possimus pariatur eaque numquam maiores blanditiis, labore assumenda. Esse praesentium ex facere aut repellendus excepturi voluptas, voluptates obcaecati ipsam, illo alias explicabo dolor dignissimos aliquid ut animi adipisci!', NULL, 0, 1, 1, '2022-02-01', '14:15:41', 0, NULL),
(12, NULL, '52c8024534ebdbd40af7578ca5e28d9d.png', 0, 1, 1, '2022-02-01', '14:15:42', 0, 'lol.PNG'),
(13, 'Bonjour message vaovao', NULL, 0, 310, 1, '2022-02-01', '14:40:41', 0, NULL),
(14, 'Bonjour! by professeur', '16dd173f1c50a0e0adf6eab490b62ac5.png', 0, 310, 1, '2022-02-01', '14:43:39', 0, 'complete angular file.PNG'),
(15, 'Bonjour by professeur', NULL, 0, 310, 1, '2022-02-01', '14:44:56', 1, NULL),
(16, 'Bonjour by professeur', NULL, 0, 310, 1, '2022-02-01', '14:45:02', 1, NULL),
(17, 'Bonjour by professeur', NULL, 0, 310, 1, '2022-02-01', '14:45:49', 1, NULL),
(18, 'lorem ispum dolor\n', NULL, 0, 1, 2, '2022-02-02', '06:10:18', 0, NULL),
(19, 'lorem ispum dolor\n', NULL, 0, 1, 2, '2022-02-02', '06:11:42', 0, NULL),
(20, 'lorem ispum dolor\n', NULL, 0, 1, 2, '2022-02-02', '06:12:14', 0, NULL),
(21, 'Lorem', NULL, 0, 1, 1, '2022-02-02', '06:27:52', 0, NULL),
(22, 'Lorem', NULL, 0, 1, 2, '2022-02-02', '06:30:15', 0, NULL),
(23, 'Lorem', NULL, 0, 1, 2, '2022-02-02', '06:30:53', 0, NULL),
(24, 'message and file', NULL, 0, 1, 3, '2022-02-02', '06:49:11', 0, NULL),
(25, 'Bonjour voici mon devoir', NULL, 0, 1, 7, '2022-02-02', '06:59:43', 0, NULL),
(26, 'message and file', NULL, 0, 1, 2, '2022-02-02', '07:10:22', 0, NULL),
(27, 'Message et fichier', NULL, 0, 1, 1, '2022-02-02', '07:16:33', 0, NULL),
(28, 'Message et fichier', NULL, 0, 1, 1, '2022-02-02', '07:16:47', 0, NULL),
(29, 'Message et fichier', NULL, 0, 1, 1, '2022-02-02', '07:19:37', 0, NULL),
(30, 'Message et fichier', NULL, 0, 1, 4, '2022-02-02', '07:20:59', 0, NULL),
(31, 'Message et fichier', NULL, 0, 1, 4, '2022-02-02', '07:22:21', 0, NULL),
(32, 'Message et fichier', '917fb029f21834cc3117bd1c29c5c06c.png', 0, 1, 4, '2022-02-02', '07:23:08', 0, 'Etude.PNG'),
(33, 'bye2', NULL, 0, 1, 3, '2022-02-02', '10:22:47', 0, NULL),
(34, 'Ohayo', NULL, 0, 1, 2, '2022-02-02', '11:10:17', 0, NULL),
(35, 'Veloma fa vitaaaaa', NULL, 0, 1, 2, '2022-02-02', '11:12:01', 0, NULL),
(36, 'llll', NULL, 0, 1, 2, '2022-02-02', '11:15:48', 0, NULL),
(37, 'gggg', NULL, 0, 1, 1, '2022-02-02', '11:17:15', 0, NULL),
(38, 'fff', '837a0fc98d4dc1c358c797254c9d7d07.png', 0, 4, 1, '2022-02-02', '11:34:49', 0, 'Edge.PNG'),
(39, 'lorem', NULL, 0, 310, 1, '2022-02-02', '13:07:31', 1, NULL),
(40, 'bonjour:', '5edb2362ae131a5ddc97e54257f2eb42.png', 0, 2, 1, '2022-02-02', '13:08:07', 0, 'complete angular file.PNG'),
(41, 'Bonjour professeur', '9c49915980ef6721c21715cafcb19d42.png', 0, 2, 1, '2022-02-03', '08:50:58', 0, 'complete angular file.PNG'),
(42, 'Bonjour, ou est votre exercice\n', NULL, 0, 310, 1, '2022-02-03', '08:52:04', 1, NULL),
(43, 'Bonjour, ou est votre exercice\n', NULL, 0, 310, 1, '2022-02-03', '08:52:19', 1, NULL),
(44, 'edge', NULL, 0, 3, 1, '2022-02-04', '02:07:53', 1, NULL),
(45, 'edge', NULL, 0, 3, 1, '2022-02-04', '02:11:47', 1, NULL),
(46, 'angular complet package', NULL, 0, 2, 1, '2022-02-04', '02:12:48', 1, NULL),
(47, 'angular complet package', NULL, 0, 2, 1, '2022-02-04', '02:13:41', 1, NULL),
(48, 'angular package', NULL, 0, 2, 1, '2022-02-04', '06:20:35', 1, NULL),
(49, 'edge', NULL, 0, 4, 1, '2022-02-04', '06:37:12', 1, NULL),
(50, 'joke', '55a68135f86a8d63e43c7a80ba29a343.png', 0, 4, 1, '2022-02-04', '06:42:11', 1, 'kb.PNG'),
(51, 'jjj', '47c96376c876237ece8e69ab214b24a2.png', 0, 3, 1, '2022-02-04', '06:56:55', 1, 'cry.PNG'),
(52, 'fdsgdfgsdfgsdfg', NULL, 0, 1, 1, '2022-02-07', '13:49:19', 1, NULL),
(53, 'sdfgsdfgsdfgds', NULL, 0, 1, 1, '2022-02-07', '13:49:40', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `IDModule` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(200) DEFAULT '',
  `IDUnite_enseignement` bigint(20) DEFAULT '0',
  `Suppr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDModule`),
  KEY `Nom` (`Nom`),
  KEY `IDUnité_enseignement` (`IDUnite_enseignement`),
  KEY `Suppr` (`Suppr`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`IDModule`, `Nom`, `IDUnite_enseignement`, `Suppr`) VALUES
(1, 'Introduction au travail social', 1, 1),
(2, 'Introduction au travail social', 1, 0),
(3, 'Etude et compréhension des problèmes sociaux', 1, 0),
(4, 'Apport de la philosophie sociale pour la compréhension du champ et pratique du travail social', 1, 0),
(5, 'Introduction au principe éthique et au code de déontologie de travail social', 2, 0),
(6, 'Relation d’aide et d’accompagnement en travail social', 2, 0),
(7, 'Morale fondamentale', 2, 0),
(8, 'Connaissance de soi', 2, 0),
(9, 'Anthropologie du monde Malagasy ', 3, 0),
(10, 'Méthodologie d’observation  sociale ', 3, 0),
(11, 'Ecrits professionnels ', 3, 0),
(12, 'Informatique bureautique', 3, 0),
(13, 'Sociologie générale', 4, 0),
(14, 'Psychologie générale', 4, 0),
(15, 'Psychologie de l’enfant ', 4, 0),
(16, 'Economie Sociale ', 4, 0),
(17, 'Français ', 5, 0),
(18, 'Malagasy', 5, 0),
(19, 'Anglais', 5, 0),
(20, 'Remise à niveau de la langue française', 5, 0),
(21, 'Documentation', 5, 0),
(22, 'Accompagnement individuel', 6, 0),
(23, 'Accompagnement de groupe', 6, 0),
(24, 'Accompagnement communautaire', 6, 0),
(25, 'Morale et responsabilité', 6, 0),
(26, 'Psychopédagogie', 6, 0),
(27, 'Principe éthique et code de déontologie de l’ISTS', 6, 0),
(28, 'Informatique (internet et power point)', 3, 0),
(29, 'Secourisme ', 3, 0),
(30, 'Statistique ', 3, 0),
(31, 'Comptabilité', 3, 0),
(32, 'Créativité', 3, 0),
(33, 'Développement personnel', 3, 0),
(34, 'Psychologie sociale', 4, 0),
(35, 'Sociologie de la famille', 4, 0),
(36, 'Sociologie du travail', 4, 0),
(37, 'Prise en charge des enfants en conflit avec la loi', 4, 0),
(38, 'Education familiale et sanitaire', 5, 0),
(39, 'Fléaux sociaux', 5, 0),
(40, 'Droit civil', 5, 0),
(41, 'Administration sociale', 6, 0),
(42, 'Marketing social', 6, 0),
(43, 'Médiation sociale', 6, 0),
(44, 'Communication et gestion de conflits', 6, 0),
(45, 'Gestion des Services Sociaux', 6, 0),
(46, 'Politique sociale', 6, 0),
(47, 'Recherche Sociale ', 6, 0),
(48, 'Atelier rédactionnel (Dossier social et mémoire)', 3, 0),
(49, 'Méthodologie de projet', 3, 0),
(50, 'Education civique et morale politique', 3, 0),
(51, 'Sociologie de développement', 4, 0),
(52, 'Organisation Générale de l’Entreprise', 4, 0),
(53, 'Psychiatrie sociale', 4, 0),
(54, 'Législation sociale', 4, 0),
(55, 'Population et développement', 4, 0),
(56, 'Enseignement social de l’Eglise', 5, 0),
(57, 'Santé de la reproduction', 5, 0),
(58, 'Droit Pénal', 5, 0),
(59, 'Autopromotion', 7, 0),
(60, 'Méthodologie de projet de développement', 7, 0),
(61, 'Accompagnement et dynamique de groupe', 7, 0),
(62, 'Communication pour le changement social', 7, 0),
(63, 'Principe éthique et code de déontologie de l’ISTS', 7, 0),
(64, 'Alphabétisation 1', 3, 0),
(65, 'Technique d’animation socioculturelle et créativité', 3, 0),
(66, 'Montage de projet d’Activité Génératrice de Revenu', 3, 0),
(67, 'Média 1', 3, 0),
(68, 'Secourisme', 3, 1),
(69, 'Morale et responsabilité', 3, 0),
(70, 'Sociologie du monde rural et urbain', 4, 0),
(71, 'Géographie de l’environnement', 4, 0),
(72, 'Droit de la famille', 4, 0),
(73, 'Droit foncier', 4, 0),
(74, 'Statistique ', 4, 0),
(75, 'Education à la citoyenneté', 5, 0),
(76, 'Prise en charge des enfants en conflit avec la loi (grandir dignement)', 5, 0),
(77, 'Recherche Sociale ', 7, 0),
(78, 'Marketing social ', 7, 0),
(79, 'Médiation sociale', 7, 0),
(80, 'Communication et gestion de conflit', 7, 0),
(81, 'Politique sociale', 7, 0),
(82, 'Alphabétisation 2', 3, 0),
(83, 'Communication interpersonnelle', 3, 0),
(84, 'Média 2', 3, 0),
(85, 'Epargne et micro-crédit', 3, 0),
(86, 'Organisation Générale d’Entreprise', 4, 1),
(87, 'Décentralisation territoriale', 4, 0),
(88, 'Sociologie de groupe', 4, 0),
(89, 'Analyse transactionnelle', 4, 0),
(90, 'Population et développement', 4, 1),
(91, 'Gérontologie', 5, 0),
(92, 'Créativité et Activités d’expression', 8, 0),
(93, 'Enfance en danger/délinquance ', 8, 0),
(94, 'Surdité et Cécité ', 8, 0),
(95, 'Handicaps Physiques ', 8, 0),
(96, 'Approche et Technique d’Intervention en Education Spécialisée ', 8, 0),
(97, 'Relation Educative Aidante', 8, 0),
(98, 'Morale et responsabilité', 8, 0),
(99, 'Montage de projet éducatif ', 3, 0),
(100, 'Technique d’animation éducative', 3, 0),
(101, 'Principe Ethique et code de déontologie de l’ISTS', 3, 0),
(102, 'Animation de groupe et travail en équipe', 3, 0),
(103, 'Sociologie et pédagogie en Education spécialisée ', 4, 0),
(104, 'Introduction en thématique d’handicap', 4, 0),
(105, 'Comptabilité', 5, 0),
(106, 'Statistique', 5, 0),
(107, 'Politique sociale', 8, 0),
(108, 'Médiation sociale', 8, 0),
(109, 'Communication et gestion de conflit', 8, 0),
(110, 'Psychopathologie infantile et adulte ', 8, 0),
(111, 'Gérontologie', 8, 0),
(112, 'Recherche sociale', 8, 0),
(113, 'Méthodologie des projets sociaux ', 3, 0),
(114, 'Mobilisation des ressources humaines et environnementale ', 3, 0),
(115, 'Activités Physique et Sportive', 3, 0),
(116, 'Psychologie des adolescents  et des personnes agées', 4, 0),
(117, 'Droit des personnes handicapées ', 5, 0),
(118, 'Marketing social', 5, 0),
(119, 'Introduction au travail social', 1, 0),
(120, 'Méthodologie  de recherche ', 9, 0),
(121, 'Méthode d’analyse socio statistique des phénomènes et facteurs sociaux', 9, 0),
(122, 'Analyse systémique de l’action et du travail social', 9, 0),
(123, 'Condition d’appropriation de l’évaluation des politiques et programmes par les professionnels de l’a', 10, 0),
(124, 'Développement territorial/local, action sociale', 10, 0),
(125, 'Ingénierie de l’appui aux processus de développement social', 11, 0),
(126, 'Droit social et cadre juridico institutionnel de l’action sociale', 11, 0),
(127, 'Pratique de gestion et financement de l’action sociale', 12, 0),
(128, 'Communication et relation publique', 12, 0),
(129, 'Méthodologie  de recherche ', 9, 1),
(130, 'Méthodologie de recherche action/ ', 9, 1),
(131, 'Méthode d’analyse socio statistique des phénomènes et facteurs sociaux M2', 9, 1),
(132, 'Analyse systémique de l’action et du travail social M2', 9, 1),
(133, 'Condition d’appropriation de l’évaluation des politiques et programmes par les professionnels de l’a', 10, 1),
(134, 'Développement territorial/local, action sociale', 10, 1),
(135, 'Ingénierie de l’appui aux processus de développement social M2', 11, 1),
(136, 'Droit social et cadre juridico institutionnel de l’action sociale M2', 11, 1),
(137, 'Pratique de gestion et financement de l’action sociale M2', 12, 1),
(138, 'Communication et relation publique M2', 12, 1),
(139, 'Méthodologie de recherche action', 14, 0),
(140, 'Documentation', 14, 0),
(141, 'Informatique', 14, 0),
(142, 'Anglais ', 14, 0),
(143, 'Pratique intégrée du Travail Social ', 15, 0),
(144, 'Etude comparative de politique sociale et du travail social', 15, 0),
(145, 'Enjeux des innovations sociales dans la gestion du développement social', 15, 0),
(146, 'Cadre juridique des ONG et des Associations d’action sociale et humanitaire ', 16, 0),
(147, 'Sociologie des  organisations ', 16, 0),
(148, 'Méthodologie de management des ressources humaines', 16, 0),
(149, 'Expériences historiques du développement', 16, 0),
(150, 'Méthodologie  de programmes/ projets de développement social', 17, 0);

-- --------------------------------------------------------

--
-- Structure de la table `module_professeur`
--

DROP TABLE IF EXISTS `module_professeur`;
CREATE TABLE IF NOT EXISTS `module_professeur` (
  `IDProfesseur_Module` bigint(20) NOT NULL AUTO_INCREMENT,
  `IDProfesseur` bigint(20) DEFAULT '0',
  `IDParcours` bigint(20) DEFAULT '0',
  `IDNiveau` bigint(20) DEFAULT '0',
  `IDModule` bigint(20) DEFAULT '0',
  `Suppr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDProfesseur_Module`),
  KEY `IDProfesseur` (`IDProfesseur`),
  KEY `IDParcours` (`IDParcours`),
  KEY `IDNiveau` (`IDNiveau`),
  KEY `IDModule` (`IDModule`),
  KEY `Suppr` (`Suppr`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `module_professeur`
--

INSERT INTO `module_professeur` (`IDProfesseur_Module`, `IDProfesseur`, `IDParcours`, `IDNiveau`, `IDModule`, `Suppr`) VALUES
(1, 1, 1, 1, 2, 0),
(2, 2, 1, 1, 119, 0),
(3, 3, 1, 1, 3, 0),
(4, 4, 1, 1, 4, 0),
(5, 5, 1, 1, 5, 0),
(6, 2, 1, 1, 6, 0),
(7, 6, 1, 1, 7, 0),
(8, 7, 1, 1, 8, 0),
(9, 8, 1, 1, 9, 0),
(10, 9, 1, 1, 10, 0),
(11, 10, 1, 1, 11, 0),
(12, 11, 1, 1, 12, 0),
(13, 12, 1, 1, 13, 0),
(14, 13, 1, 1, 14, 0),
(15, 14, 1, 1, 15, 0),
(16, 15, 1, 1, 16, 0),
(17, 10, 1, 1, 17, 0),
(18, 16, 1, 1, 18, 0),
(19, 17, 1, 1, 19, 0),
(20, 8, 1, 1, 20, 0),
(21, 18, 1, 1, 21, 0),
(22, 19, 2, 2, 22, 0),
(23, 19, 2, 2, 23, 0),
(24, 20, 2, 2, 24, 0),
(25, 21, 2, 2, 25, 0),
(26, 22, 2, 2, 26, 0),
(27, 23, 2, 2, 27, 0),
(28, 11, 2, 2, 28, 0),
(29, 24, 2, 2, 29, 0),
(30, 25, 2, 2, 30, 0),
(31, 26, 2, 2, 31, 0),
(32, 27, 2, 2, 32, 0),
(33, 28, 2, 2, 33, 0),
(34, 29, 2, 2, 35, 0),
(35, 29, 2, 2, 36, 0),
(36, 19, 2, 2, 37, 0),
(37, 30, 2, 2, 17, 0),
(38, 31, 2, 2, 38, 0),
(39, 32, 2, 2, 39, 0),
(40, 33, 2, 2, 40, 0),
(41, 34, 2, 2, 19, 0),
(42, 55, 2, 3, 41, 0),
(43, 54, 2, 3, 42, 0),
(44, 20, 2, 3, 43, 0),
(45, 20, 2, 3, 44, 0),
(46, 46, 2, 3, 45, 0),
(47, 43, 2, 3, 46, 0),
(48, 45, 2, 3, 47, 0),
(49, 19, 2, 3, 48, 0),
(50, 56, 2, 3, 49, 0),
(51, 12, 2, 3, 50, 0),
(52, 57, 2, 3, 51, 0),
(53, 58, 2, 3, 52, 0),
(54, 59, 2, 3, 53, 0),
(55, 49, 2, 3, 54, 0),
(56, 50, 2, 3, 55, 0),
(57, 51, 2, 3, 56, 0),
(58, 52, 2, 3, 57, 0),
(59, 33, 2, 3, 58, 0),
(60, 10, 2, 3, 17, 0),
(61, 27, 4, 2, 92, 0),
(62, 35, 4, 2, 93, 0),
(63, 36, 4, 2, 94, 0),
(64, 37, 4, 2, 95, 0),
(65, 35, 4, 2, 96, 0),
(66, 38, 4, 2, 97, 0),
(67, 21, 4, 2, 98, 0),
(68, 39, 4, 2, 99, 0),
(69, 40, 4, 2, 100, 0),
(70, 23, 4, 2, 101, 0),
(71, 24, 4, 2, 29, 0),
(72, 11, 4, 2, 28, 0),
(73, 41, 4, 2, 102, 0),
(74, 66, 4, 2, 33, 0),
(75, 29, 4, 2, 103, 0),
(76, 22, 4, 2, 104, 0),
(77, 33, 4, 2, 40, 0),
(78, 30, 4, 2, 17, 0),
(79, 34, 4, 2, 19, 0),
(80, 26, 4, 2, 105, 0),
(81, 68, 4, 2, 106, 0),
(82, 43, 4, 3, 107, 0),
(83, 20, 4, 3, 108, 0),
(84, 20, 4, 3, 109, 0),
(85, 44, 4, 3, 111, 0),
(86, 45, 4, 3, 112, 0),
(87, 35, 4, 3, 113, 0),
(88, 46, 4, 3, 114, 0),
(89, 47, 4, 3, 115, 0),
(90, 48, 4, 3, 52, 0),
(91, 49, 4, 3, 54, 0),
(92, 50, 4, 3, 55, 0),
(93, 22, 4, 3, 116, 0),
(94, 51, 4, 3, 56, 0),
(95, 52, 4, 3, 57, 0),
(96, 33, 4, 3, 117, 0),
(97, 33, 4, 3, 58, 0),
(98, 53, 4, 3, 17, 0),
(99, 54, 4, 3, 118, 0),
(100, 46, 3, 2, 59, 0),
(101, 60, 3, 2, 60, 0),
(102, 61, 3, 2, 61, 0),
(103, 62, 3, 2, 62, 0),
(104, 23, 3, 2, 63, 0),
(105, 63, 3, 2, 64, 0),
(106, 27, 3, 2, 65, 0),
(107, 64, 3, 2, 66, 0),
(108, 65, 3, 2, 67, 0),
(109, 24, 3, 2, 29, 0),
(110, 11, 3, 2, 28, 0),
(111, 66, 3, 2, 33, 0),
(112, 21, 3, 2, 69, 0),
(113, 26, 3, 2, 31, 0),
(114, 29, 3, 2, 70, 0),
(115, 15, 3, 2, 71, 0),
(116, 33, 3, 2, 72, 0),
(117, 67, 3, 2, 73, 0),
(118, 68, 3, 2, 74, 0),
(119, 12, 3, 2, 75, 0),
(120, 30, 3, 2, 17, 0),
(121, 34, 3, 2, 19, 0),
(122, 55, 3, 2, 76, 0),
(123, 45, 3, 3, 77, 0),
(124, 54, 3, 3, 42, 0),
(125, 20, 3, 3, 43, 0),
(126, 20, 3, 3, 44, 0),
(127, 43, 3, 3, 46, 0),
(128, 63, 3, 3, 82, 0),
(129, 69, 3, 3, 83, 0),
(130, 65, 3, 3, 84, 0),
(131, 64, 3, 3, 85, 0),
(132, 49, 3, 3, 54, 0),
(133, 48, 3, 3, 52, 0),
(134, 57, 3, 3, 51, 0),
(135, 43, 3, 3, 87, 0),
(136, 57, 3, 3, 88, 0),
(137, 70, 3, 3, 89, 0),
(138, 50, 3, 3, 55, 0),
(139, 51, 3, 3, 56, 0),
(140, 44, 3, 3, 91, 0),
(141, 52, 3, 3, 57, 0),
(142, 53, 3, 3, 17, 0),
(143, 45, 5, 4, 139, 0),
(144, 76, 5, 4, 140, 0),
(145, 77, 5, 4, 141, 0),
(146, 78, 5, 4, 142, 0),
(147, 46, 5, 4, 143, 0),
(148, 68, 5, 4, 144, 0),
(149, 79, 5, 4, 145, 0),
(150, 43, 5, 4, 146, 0),
(151, 58, 5, 4, 147, 0),
(152, 46, 5, 4, 148, 0),
(153, 57, 5, 4, 149, 0),
(154, 80, 5, 4, 150, 0),
(155, 71, 5, 5, 120, 0),
(156, 72, 5, 5, 121, 0),
(157, 73, 5, 5, 122, 0),
(158, 74, 5, 5, 123, 0),
(159, 74, 5, 5, 124, 0),
(160, 57, 5, 5, 125, 0),
(161, 75, 5, 5, 126, 0),
(162, 26, 5, 5, 127, 0),
(163, 71, 5, 5, 128, 0),
(164, 72, 2, 1, 144, 0);

-- --------------------------------------------------------

--
-- Structure de la table `msg_des_enseignant`
--

DROP TABLE IF EXISTS `msg_des_enseignant`;
CREATE TABLE IF NOT EXISTS `msg_des_enseignant` (
  `IDmsg_des_enseignant` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT '1000-01-01',
  `Heure` time DEFAULT '00:00:00',
  `Message` longtext,
  `IDExpediteur` bigint(20) DEFAULT '0',
  `IDDestinataire` bigint(20) DEFAULT '0',
  `Vu` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDmsg_des_enseignant`),
  KEY `Date` (`Date`),
  KEY `IDExpediteur` (`IDExpediteur`),
  KEY `IDDestinataire` (`IDDestinataire`),
  KEY `Vu` (`Vu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `msg_enseignant`
--

DROP TABLE IF EXISTS `msg_enseignant`;
CREATE TABLE IF NOT EXISTS `msg_enseignant` (
  `IDmsg_enseignant` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT '1000-01-01',
  `Heure` time DEFAULT '00:00:00',
  `Message` longtext,
  `IDExpediteur` bigint(20) DEFAULT '0',
  `IDDestinataire` bigint(20) DEFAULT '0',
  `Vu` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDmsg_enseignant`),
  KEY `Date` (`Date`),
  KEY `IDExpediteur` (`IDExpediteur`),
  KEY `IDDestinataire` (`IDDestinataire`),
  KEY `Vu` (`Vu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `msg_enseignant`
--

INSERT INTO `msg_enseignant` (`IDmsg_enseignant`, `Date`, `Heure`, `Message`, `IDExpediteur`, `IDDestinataire`, `Vu`) VALUES
(1, '2022-02-02', '22:30:54', 'Lorem', 1, 45, NULL),
(2, '2022-02-02', '22:34:39', 'lorem\n', 1, 45, 0),
(3, '2022-02-02', '22:35:38', 'lorem', 1, 45, 0),
(4, '2022-02-03', '12:45:40', 'Bonjour Sohary', 1, 45, 0),
(5, '2022-02-04', '05:27:37', 'sdfsfs', 1, 45, 0);

-- --------------------------------------------------------

--
-- Structure de la table `msg_etudiant`
--

DROP TABLE IF EXISTS `msg_etudiant`;
CREATE TABLE IF NOT EXISTS `msg_etudiant` (
  `IDmsg_etudiant` bigint(20) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT '1000-01-01',
  `Heure` time DEFAULT '00:00:00',
  `Message` longtext,
  `IDExpediteur` bigint(20) DEFAULT '0',
  `IDDestinataire` bigint(20) DEFAULT '0',
  `Vu` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDmsg_etudiant`),
  KEY `Date` (`Date`),
  KEY `IDExpediteur` (`IDExpediteur`),
  KEY `IDDestinataire` (`IDDestinataire`),
  KEY `Vu` (`Vu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
CREATE TABLE IF NOT EXISTS `niveau` (
  `IDNiveau` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(10) DEFAULT '',
  `Suppr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDNiveau`),
  KEY `Nom` (`Nom`),
  KEY `Suppr` (`Suppr`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`IDNiveau`, `Nom`, `Suppr`) VALUES
(1, 'L1', 0),
(2, 'L2', 0),
(3, 'L3', 0),
(4, 'M1', 0),
(5, 'M2', 0);

-- --------------------------------------------------------

--
-- Structure de la table `parcours`
--

DROP TABLE IF EXISTS `parcours`;
CREATE TABLE IF NOT EXISTS `parcours` (
  `IDParcours` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) DEFAULT '',
  `Suppr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDParcours`),
  KEY `Nom` (`Nom`),
  KEY `Suppr` (`Suppr`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `parcours`
--

INSERT INTO `parcours` (`IDParcours`, `Nom`, `Suppr`) VALUES
(1, 'TRONC COMMUN', 0),
(2, 'ASSISTANT SOCIAL', 0),
(3, 'ANIMATEUR DE DEVELOPPEMENT SOCIAL', 0),
(4, 'EDUCATEUR SPECIALISE', 0),
(5, 'MASTER TC', 0),
(6, 'ENCADREMENT', 1),
(7, 'TC 3', 0);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `IDProfesseur` bigint(20) NOT NULL AUTO_INCREMENT,
  `Code` varchar(50) DEFAULT '',
  `Civilite_num` tinyint(3) UNSIGNED DEFAULT '0',
  `Civilite` varchar(4) DEFAULT '',
  `Nom` varchar(50) DEFAULT '',
  `Prenom` varchar(50) DEFAULT '',
  `dateNaiss` date DEFAULT NULL,
  `Contact` varchar(50) DEFAULT '',
  `Email` varchar(50) DEFAULT '',
  `Motdepasse` varchar(50) DEFAULT '',
  `Formateur` varchar(50) DEFAULT '',
  `A_creer` tinyint(4) DEFAULT '0',
  `Suppr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDProfesseur`),
  UNIQUE KEY `Code` (`Code`),
  KEY `Formateur` (`Formateur`),
  KEY `A_creer` (`A_creer`),
  KEY `Suppr` (`Suppr`),
  KEY `NomPrenom` (`Nom`,`Prenom`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`IDProfesseur`, `Code`, `Civilite_num`, `Civilite`, `Nom`, `Prenom`, `dateNaiss`, `Contact`, `Email`, `Motdepasse`, `Formateur`, `A_creer`, `Suppr`) VALUES
(1, 'PFR', 4, 'Mme', 'RASOAMANARIVO ', 'Victorine ', '1990-05-03', '', '', '00', '1', 1, 0),
(2, 'PFTAHL1010102', 4, 'Sr', 'TAHIRINIAINA', 'Léa ', '1010-10-10', '', '', '0000', '1', 1, 0),
(3, 'PFRAHO1010103', 7, 'Mme', 'RAHAINGOMALALA', 'Onja Hortense', '1010-10-10', '', '', '0000', '1', 1, 0),
(4, 'PFSOLJ1010104', 6, 'Mr', 'SOLONDRAIBE ', 'Jocelyn', '1010-10-10', '', '', '0000', '2', 1, 0),
(5, 'PFANDV1010105', 7, 'Mme', 'ANDRIANARISAONA ', 'Voahiranirina ', '1010-10-10', '', '', '0000', '2', 1, 0),
(6, 'PFRAKH1010106', 5, 'Fr', 'RAKOTOMALALA ', 'Herinirina J. Christien  ', '1010-10-10', '', '', '0000', '2', 1, 0),
(7, 'PFRAHC1010107', 4, 'Sr', 'RAHELIARISOA', 'Claudine ', '1010-10-10', '', '', '0000', '2', 1, 0),
(8, 'PFRATM1010108', 6, 'Mr', 'RATSIMA ', 'Marcel ', '1010-10-10', '', '', '0000', '2', 1, 0),
(9, 'PFANDF1010109', 7, 'Mme', 'ANDRIANARISOA ', 'Fenitra ', '1010-10-10', '', '', '0000', '2', 1, 0),
(10, 'PFANDL10101010', 7, 'Mme', 'ANDRIAMIFIDY ', 'Liantsoa ', '1010-10-10', '', '', '0000', '2', 1, 0),
(11, 'PFANDS10101011', 6, 'Mr', 'ANDRIAMBOLOLOTSALAMA ', 'Sarobidy ', '1010-10-10', '', '', '0000', '2', 1, 0),
(12, 'PFRASM10101012', 4, 'Sr', 'RASOARISOA ', 'Marie Aimée', '1010-10-10', '', '', '0000', '2', 1, 0),
(13, 'PFRANS10101013', 6, 'Mr', 'RANDRIANAVAHY ', 'Samy ', '1010-10-10', '', '', '0000', '2', 1, 0),
(14, 'PFRAZH10101014', 7, 'Mme', 'RAZANDRAINY', 'Holiniaina ', '1010-10-10', '', '', '0000', '2', 1, 0),
(15, 'PFRASL10101015', 6, 'Mr', 'RASOLOFOMANANA', 'Léonide ', '1010-10-10', '', '', '0000', '2', 1, 0),
(16, 'PFRAKN10101016', 6, 'Mr', 'RAKOTOMAHAFALY ', 'Norbert Eugène ', '1010-10-10', '', '', '0000', '2', 1, 0),
(17, 'PFRAZZ10101017', 8, 'Mlle', 'RAZANAMDIMBY ', 'Zara Natolotra ', '1010-10-10', '', '', '0000', '2', 1, 0),
(18, 'PFANDH10101018', 6, 'Mr', 'ANDRIANARISOA ', 'Haga ', '1010-10-10', '', '', '0000', '1', 1, 0),
(19, 'PFRAZM10101019', 7, 'Mme', 'RAZANAMALALA ', 'Marie Isabelle Aimée', '1010-10-10', '', '', '0000', '1', 1, 0),
(20, 'PFRAVM10101020', 4, 'Sr', 'RAVAOSOLO ', 'Marie Madeleine', '1010-10-10', '', '', '0000', '2', 1, 0),
(21, 'PFRANM10101021', 6, 'Mr', 'RANDRIANARISON ', 'Maminirina', '1010-10-10', '', '', '0000', '2', 1, 0),
(22, 'PFRASM10101022', 7, 'Mme', 'RASOANIRINA ', 'Marguerite', '1010-10-10', '', '', '0000', '2', 1, 0),
(23, 'PFRASM10101023', 7, 'Mme', 'RASOLONJATOVO ', 'Marie Joh', '1010-10-10', '', '', '0000', '2', 1, 0),
(24, 'PFRASO10101024', 2, 'Dr', 'RASOARIMANANTANY ', 'Odile Vololonirina', '1010-10-10', '', '', '0000', '2', 1, 0),
(25, 'PFRAKB10101025', 7, 'Mme', 'RAKOTOARISOA  ', 'Baolalao Emma', '1010-10-10', '', '', '0000', '2', 1, 0),
(26, 'PFRALP10101026', 6, 'Mr', 'RALAMBOMANANTSOA ', 'Patrick Joel ', '1010-10-10', '', '', '0000', '2', 1, 0),
(27, 'PFANDJ10101027', 6, 'Mr', 'ANDRIAMANAJARA ', 'Jean Fidèle', '1010-10-10', '', '', '0000', '1', 1, 0),
(28, 'PFRAML10101028', 6, 'Mr', 'RAMBELOMANANA ', 'Landry', '1010-10-10', '', '', '0000', '2', 1, 0),
(29, 'PFRANJ10101029', 6, 'Mr', 'RANDRIARINAIVO ', 'Jerôme Michael ', '1010-10-10', '', '', '0000', '2', 1, 0),
(30, 'PFSOAE10101030', 7, 'Mme', 'SOANOMENANDRASANA', 'Elpascia', '1010-10-10', '', '', '0000', '2', 1, 0),
(31, 'PFEMMA10101031', 7, 'Mme', 'EMMA', '', '1010-10-10', '', '', '0000', '2', 1, 0),
(32, 'PFRAVJ10101032', 2, 'Dr', 'RAVELOSONA', 'Josselin', '1010-10-10', '', '', '0000', '2', 1, 0),
(33, 'PFRASA10101033', 6, 'Mr', 'RASAMOELY ', 'Andriamihaja Hervé', '1010-10-10', '', '', '0000', '2', 1, 0),
(34, 'PFFABM10101034', 6, 'Mr', 'FABRIOLAH  ', 'Morady Kanoso', '1010-10-10', '', '', '0000', '2', 1, 0),
(35, 'PFRATC10101035', 6, 'Mr', 'RATOVONDRAHONA ', 'Christian', '1010-10-10', '', '', '0000', '2', 1, 0),
(36, 'PFANDR10101036', 6, 'Mr', 'ANDRIAMAMPIANINA ', 'Rivo', '1010-10-10', '', '', '0000', '2', 1, 0),
(37, 'PFRAKJ10101037', 2, 'Dr', 'RAKOTONIRAINY ', 'Jean Jacques Renaud', '1010-10-10', '', '', '0000', '2', 1, 0),
(38, 'PFRASF10101038', 7, 'Mme', 'RASOAMBOLANORO ', 'Fara', '1010-10-10', '', '', '0000', '1', 1, 0),
(39, 'PFRAMF10101039', 7, 'Mme', 'RAMAROJAONA ', 'Fleur', '1010-10-10', '', '', '0000', '2', 1, 0),
(40, 'PFRANJ10101040', 6, 'Mr', 'RANDRIAMANANTENA ', 'J. de Dieu Donné', '1010-10-10', '', '', '0000', '2', 1, 0),
(41, 'PFRAZK10101041', 6, 'Mr', 'RAZAFIMAHATRATRA ', 'Kleofasy', '1010-10-10', '', '', '0000', '2', 1, 0),
(42, 'PFANDH10101042', 6, 'Mr', 'ANDRIAMIHAJA ', 'Hervé', '1010-10-10', '', '', '0000', '2', 1, 1),
(43, 'PFRAKA10101043', 2, 'Dr', 'RAKOTONANDRASANA ', 'Adolphe', '1010-10-10', '', '', '0000', '2', 1, 0),
(44, 'PFRAKT10101044', 7, 'Mme', 'RAKOTONARIVO', 'Telina ', '1010-10-10', '', '', '0000', '2', 1, 0),
(45, 'PFRAZS10101045', 2, 'Dr', 'RAZANAPARANY ', 'Sohary', '1010-10-10', '', '', '0000', '2', 1, 0),
(46, 'PFRAHV10101046', 7, 'Mme', 'RAHARINATOANDRO ', 'Voahangimandimby', '1010-10-10', '', '', '0000', '2', 1, 0),
(47, 'PFRAIR10101047', 6, 'Mr', 'RAINISOANGITA ', 'Richard', '1010-10-10', '', '', '0000', '2', 1, 0),
(48, 'PFRAVS10101048', 6, 'Mr', 'RAVOKATRA ', 'Seth', '1010-10-10', '', '', '0000', '2', 1, 0),
(49, 'PFRAZL10101049', 6, 'Mr', 'RAZAFINJATOVO ', 'Lucien', '1010-10-10', '', '', '0000', '2', 1, 0),
(50, 'PFTOMP10101050', 6, 'Mr', 'TOMBOZAFY ', 'Paul', '1010-10-10', '', '', '0000', '2', 1, 0),
(51, 'PFRAKE10101051', 3, 'Pr', 'RAKOTONIRINA ', 'Ephrem', '1010-10-10', '', '', '0000', '2', 1, 0),
(52, 'PFRAKT10101052', 2, 'Dr', 'RAKOTONDRAMIARANA ', 'Tantely Hary Lala', '1010-10-10', '', '', '0000', '2', 1, 0),
(53, 'PFRAMR10101053', 7, 'Mme', 'RAMAROSATA ', 'Rina', '1010-10-10', '', '', '0000', '2', 1, 0),
(54, 'PFRASB10101054', 4, 'Sr', 'RASOAMBOLATIANA ', 'Berthine', '1010-10-10', '', '', '0000', '1', 1, 0),
(55, 'PFRAVA10101055', 8, 'Mlle', 'RAVAOHARISOA ', 'Alphonsine', '1010-10-10', '', '', '0000', '1', 1, 0),
(56, 'PFRAJL10101056', 6, 'Mr', 'RAJAOFARA ', 'Lova', '1010-10-10', '', '', '0000', '2', 1, 0),
(57, 'PFRAMH10101057', 6, 'Mr', 'RAMANITRINIAINA A. ', 'Hoby', '1010-10-10', '', '', '0000', '2', 1, 0),
(58, 'PFRANE10101058', 2, 'Dr', 'RANDRIANARIVONY ', 'Elisée', '1010-10-10', '', '', '0000', '2', 1, 0),
(59, 'PFRAJB10101059', 3, 'Pr', 'RAJAONARISON ', 'Bertille ', '1010-10-10', '', '', '0000', '2', 1, 0),
(60, 'PFBETS10101060', 6, 'Mr', 'BETSY VONONA RAKOTONIAINA', '', '1010-10-10', '', '', '0000', '2', 1, 0),
(61, 'PFRAZT10101061', 6, 'Mr', 'RAZAFINDRADIMY', 'Toj’ Hery Patrick ', '1010-10-10', '', '', '0000', '2', 1, 0),
(62, 'PFRAKJ10101062', 6, 'Mr', 'RAKOTONJANAHARY ', 'Joseph', '1010-10-10', '', '', '0000', '1', 1, 0),
(63, 'PFRAHS10101063', 7, 'Mme', 'RAHANTANIAINA ', 'Samueline Lydia ', '1010-10-10', '', '', '0000', '2', 1, 0),
(64, 'PFMAMM10101064', 6, 'Mr', 'MAMENOSOA ', 'Michel', '1010-10-10', '', '', '0000', '2', 1, 0),
(65, 'PFRANE10101065', 6, 'Mr', 'RANDRIANARISON ', 'Eric', '1010-10-10', '', '', '0000', '2', 1, 0),
(66, 'PFRAKK10101066', 7, 'Mme', 'RAKOTONIRINA', 'Katia Mahery', '1010-10-10', '', '', '0000', '2', 1, 0),
(67, 'PFRAKT10101067', 6, 'Mr', 'RAKOTONANDRASANA  ', 'Toky ', '1010-10-10', '', '', '0000', '2', 1, 0),
(68, 'PFRAKS10101068', 6, 'Mr', 'RAKOTOARISOA ', 'Samimanana ', '1010-10-10', '', '', '0000', '2', 1, 0),
(69, 'PFRADS10101069', 6, 'Mr', 'RADY ', 'Sambahoelinajoro Gaëtan  ', '1010-10-10', '', '', '0000', '2', 1, 0),
(70, 'PFNAJO10101070', 6, 'Mr', 'NAJORO', '', '1010-10-10', '', '', '0000', '2', 1, 0),
(71, 'PFRAZM10101071', 2, 'Dr', 'RAZANAMANANA ', 'Marie Jeanne', '1010-10-10', '', '', '0000', '2', 1, 0),
(72, 'PFANDM10101072', 2, 'Dr', 'ANDRIAMIZAKA  ', 'Marc ', '1010-10-10', '', '', '0000', '2', 1, 0),
(73, 'PFBENF10101073', 3, 'Pr', 'BENOLO ', 'François ', '1010-10-10', '', '', '0000', '2', 1, 0),
(74, 'PFRAZJ10101074', 3, 'Pr', 'RAZAFIDRAIBE  ', 'Jules', '1010-10-10', '', '', '0000', '2', 1, 0),
(75, 'PFBEHA10101075', 2, 'Dr', 'BEHAJA', 'Alane ', '1010-10-10', '', '', '0000', '2', 1, 0),
(76, 'PFRAFI10101076', 2, 'Dr', 'RAFIDIMALALA', 'Isabelle Odette', '1010-10-10', '', '', '0000', '2', 1, 0),
(77, 'PFRANN10101077', 2, 'Dr', 'RANAIVOSON ', 'Narilala Rado  ', '1010-10-10', '', '', '0000', '2', 1, 0),
(78, 'PFRAKZ10101078', 2, 'Dr', 'RAKOTONIERA ', 'Zoly', '1010-10-10', '', '', '0000', '2', 1, 0),
(79, 'PFRABT10101079', 2, 'Dr', 'RABENALA ZAFITOMBO ', 'Toussaint Marie Xavier', '1010-10-10', '', '', '0000', '2', 1, 0),
(80, 'PFRANH10101080', 2, 'Dr', 'RANDRIAMIARISOANDRAIBE ', 'Herimanana', '1010-10-10', '', '', '0000', '2', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `question_type`
--

DROP TABLE IF EXISTS `question_type`;
CREATE TABLE IF NOT EXISTS `question_type` (
  `idtype` int(1) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`idtype`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `question_type`
--

INSERT INTO `question_type` (`idtype`, `type`) VALUES
(1, 'Simple'),
(2, 'Choix unique'),
(3, 'Choix multiple');

-- --------------------------------------------------------

--
-- Structure de la table `responsabilite`
--

DROP TABLE IF EXISTS `responsabilite`;
CREATE TABLE IF NOT EXISTS `responsabilite` (
  `IDresponsabilite` bigint(20) NOT NULL AUTO_INCREMENT,
  `IDProfesseur` bigint(20) DEFAULT '0',
  `IDParcours` bigint(20) DEFAULT '0',
  PRIMARY KEY (`IDresponsabilite`),
  KEY `IDProfesseur` (`IDProfesseur`),
  KEY `IDParcours` (`IDParcours`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `responsabilite`
--

INSERT INTO `responsabilite` (`IDresponsabilite`, `IDProfesseur`, `IDParcours`) VALUES
(1, 55, 3),
(2, 38, 4),
(3, 19, 2),
(4, 27, 1),
(5, 3, 1),
(7, 1, 5),
(8, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `token`
--

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `idtoken` bigint(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `datet` date NOT NULL,
  `code` varchar(20) NOT NULL,
  PRIMARY KEY (`idtoken`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `token`
--

INSERT INTO `token` (`idtoken`, `token`, `datet`, `code`) VALUES
(0000000001, '813723d5fa01ab61988bd2ac97a60c3d92531d7d28a82a239868750af367f15264aaa02525291b3f846093537d2409705432b2953a235dd4581cc1f9956374b7', '2021-12-24', 'PFR'),
(0000000002, 'bb62f393ace0113b09d1fd15dca7584b48af8053efa0a72131f274f3595d86978b7ed1e25ccc95944f73b5f6a8b8489ec1a7c6009cab21b5d6e6220404c7f78b', '2021-12-25', 'PFR'),
(0000000004, '0982d332482d4783f3571a7363509baf4cfb3f058a98e61df8811304ff8adecfed9447356737f9f6fca273fcd5779d85b087fecde7cd683c94875ad4b75341e1', '2021-12-25', 'PFR'),
(0000000006, 'cc6b928a05fae5616f50f3f1faf91215874a7039d43070f6bad30cbf936551fe4ce62097818866225574a779d399d96c066c1d7e25ca682b8ceefd9bbd900f78', '2021-12-28', 'PFR'),
(0000000007, '33655e2d81a06f2d402c0e9b525595af6c54918ebb69efa2ad2d8fabc530d192be0814a434755246912dfc83d64eeac798cebe3b707cd510e25c8803f631fd1e', '2021-12-29', 'ADD'),
(0000000008, 'b68f28ae3976d77c6e654d7497ca5c691962f387e8969f12a6cb6191c05cf300ea483fe41a28e5201e8e0d4e8328dcc1944f56595c86652d838c8f3c7ec06be0', '2021-12-29', 'ADD'),
(0000000009, '64f2911cb9c2151a7ed72040766a62633718bff474772c3dc5b1b6ae6030bdd6405e5a776e83dae519ba534e74eb411d0063fc00290563c24f730f594fb4532b', '2021-12-29', 'ADD'),
(0000000010, 'ae309f3bd8437892d207bb4ca9c4b7c06374ee6fe60ff3987098b6e2a80836047cf1138b0276646c7c2a1c17947693723cfd12ce64d644c0755e7d171869a48e', '2021-12-29', 'ADD'),
(0000000011, 'b9a4a6c6a3098c2da65ef2e67770acf239e77967828269eea942f939e6a444e5e3d29986804c0cd742d3c00ead800472056aae0900304aa37ce78160f1c39c53', '2021-12-29', 'ADD'),
(0000000012, '8019919d87eac15acc03e89c6ee380013e4745b9ddcbfa33b4b9117934b2ca4c01580814971135f83ee44902db8b66c21b735e7d1724af3878871b8a17db5b76', '2021-12-29', 'ADD'),
(0000000013, '7442be14778ff1ae8bec3b5651b8b38ae7f705ef47fd3376999ae6e944749d9626313aa81d9314e93c301eaec9d66724bf7750db73708e364063179d72f3615a', '2021-12-29', 'ADD'),
(0000000014, '4272faa0c0fa03fc4cca829df20286a1cb25b020ec8e330fe3fcd98210b13648910674e66f01eb4d61d612cee7f23bcf30746a91016d359a4ef9d0ecd6652130', '2021-12-29', 'ADD'),
(0000000018, '6d150b9a9ae341c0890c521878dd9c1c7ff4e7f9918e0187fe2fb00d7a3b288fbb80947828ad776298c9aca50689e2dd4eab07283813bdd15c3342296e80231b', '2022-01-05', 'PFR'),
(0000000020, '66e24ff09ef016588609b9e00d56c7181e796f51c5d146de73dd3571750d70ac4fc6fa648b6b79c4d098abd43984f418f1f03285e55d5c016d744cbaf9761341', '2022-01-05', 'PFR'),
(0000000021, '116619fcdb6ed8e106dee5afb1a8012f7dd3e196e9c15d993919e6a55ed5d371665d7526eaa1ed4fc55cfbcdb1f77965bebdf07c7b9376d486c80f537e05af3a', '2022-01-12', 'PFR'),
(0000000022, '33ab2e1407b4f165c0e66c3fd1bc35f582b835edf1175fd895d52403d880d14d0b7ba40cd223c302614259e2bccf40cde0d16dcdc330decb56b7e4244e3d54f0', '2022-01-12', 'PFR'),
(0000000023, 'bc1222e5e8853060e3bbd3bc9c98e9f487cdafb9b0800c737d69fe0a2a90a2ca8d7d83121faabe4c345c5806419ab7e2b7b2e0e77751841c8a5e0052b85e7376', '2022-01-12', 'PFR'),
(0000000024, '98acbe6abf20b2e71d43dc15e8879c98b1883574f97fb7012b05f1baecc841fc81a2f80c77602ae433cde90b3cc6b5ccddd1cb49986ba04eb9c8f0b4d833e72c', '2022-01-12', 'PFR'),
(0000000025, '7850ac9195f0df94627968ea40ffce136b456a5be18dd54fcc2986b55a2c51df2498a8eb1967a3caa55542d6ead9cf503b2d9159a02ef13ecfcbdc70d7dad4e9', '2022-01-12', 'PFR'),
(0000000026, '3356c7e4f45b488d9bc5e5a0d355bbe75e4ff5e2c5ce4b73d62f171740311cd88bf0f2f42943bff770f9da5e4015fc6a9d6ecaa89a78aa14683154cf48ae82dd', '2022-01-13', 'PFR'),
(0000000027, '586c54d23f8e6fe7773f809501dbcf6be1d18262129bcd7506eadf8dddbf11025e402a0cc2e637cd769b3be32394fb22dbd68395673d8e9d57b6fe4db03f2a4d', '2022-01-13', 'PFR'),
(0000000028, '9449f683a4566651fc1ce3e4a7d6f11f9b8f1efdfd659b5a916d74c5c93af854bfdbd247d238ca9107de6a7bedc0b073b8863a8646fa329ee666dcb5aa7f1cfc', '2022-01-13', 'PFR'),
(0000000029, '058c4624b295f35e2de27bc464315321b635f6fef3e81c9828382eca7a104240572bb7e27674fa1512fed329d4d18f2ad8f31fb2ac919f2d6676c0c5411e09a3', '2022-01-13', 'PFR'),
(0000000030, '794e44fbba8575f6e9bdb0e7d100145e18f1d3ff99d02a69572a2bd0c49d1e13e7ceaf8d0766166fc4d4fc51330e71b9d4be61040390935c4315774a87fe36c4', '2022-01-14', 'PFR'),
(0000000031, '4f8a0aa5eab3e849e0f493f465448e4d124049c0ebd2c137144a05d87677e1a7e24c59de6f689113d401b90134b5906ad777f38f766bbde273126dd2a6a18191', '2022-01-14', 'PFR'),
(0000000034, '4b25669b95052ed759298da1596716cbf25d80b9a0a2a209c697807f47339d27184e8067a1491229e5e30ab25a2bc48b0ceaab99643cc5c923f62156a8649319', '2022-01-14', 'ETA'),
(0000000039, '1341347e76be7dcefa55f7bc660957209192cd44fb2fb5bc85f50bf2202b3b455dac6c5711d341dc561d66f8cdbfb39f98aa6858ad13ce4a18edde35cda0ad5c', '2022-01-14', 'ETA'),
(0000000041, '23d13ff6b4d3b831572946e5e6bf4685eff813c9048569b321b02251067d060d371f7edbf7cc6a5b18ffeabdb62be208c2215f39d1effb4eb7776ee1e64df958', '2022-01-14', 'PFR'),
(0000000042, '4ed1340efc9184946365ceccad084315d6e701b1ad8c392f7f37de335b2aa8b49306fca1940fb373a0cc761a498591d4bef6c9f17ae7f85a2c5e6b9bf323151c', '2022-01-17', 'PFR'),
(0000000043, 'afc466d2fff60cf3074fa3cb63ea5d1715d4cd5220730c7784d42201139a67e093c4724644994d07823680bbeb81e9c33d07c9b3abc00d97fd5bfea6681bb5fc', '2022-01-17', 'PFR'),
(0000000048, 'a00b3d6eb9be9fd736b3a403fdb8acf5a4d97788e209079f470329792b31123ce12d8112647f2b35437edb9f3f2be02cee65e4adbf11fd3f612d4d40b2f7ed7d', '2022-01-17', 'ETA'),
(0000000049, '4517031ef05d99f32f1d1f40706314e78520f7c8542f05cbeef58ae8c6c12a086bef6ad0b925433ba4f0fd27f2c463cf4dfac1b803ba1e35f8d76efac6c39475', '2022-01-17', 'PFR'),
(0000000053, '152c1b0c2128f725030a161b65a76e97c9ae7b6213fc0b8833242a8a881c86ea6260b3bc59a5dcd6c0366d71bc7c3993b727d23e31abc6dfa59fc2b52168b150', '2022-01-17', 'ETA'),
(0000000054, 'df3d6bdcc72c12ea456ba0777478ad8d04655117e2cb9635939ebcc9e8619f54f7179987507996d1b305204b4beee01b6309a805a0faa23bc650447868aa3712', '2022-01-17', 'ETA'),
(0000000058, 'bba13c0b7b4e3049eb1dceece893f94e5cf4c198800cd3d006f9f677f27bbfda7fe0ff58b0996ae0b2f524beb566d07503cb5ab6d32afd5ff4867ca1dec1c209', '2022-01-17', 'ETA'),
(0000000060, 'e38e823b1677f9d41bdde505eef73a2a70c29919c92e0c6b025b3774ed4312929dad91d7373c974773c5e57bbe91b84de923ff4e004387bfd7aa2cf10ac16d52', '2022-01-18', 'ETA'),
(0000000062, '9c46e0db2d5982dd0561cac9859a562d8249ab4c353d8404467f84f7b91cb04685a1a0b3793fc9202d02b02c567c32982aa18579e4317e5c16fb09acfba20884', '2022-01-18', 'ETA'),
(0000000063, '8a79489ed31c80a4af53127452857a8d0a33d6f7678d4b8f5eddf193183a7af917dbae41db125af48a24038b2b397283c1de9aec2d8e3cad331211fcff31a3e0', '2022-01-19', 'ETA'),
(0000000064, 'da957bf81438c9eae7206504affb2ae80dde3ee7fe014192af40995fdb674a1837c77000610159bd4554516125672e8ac815cefcf7c47684a436bd52ab22e4f8', '2022-01-19', 'ETA'),
(0000000065, 'cc9e2091f6c029e8646e06336da3a87415577f15ebc05c8980aaa67ef9bcf4d57453728b09b703697c7be76ba1499b3b81d215afe74ef3d8897f02bb5669704f', '2022-01-19', 'ETA'),
(0000000066, '18b8202b1bbd0719686ccc3fade1b3063c1428eb55c0c021ff590df12ce8c27c1124b48748a65a1e186e5ead409a4d60a7e1bd00cc650c026692e7f3c121997a', '2022-01-19', 'ETA'),
(0000000067, '558c9e20b00fbc4561595101f7d2a04f85116280a056770387bf296148f4c2297eee732f28234a8f2ee81706dabc6b50cdf527ac92056bf4bd465db8be097303', '2022-01-19', 'ETA'),
(0000000072, '74c9a0b2dd7d91fa99256d93dfe4c0290ba2ef9de094be1aa58ca8732df20398eac16013bde9c861e113c9241e12ef937d62caf65ee8ec5fdc9b06d046c674b7', '2022-01-19', 'ETA'),
(0000000073, '3a94419b948f0f67d1fa1509f078a3883b3a89c42fb795051813c80435184d579f0c61d92aa12d3f451f1b5dbc5373129c49ee804fee3c8fbc23f53df33a0d63', '2022-01-19', 'ETA'),
(0000000075, 'a82cf4443f188229bee92e6b815a31eb029c45c08e049ef04283be75e6fadb9a0173b77d201e791ffc35d041f2440ab9717917e6b704379ff2d51bed8f3fafe5', '2022-01-20', 'PFR'),
(0000000079, 'ab174c33f3f09431d8f289d28a59359c6a64909c15655f4d76449a82872adb0ff072bb9ccb2303f06a4a355c99c89f28663ad3596478c59ab860fdccc21070c4', '2022-01-20', 'ETA'),
(0000000086, '693b8f9a33f2b0b70d5146853093881e1173336bcdcca8a9d6381e3c1bc46108d61e16a15c460f4d3ff47f85d715d4a354e72560fa835e210c7ce859815170ca', '2022-01-20', 'ETAN'),
(0000000097, 'c96dadeef6c6ae5d42bbf6f1782702ad3c3d6d690cac77a963e49027a4c0edf6121d30cb71dbdd7b011013936ce4d749765dd1e1042021791d15c9a0053c5318', '2022-01-20', 'ETA'),
(0000000099, '72b4902be3fb130804efb6606aa67398e3f19e1dfff561f4bb44178c7f840e9abe2d44ad385256f15fae57eed44478e5d63fb17c483594b1d883c93a7ee31719', '2022-01-20', 'ETA'),
(0000000107, '7c1483b0d09d4989685243ed72ef264f90e7aebf7696fa5cb52e58ff025af7f3de78f1dd0c5d0e83f8b515a8da4d274eb21d370b465c0bd3b4e64d874ae51edf', '2022-01-20', 'ETA'),
(0000000120, 'adee263a747050ac7fa33fa1e4a927d64cbb5edccb9dc5b77df3cfefbad10f4f713e0cbe7ab4b53ce21eaa68719b3670d9e8d1187e560b25b522203bb768521d', '2022-01-20', 'ETA'),
(0000000121, '3d2c5b48ebf036e5a1863c2217dadac2d632841aa91528bf11eb44f0445a62d0ff98f910552892f09b790259bc3c087f5da6756b66a8bd506e36669da58a54f3', '2022-01-21', 'ETA'),
(0000000123, '4b0bdf0754dc0c0f0d83647ecd5ed0ea49020ebd6efd72d762d36d70e3d835330b66bf21a42e2cc9ae37392573e7a2345986a0ec281f88f51d91be5166df8865', '2022-01-21', 'PFR'),
(0000000125, '3a924754148fe833a31704adbb4e4c4542d46a1547a80fd31842b6a4413f4b6ced4663e02485a17805c508f1858e592a37bfe946005a1cb0e7cbdb0adacf2382', '2022-01-21', 'PFR'),
(0000000127, '0607c05456cf4d82050aa86d63a887309e03088c21ef309c5178c78be0a28e348ad0f00a43eaedba781e06cfc464ef2d71cdf8f917877b8c081d11f56c8db2ef', '2022-01-21', 'PFR'),
(0000000128, '4de9ef3ff09cbe0c5c92bb926dbd5527cd557b4cf115316768b9d8c83896327d6bedb3fc883ba972938522b0e6e7074949d883349814feef96aa43917323c2db', '2022-01-21', 'PFR'),
(0000000129, 'bae5bd277b107db73be4e882208c6ba82745f936d4ef63b53f12ecd5bd06466a9fbb366483360a88b0992f568302cbe82daff613a82d4db8e64bd82432655c77', '2022-01-21', 'PFR'),
(0000000131, 'a9edc771bc89f0514e065623f895c2eb37c715c7c22e027f19f2bbbe27f93923a4a0fbfb56db5680a969ee9e79356350a49f67206ac00025dd62c45c21ed91bd', '2022-01-21', 'ETA'),
(0000000133, 'a7c0f28092f77e475c798e653e791c5456e6d4ffec7826d19c684aa4ffecb3c3967bce1374d721a44bd18705d82957f4bcc4691493c1c59e50105aa80ad4042a', '2022-01-28', 'ETA'),
(0000000134, '75f9646df2d56ed20f0b7fb85879e65c135ae4674be9c099b530b6a2153b5b753476b97608d965470ce9c4a243334559932730a4ebc835f66e794dd4eefc693a', '2022-01-30', 'ETA'),
(0000000135, '8ea4ceaff8203c14919d1a91567e57c4edfc14cf5e1ab738b30e1ec6c27391e640fa03ebed23211477bc4ed4a8d2deb3517ec422af954c59ad3a83ee37e3ea42', '2022-01-28', 'ETA'),
(0000000136, '70f987d0fd8e87142d00545d3de66d2037d0f1955d6f21391347eec9e747e67d4d1a0a51764a77a306c1a7a4be25cae6ec91ecc031088e3e56685495c082da85', '2022-01-28', 'ETA'),
(0000000137, '8c0bba78932947b0ea260bac5b262048afdd2d4608d88b2279b1a539dba5227d4773b1f5d0d7d082e9d260814009b0c64703fa100c833056f7a9f3de504cd269', '2022-01-24', 'ETA'),
(0000000138, '8498969cd0d190f1108f7030f7b7632b16b0baee94ec8b38061d23979db8a230d1b8a1d2a2a4440a3d3c9ec6f5277d494c30b67bbb98b317ab3e280a41e0fbc5', '2022-01-24', 'ETA'),
(0000000139, '6695e21009ce8e4fd811dc8bc0f69d118eedb23805469996b46ea0cb0a746bc882340be35e215c4bb6c723e475248fa3d235c9f33ba674628b865a576793a7fe', '2022-01-24', 'ETA'),
(0000000140, '012bfe4404c644536e6e965e217c71e1e5597161ea4c57fb8b4cafdd5c7097fb1d58ecb0490bbe378e06a09ed9f326c21aa9429df5cc614b9b9fb7ef0adf013c', '2022-01-25', 'ETA'),
(0000000141, '8a84e8ed1ddfe3839e2ffe9805cb5a3b574eee658e575347101326047299569479a7a3b27e00902772a4c8a608d8872865f091b38f1141db28775f82d245b638', '2022-01-25', 'ETA'),
(0000000144, '1e9f3dc455cf77cc5de09e2dc9c188b8bbdb411c8967fdc80326129ffef9f2348beacc7bb032ef7a10637b1a08f37163c303b83201100e1a9401a2d453f1b455', '2022-01-26', 'ETA'),
(0000000145, '6817e0046c6a224eaa2b4a1aa89fec9840a5a72aceec4e3522ffb1a14396971cae497b959200f773fbdb27c97a3f5a78b78e4b0abd2172b5ddcdac5e3307fef1', '2022-01-27', 'ETA'),
(0000000146, 'a0aca93f0c24e336ad4a1eb75d32d364f60dc826798a8e8b3982262cd3f21488e58769b8fda6cd02883f52c0fdd2878f03a6f55c29b04c2a19ac584d6656bcd1', '2022-01-27', 'ETA'),
(0000000149, 'b6635d2bfab968fc728cfee4d7481fd3a098545aec9826decf8a86325981edf5aae6f998b331ab5d9379763f53657c6de4d80d99f3b0e609904b0efad450d659', '2022-01-28', 'ETA'),
(0000000150, '80ff3f6bbfb2ce7a8c511ac673c262f3cc201fe18811339d9b0758b186ec17f443bd008cd38edfb7179d21fe5a80389ba6f50282e9a52c6d8404c010eacd8b75', '2022-01-28', 'ETA'),
(0000000151, 'd9e77abf42855203443a1b3034790e6c0d546bbb613492bdbe1431bfaf57ea69098b0948a121298d550c537edd704a63921741849e2199170570bd1f9672c86f', '2022-01-28', 'PFR'),
(0000000152, '354f5257f45a233469926ecf5a58e2ef936c116edee96cff40be345193f68a1cfd0b4b71e627d5638f140263cece72993a2e29a8600a14557b99477964b5325a', '2022-01-29', 'ETA'),
(0000000154, '966fb67ef476e486bf6c13885b4d506b2988f466b86b06daf79d744ac017ee7e77815c9776cccb895623b5e3335e2fa7d686222caebae729f0d00953c235cee5', '2022-01-30', 'PFR'),
(0000000157, 'e408590c381693af485e021ae3e4ed2eb72e1971f1ad1332dfc622e95ccb1f69c817f07125763927635121d0a5863627a75a90a8f5d79e04c9a9fbf6fdfce409', '2022-01-30', 'ETA'),
(0000000158, '134ac18ba17b4e2d236a97509bf2676a28568ac6e4d44d3900d07baab476642fa69055f1e29752327307328ee03d8faafd348a80ee22653e78cb7a6769a26e01', '2022-01-31', 'ETA'),
(0000000159, 'cbce5e5a09561abf53d0f46d3e57fb90f64c47ca4ae805eb0b8800d14c4ddfe5722a910fbffc9f67c0857328998d27888e5876683d285e99ca2bb824836b008d', '2022-01-31', 'ETA'),
(0000000160, '2625cd1a6f448b798cd965d02c9aab0ad796a5d44e3b8f458c0f23732cfb43e41d21875e81a04a32fc5162660276da141085648f875d2c3829dae8c1c6d82652', '2022-01-31', 'ETA'),
(0000000173, 'a02d3cc0bd68b6aae7f1ba3e80cb3c507ec77cebfd39454f0fd52f48f283113cc988d77f480994298f4e4a2b42a3413f8d4647c758c0e7ff0cc2ed906e9cfdfb', '2022-01-31', 'PFR'),
(0000000185, 'd4c8c1412d636f2015c18414a4e8b29e7c33c365bdc330779e67da04dbb0a936227f3ddaac8784ff0e2df5009e209ec78c90df0fe8049e7e4c5e7e67f8e8378f', '2022-02-01', 'ETANDH040404310'),
(0000000192, '872849fcfafbfa72b462abac6315b9e97daaa8343a7fe8d4e53ada8befb9dc3445d983e17d6736dd7d46870aae9b72cd682530feaeba6ce478b14dfcf3eb263d', '2022-02-02', 'PFR'),
(0000000197, 'fa3e6210ea3b49b72bdd914b2fbe1e39f990f574b9ab3fb14453ed8fff479abfb2d09a72fd13d7f842c34bc45e83d11acb91ce31d631102fda5d134244604e36', '2022-02-02', 'PFR'),
(0000000198, '3d96b01df6279c76049e78ba96aae07636b2b5b2a639eaed5ddc5c5c39cdc150bace4274ea51dcf4e2ddfc30a505d54955fb9a4e496c33e2ac121cf020d61b94', '2022-02-02', 'PFR'),
(0000000199, 'e812e60091e4e8f1a2934c22a25f8f02a936e078b8f24264aacda703cacd49104cef9603bd7e8e288e5314fc41825ff66bc005a665d8a433f5dea257128586c7', '2022-02-03', 'PFR'),
(0000000200, '5fbb1b74f059cfa8adf2d1248092b13b61304cfbcfbb04efbb9739da96518b1c5f495721e315c0cc94f3021bd23a594b50e026d9cf07ab1da880c964e0b778ae', '2022-02-03', 'PFR'),
(0000000201, '568c130fba8be643a1d594eb58c6e3f0bc3e1e1682480ae8fad95f4f5fea61759dc7a083b94a41fa5de290e8d78e06fb8850891350bf23b661f6c82f082a640e', '2022-02-03', 'PFR'),
(0000000202, '5637ac33958f147029485dd0cbee86a9821ba8c32405538e67f590ea3494de114aee43a2028e4824667400124e37f7028a996b55624aa61ac499d5bbaf8b7027', '2022-02-03', 'PFR'),
(0000000203, '3dc704b87839b6d29fa28c58f319a4adbffb083f797907c2af06f188146f92e686844baedf23c224e5a47d32323ed81e828c93b2cb586c43826d910520b0fa06', '2022-02-03', 'ETA'),
(0000000206, '50434e9bdcc95c8f65849243d33926cf4d65d5d7e9e1cf5d28e7c3ac6be43a3f65967140f203bf0b72736a9812534d292fd60aed9bb7ddae26ed3daef13c1ba5', '2022-02-03', 'PFR'),
(0000000210, '6bad63f7ddd1c51b697074cde1ffbccf351b86fb15c07beef31d893c08f1db5063ff74a08d67fc0c8d7ed24fb2519eb18a034c4a82a223d9bdf865798d82fa4a', '2022-02-03', 'PFR'),
(0000000211, '97a4b371070874283d7a7ce12ee02234e63bdde75d401cbbfbd2dab6148ce678874c0a09dc5a64de96b19421c2e593f4fafcaf5012919ef04febb614d8caa194', '2022-02-03', 'PFR'),
(0000000212, 'ae6703b6c14c23e18d179075eeaee2aa6efbcd9ab9f0f58e3989151e4a1ce4b49e4d0df2e9dff6b08539cc533c34fc3834deab8632524c48005ec0b4e1f321ae', '2022-02-04', 'PFR'),
(0000000213, '11f5aeb9a1644209ef297625aefd3c568def29b1ae15385b15782703640fa670ce915385979e9db251fbbee8b4b34486d499edbd729261d7a201d8ffc5a2f959', '2022-02-04', 'PFR'),
(0000000214, '21043f56b62d9f5aa2b3a5d1fb05346c87147771a9162f61846ec9483c91a0b017dccebea2616c045e3c525b30eb7720277aed98d772c183ceab1a25bfb317dc', '2022-02-04', 'PFR'),
(0000000215, 'a5623e95a21125da79a10037ae82942245eae8c258b64603d9f97834619a038c41b6be616de3c5c99f00b62e63cacff0ec023827071eae8da89fb2ec2d2cb841', '2022-02-04', 'PFR'),
(0000000216, '6d56e5e4e858cd9a5591051807035cbdf1ec886b24dfd758c726e5d136c6deee4f1524e892a4216b9f3ff6d471ace58da7ab0d93ed3d964bd7037a42eaef1087', '2022-02-04', 'PFR'),
(0000000218, '0397f69a60d5924a4f5e24698d2424f4f6f7d1d7949bff37f225b355a664de1d9ad6d9603dab2b4394baf20d63e4e2140e161746e06a920358954830ea0a19ce', '2022-02-04', 'ETA'),
(0000000220, 'aae91b168ec9f54754237d648c8d059daf06295eb9fd605a92937d25c83b2bc7244abf9ff529a13147155dfc0bb74cf9ae26e0384144aafaa8fed1bf804236a3', '2022-02-07', 'PFR'),
(0000000223, '3f556c55469866600c182e94abeb22a1f1f45a5053370efe0779913c1eadff80cedceb11fc152042e741c1937f0ba4ee85ccaf664ad5bd6b529c90d5f4496bbf', '2022-02-07', 'PFR'),
(0000000224, '75744eab3d3907d238878e69c3d2987dcb52570fcb7d49c9d48103a45570690964a1f3b84253f9495d7e6adc133ffd38684d216fa30a14ee9d8de334e12f3b2c', '2022-02-08', 'PFR'),
(0000000225, '9eda9e00657e7695a594b8d2d9cb6ffc1aa09f288c7a38785ec019da5b3d9aaabbdafcbb9145706b79bc63f531a7e634094df8657a3c038f6de8b22a8e574b5f', '2022-02-08', 'PFR'),
(0000000226, '153b7bf693dc00c1f45bfccfcd5c9cc326410229ef5413aae42e34373d8836c7f7514fc28dcb03ae733c094e2addf2876e7609237d032cab3ee18ff962318ffe', '2022-02-08', 'ADD'),
(0000000227, '34ba606cde4e755826dc82913573ef8440816595c4e301b50abc8ceabb661d2cf6a60ddea348861b2070eeb8e45702bda43978a1170b2c01f81305703e0d40e5', '2022-02-08', 'ADD'),
(0000000228, '023402538a5b4474d2b3e9d3d591c811f6cf7ea1e1d8061a061b8e2813a4d4815ee5cebad858f14e3aa7774ec4a77292061fe18f2e151247c62f8f13bc781678', '2022-02-08', 'ADD'),
(0000000229, '690f35b24a79bc6f97f37de5c7d187911744563a7696388b0ec5aee4639c9d5c502b20a8e52008917499f8356783c5ed29e259174a1e08db78aeb9d15e5b79ac', '2022-02-08', 'ADD'),
(0000000230, 'edbf7cf836d07f0dca0c1e7f0fd4d0dd27f4559eba14bb7190f01599f66acd5d876042b563892a542c0cf839b1f663915b63fd8570902e82252f96a5893c2607', '2022-02-08', 'ADD'),
(0000000231, '5621ca2a13d225a506df579efe7749b0fb417b550374f99cc68ed2867b5b549825a8ea236427fbb089222f77a46d2c3cf14271412ae41be5cd0ecc73cea9f97e', '2022-02-08', 'ADD'),
(0000000232, 'e73c05935e2bf9bbe0332983da479075dcf11af124a1154e3664150811580a366770edfb78216e183b8c79d7c14b147492198faa445c66237f27b530ddcbe2c3', '2022-02-09', 'ADD'),
(0000000233, '8254f2ad4dca5eb54a2880f8c99c7104a6f616460ae83d2346f4bc0ad41b565c6fd4b39fe2f5cb5b4cfe0f2bd655b2b1730aac9e13184f29d0622ac3fd6734d8', '2022-02-09', 'ADD'),
(0000000234, 'e50f78e8f51f34c50e4807900a9d512cf9c011db50876be0e4ca70d335a684557d8494bafe726beae5110fb04d138aaa53dfffa19d5dcaac4cd2161a3bdda640', '2022-02-09', 'PFR'),
(0000000239, '472eb680ced27c214aa8fdf9089d5d7cc9f41419dfb304d81f8c830397186b030eb020456c595d35087337491cb5ff0b0eaa221e8cc326b05096ed018e230214', '2022-02-10', 'ADD'),
(0000000241, 'a4916f6412a7dd154952aada390c5af8cf8bdf690e603d7ca14d99bf1ae03ae25f41480b5a36cc09d44be6938c7cb0e4cfaccf5d0acee562ec7c807f21fbc203', '2022-02-10', 'ADD'),
(0000000245, '6e52f9c3c63817f9cdada64926934c611f1ae452fedb1614cce318a460e943b0a4bc940c6d3fc91105d501ec843e59d3139e29693b7abbfb79f1f2e16f6df07d', '2022-02-10', 'ADD'),
(0000000246, '60919893022e6fdae2a08b5334f323899ac8a57af978225011fbd0f599bf09d5fc4dafbfcbbe3a9b68ca62210d62c3037506b58a85a9461a4b8d82d2ae5dfcc1', '2022-02-11', 'ADD'),
(0000000247, '93fe61f7650245a25f1b50dba938ba931e614865f89ae542f63ab4c2ea433e6f8b2cb6e1ee790bc3f3fd693bedba8204c8e356527f6876f3317008b76c90e4a6', '2022-02-11', 'ADD'),
(0000000248, '7e758606808d02bb0376f8fa131e183cb481a8400b0290be24d7dba0283c622289b0fd069ff35aa9509aa1695e1b244836f55ea38807021b818755502a5f07b6', '2022-02-11', 'ADD'),
(0000000250, '41e79a9177226c5a1544ad05e9b825e0a1d7e6e730cbd60fcde73c922eb5351cd1394b2da06c0f12c410219c5c61d09a8d9aa2df9a7bdcd48981f9814a616d78', '2022-02-14', 'PFR'),
(0000000251, 'cebcca65a9bf8f8cf23340591cdb5ff01c59b50db1b81da469f87d9b2155f6edd5befacd07b71095e7d80aaa0649fcffb0f4a8a2a681e16be088468ad64bcecc', '2022-02-14', 'PFR'),
(0000000255, '2267e943fc05ec66016353249010e1ecc562928e9434ad18d9068ca70c4cadbc081154d1b415c333663046abb32990a1ad1875731a7bdf7f0949c5427bb6e537', '2022-02-14', 'ETA'),
(0000000256, '970506ab3ac2c9e68268ca7e86d99565c451777a83c06352086ae941445f75b865bad8f1c1eb492754545b23c6cc0b252f4fff83774882049280df39ee82d3c9', '2022-02-14', 'ETA'),
(0000000257, 'b0f27dbfe1f36cc6f38401716605bfd06a2b901310ee6f4126d59fe9b583a09f9ab67063dd3a9a64f41a091d26fbc07d27661be9acbc51968223b29571c45fe2', '2022-02-14', 'ETA'),
(0000000261, 'ea2998cf425c881b30d8075f939d548f0127c4e60dc3ba63473262d4f9d936559f260e830c4d6f82b83857430a07ed8aa8befc556d72ece6bd72ee2f46293066', '2022-02-15', 'ETAN'),
(0000000262, 'eaf6eb4f3ee71fc90fb1c397f394ae774866a40d62592a4a39127263fe2d5486f7e9ab9210260c3afdd963294f866807d8c34aa84c045f83dc02f5f44687e764', '2022-02-15', 'PFR'),
(0000000264, '4f437a676ef12945c83d4a8c6493ecc5a9dbc6abcec04a821bb2cb8d6768d84cf0264cd61e113d06fff181c0d248d29437aeb2aaf72ddc866dda41b7d2069ab0', '2022-02-15', 'ETAN');

-- --------------------------------------------------------

--
-- Structure de la table `unite_enseignement`
--

DROP TABLE IF EXISTS `unite_enseignement`;
CREATE TABLE IF NOT EXISTS `unite_enseignement` (
  `IDUnite_enseignement` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(120) DEFAULT '',
  `Suppr` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`IDUnite_enseignement`),
  KEY `Nom` (`Nom`),
  KEY `Suppr` (`Suppr`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `unite_enseignement`
--

INSERT INTO `unite_enseignement` (`IDUnite_enseignement`, `Nom`, `Suppr`) VALUES
(1, 'CHAMP DU TRAVAIL SOCIAL', 0),
(2, 'CONNAISSANCE DE LA PROFESSION', 0),
(3, 'METHODES DE PRATIQUES', 0),
(4, 'REFERENTS THEORIQUES DE BASE DU TRAVAIL SOCIAL', 0),
(5, 'RENFORCEMENT DES CONNAISSANCES', 0),
(6, 'PROFESSION D’ASSISTANT DE SERVICE SOCIAL', 0),
(7, 'PROFESSION D’ANIMATEUR DE DEVELOPPEMENT SOCIAL', 0),
(8, 'PROFESSION D’EDUCATEUSR SPECIALISE', 0),
(9, 'CONDUITE DE RECHERCHE ACTION DANS LE SECTEUR SOCIAL', 0),
(10, 'POPULATION, DEVELOPPEMENT TERRITORIAL/LOCAL ET ACTION SOCIALE', 0),
(11, 'ENVIRONNEMENT DU PROCESSUS D’INNOVATION SOCIALE', 0),
(12, 'MANAGEMENT ET PILOTAGE STRATEGIQUE DU SECTEUR NON MARCHAND', 0),
(13, 'MEMOIRE', 1),
(14, 'METHODOLOGIE DE RECHERCHE-ACTION', 0),
(15, 'ACCOMPAGNEMENT DU CHANGEMENT ET TRAVAIL SOCIAL', 0),
(16, 'CADRE SOCIO-ECONOMIQUE DE L’ACTION SOCIALE', 0),
(17, 'GESTION DU DEVELOPPEMENT SOCIAL', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `fk_etudiant_conversation` FOREIGN KEY (`IDEtudiant`) REFERENCES `etudiant` (`IDEtudiant`),
  ADD CONSTRAINT `fk_professeur_conversation` FOREIGN KEY (`IDProfesseur`) REFERENCES `professeur` (`IDProfesseur`);

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `fk_module_document` FOREIGN KEY (`IDModule`) REFERENCES `module` (`IDModule`),
  ADD CONSTRAINT `fk_niveau_document` FOREIGN KEY (`IDNiveau`) REFERENCES `niveau` (`IDNiveau`),
  ADD CONSTRAINT `fk_parcours_document` FOREIGN KEY (`IDParcours`) REFERENCES `parcours` (`IDParcours`);

--
-- Contraintes pour la table `doc_lien`
--
ALTER TABLE `doc_lien`
  ADD CONSTRAINT `fk_doc_lien_document` FOREIGN KEY (`IDDocument`) REFERENCES `document` (`IDDocument`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fk_etudiant_annee_universitaire` FOREIGN KEY (`IDAnnee_universitaire`) REFERENCES `annee_universitaire` (`IDAnnee_universitaire`),
  ADD CONSTRAINT `fk_etudiant_niveau` FOREIGN KEY (`IDNiveau`) REFERENCES `niveau` (`IDNiveau`),
  ADD CONSTRAINT `fk_etudiant_parcours` FOREIGN KEY (`IDParcours`) REFERENCES `parcours` (`IDParcours`);

--
-- Contraintes pour la table `exam_choix`
--
ALTER TABLE `exam_choix`
  ADD CONSTRAINT `exam_question_question_choix` FOREIGN KEY (`IDexam_question`) REFERENCES `exam_question` (`IDexam_question`);

--
-- Contraintes pour la table `exam_etudiant`
--
ALTER TABLE `exam_etudiant`
  ADD CONSTRAINT `fk_etudiant_exam_etudiant` FOREIGN KEY (`IDEtudiant`) REFERENCES `etudiant` (`IDEtudiant`),
  ADD CONSTRAINT `fk_exam_titre_exam_etudiant` FOREIGN KEY (`IDExam_titre`) REFERENCES `exam_titre` (`IDexam_titre`);

--
-- Contraintes pour la table `exam_question`
--
ALTER TABLE `exam_question`
  ADD CONSTRAINT `fk_exam_question_exam_titre` FOREIGN KEY (`IDexam_titre`) REFERENCES `exam_titre` (`IDexam_titre`),
  ADD CONSTRAINT `fk_exam_question_question_type` FOREIGN KEY (`idtype`) REFERENCES `question_type` (`idtype`);

--
-- Contraintes pour la table `exam_reponse`
--
ALTER TABLE `exam_reponse`
  ADD CONSTRAINT `fk_exam_question_exam_reponse` FOREIGN KEY (`IDExam_question`) REFERENCES `exam_question` (`IDexam_question`),
  ADD CONSTRAINT `fk_exam_reponse_exam_choix` FOREIGN KEY (`idchoix`) REFERENCES `exam_choix` (`idchoix`),
  ADD CONSTRAINT `fk_exam_reponse_exam_etudiant` FOREIGN KEY (`IDExam_etudiant`) REFERENCES `exam_etudiant` (`IDexam_etudiant`);

--
-- Contraintes pour la table `exam_titre`
--
ALTER TABLE `exam_titre`
  ADD CONSTRAINT `fk_exam_module` FOREIGN KEY (`IDModule`) REFERENCES `module` (`IDModule`),
  ADD CONSTRAINT `fk_exam_niveau` FOREIGN KEY (`IDNiveau`) REFERENCES `niveau` (`IDNiveau`),
  ADD CONSTRAINT `fk_exam_professeur` FOREIGN KEY (`IDProfesseur`) REFERENCES `professeur` (`IDProfesseur`),
  ADD CONSTRAINT `fk_exam_titre_parcours` FOREIGN KEY (`IDParcours`) REFERENCES `parcours` (`IDParcours`);

--
-- Contraintes pour la table `message_etudiant`
--
ALTER TABLE `message_etudiant`
  ADD CONSTRAINT `fk_etudiant_message_etudiant` FOREIGN KEY (`IDEtudiant`) REFERENCES `etudiant` (`IDEtudiant`),
  ADD CONSTRAINT `fk_professeur_message_etudiant` FOREIGN KEY (`IDProfesseur`) REFERENCES `professeur` (`IDProfesseur`);

--
-- Contraintes pour la table `module_professeur`
--
ALTER TABLE `module_professeur`
  ADD CONSTRAINT `fk_niveau_module_professeur` FOREIGN KEY (`IDNiveau`) REFERENCES `niveau` (`IDNiveau`),
  ADD CONSTRAINT `fk_parcours_module_professeur` FOREIGN KEY (`IDParcours`) REFERENCES `parcours` (`IDParcours`),
  ADD CONSTRAINT `fk_professeur_module_professeur` FOREIGN KEY (`IDProfesseur`) REFERENCES `professeur` (`IDProfesseur`);

--
-- Contraintes pour la table `responsabilite`
--
ALTER TABLE `responsabilite`
  ADD CONSTRAINT `fk_responsabilite_parcours` FOREIGN KEY (`IDParcours`) REFERENCES `parcours` (`IDParcours`),
  ADD CONSTRAINT `fk_responsabilite_professeur` FOREIGN KEY (`IDProfesseur`) REFERENCES `professeur` (`IDProfesseur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
