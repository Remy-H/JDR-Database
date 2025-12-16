-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 16 déc. 2025 à 17:19
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_jdr`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `code_a` int NOT NULL,
  `num_rue` int DEFAULT NULL,
  `nom_ville` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`code_a`),
  KEY `fk_ville` (`nom_ville`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`code_a`, `num_rue`, `nom_ville`) VALUES
(1, 12, 'Paris'),
(2, 45, 'Lyon'),
(3, 78, 'Bruxelles'),
(4, 10, 'Geneve');

-- --------------------------------------------------------

--
-- Structure de la table `association`
--

DROP TABLE IF EXISTS `association`;
CREATE TABLE IF NOT EXISTS `association` (
  `nom_asso` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nom_asso`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `association`
--

INSERT INTO `association` (`nom_asso`) VALUES
('DragonsNoirs'),
('GuildOfHeroes'),
('LesRoisDuJDR');

-- --------------------------------------------------------

--
-- Structure de la table `ass_asso_participant`
--

DROP TABLE IF EXISTS `ass_asso_participant`;
CREATE TABLE IF NOT EXISTS `ass_asso_participant` (
  `nom_asso` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`nom_asso`,`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ass_asso_participant`
--

INSERT INTO `ass_asso_participant` (`nom_asso`, `id`) VALUES
('DragonsNoirs', 3),
('DragonsNoirs', 4),
('GuildOfHeroes', 5),
('GuildOfHeroes', 6),
('GuildOfHeroes', 8),
('GuildOfHeroes', 9),
('LesRoisDuJDR', 1),
('LesRoisDuJDR', 2);

-- --------------------------------------------------------

--
-- Structure de la table `ass_dispo_participant`
--

DROP TABLE IF EXISTS `ass_dispo_participant`;
CREATE TABLE IF NOT EXISTS `ass_dispo_participant` (
  `id` int NOT NULL,
  `date_deb` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`id`,`date_deb`,`date_fin`),
  KEY `date_deb` (`date_deb`,`date_fin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ass_dispo_participant`
--

INSERT INTO `ass_dispo_participant` (`id`, `date_deb`, `date_fin`) VALUES
(1, '2025-01-15', '2025-01-20'),
(2, '2025-01-15', '2025-01-20'),
(5, '2025-03-01', '2025-03-02'),
(6, '2025-03-15', '2025-03-16'),
(7, '2025-01-15', '2025-01-20'),
(8, '2025-03-01', '2025-03-02'),
(9, '2025-03-01', '2025-03-02');

-- --------------------------------------------------------

--
-- Structure de la table `ass_dispo_salle`
--

DROP TABLE IF EXISTS `ass_dispo_salle`;
CREATE TABLE IF NOT EXISTS `ass_dispo_salle` (
  `num_salle` int NOT NULL,
  `date_deb` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`num_salle`,`date_deb`,`date_fin`),
  KEY `date_deb` (`date_deb`,`date_fin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ass_dispo_salle`
--

INSERT INTO `ass_dispo_salle` (`num_salle`, `date_deb`, `date_fin`) VALUES
(101, '2025-01-15', '2025-01-20'),
(102, '2025-02-01', '2025-02-05'),
(103, '2025-03-15', '2025-03-16'),
(104, '2025-03-01', '2025-03-02');

-- --------------------------------------------------------

--
-- Structure de la table `ass_jdr_mission`
--

DROP TABLE IF EXISTS `ass_jdr_mission`;
CREATE TABLE IF NOT EXISTS `ass_jdr_mission` (
  `nom_mission` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_jeu` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nom_mission`,`nom_jeu`),
  KEY `nom_jeu` (`nom_jeu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ass_jdr_mission`
--

INSERT INTO `ass_jdr_mission` (`nom_mission`, `nom_jeu`) VALUES
('capturer_prisonnier', 'Tournoi Medieval'),
('chercher_indices', 'Enquete Victorienne'),
('defendre_chateau', 'Tournoi Medieval'),
('interroger_suspects', 'Enquete Victorienne'),
('tuer_roi', 'Tournoi Medieval');

-- --------------------------------------------------------

--
-- Structure de la table `ass_materiel_salle`
--

DROP TABLE IF EXISTS `ass_materiel_salle`;
CREATE TABLE IF NOT EXISTS `ass_materiel_salle` (
  `num_salle` int NOT NULL,
  `nom_m` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`num_salle`,`nom_m`),
  KEY `nom_m` (`nom_m`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ass_materiel_salle`
--

INSERT INTO `ass_materiel_salle` (`num_salle`, `nom_m`) VALUES
(101, 'armures_mousse'),
(101, 'epees_latex'),
(101, 'torches_led'),
(104, 'boucliers_mousse'),
(104, 'cape_noire');

-- --------------------------------------------------------

--
-- Structure de la table `ass_mission_role`
--

DROP TABLE IF EXISTS `ass_mission_role`;
CREATE TABLE IF NOT EXISTS `ass_mission_role` (
  `nom_mission` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duree` int DEFAULT NULL,
  PRIMARY KEY (`nom_mission`,`nom_role`),
  KEY `nom_role` (`nom_role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ass_mission_role`
--

INSERT INTO `ass_mission_role` (`nom_mission`, `nom_role`, `duree`) VALUES
('tuer_roi', 'voleur', 60),
('defendre_chateau', 'chevalier', 90),
('interroger_suspects', 'detective', 60),
('chercher_indices', 'detective', 60),
('interroger_suspects', 'suspect', 30),
('capturer_prisonnier', 'guerrier', 80);

-- --------------------------------------------------------

--
-- Structure de la table `ass_role_participant`
--

DROP TABLE IF EXISTS `ass_role_participant`;
CREATE TABLE IF NOT EXISTS `ass_role_participant` (
  `id` int NOT NULL,
  `nom_role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`,`nom_role`),
  KEY `nom_role` (`nom_role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ass_role_participant`
--

INSERT INTO `ass_role_participant` (`id`, `nom_role`, `date`) VALUES
(1, 'roi', '2025-01-10'),
(2, 'reine', '2025-01-10'),
(3, 'chevalier', '2025-01-10'),
(4, 'mage', '2025-01-10'),
(5, 'detective', '2025-02-20'),
(6, 'suspect', '2025-02-20'),
(7, 'guerrier', '2025-01-10'),
(8, 'detective', '2025-03-01'),
(9, 'suspect', '2025-03-01');

-- --------------------------------------------------------

--
-- Structure de la table `ass_salle_jdr`
--

DROP TABLE IF EXISTS `ass_salle_jdr`;
CREATE TABLE IF NOT EXISTS `ass_salle_jdr` (
  `num_salle` int NOT NULL,
  `nom_jeu` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`num_salle`,`nom_jeu`),
  KEY `nom_jeu` (`nom_jeu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ass_salle_jdr`
--

INSERT INTO `ass_salle_jdr` (`num_salle`, `nom_jeu`, `theme`) VALUES
(101, 'Tournoi Medieval', 'medieval'),
(102, 'Quete Fantastique', 'fantasy'),
(103, 'Donjon Urbain', 'donjon'),
(104, 'Enquete Victorienne', 'enquete'),
(103, 'Tournoi Medieval', 'medieval');

-- --------------------------------------------------------

--
-- Structure de la table `disponibilite`
--

DROP TABLE IF EXISTS `disponibilite`;
CREATE TABLE IF NOT EXISTS `disponibilite` (
  `date_deb` date NOT NULL,
  `date_fin` date NOT NULL,
  PRIMARY KEY (`date_deb`,`date_fin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `disponibilite`
--

INSERT INTO `disponibilite` (`date_deb`, `date_fin`) VALUES
('2025-01-15', '2025-01-20'),
('2025-02-01', '2025-02-05'),
('2025-03-01', '2025-03-02'),
('2025-03-15', '2025-03-16');

-- --------------------------------------------------------

--
-- Structure de la table `jdr`
--

DROP TABLE IF EXISTS `jdr`;
CREATE TABLE IF NOT EXISTS `jdr` (
  `nom_jeu` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duree_role` int DEFAULT NULL,
  PRIMARY KEY (`nom_jeu`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jdr`
--

INSERT INTO `jdr` (`nom_jeu`, `duree_role`) VALUES
('Tournoi Medieval', 360),
('Quete Fantastique', 480),
('Donjon Urbain', 240),
('Enquete Victorienne', 300);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

DROP TABLE IF EXISTS `materiel`;
CREATE TABLE IF NOT EXISTS `materiel` (
  `nom_m` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantite` int DEFAULT NULL,
  PRIMARY KEY (`nom_m`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`nom_m`, `quantite`) VALUES
('epees_latex', 15),
('armures_mousse', 8),
('de_20_faces', 50),
('boucliers_mousse', 10),
('cape_noire', 20),
('torches_led', 30);

-- --------------------------------------------------------

--
-- Structure de la table `mission`
--

DROP TABLE IF EXISTS `mission`;
CREATE TABLE IF NOT EXISTS `mission` (
  `nom_mission` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nom_mission`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mission`
--

INSERT INTO `mission` (`nom_mission`) VALUES
('capturer_prisonnier'),
('chercher_indices'),
('defendre_chateau'),
('interroger_suspects'),
('trouver_tresor'),
('tuer_roi');

-- --------------------------------------------------------

--
-- Structure de la table `partenaire`
--

DROP TABLE IF EXISTS `partenaire`;
CREATE TABLE IF NOT EXISTS `partenaire` (
  `id1` int NOT NULL,
  `id2` int NOT NULL,
  `lien` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id1`,`id2`),
  KEY `id2` (`id2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `partenaire`
--

INSERT INTO `partenaire` (`id1`, `id2`, `lien`) VALUES
(1, 2, 'frere_soeur'),
(3, 4, 'couple'),
(8, 9, 'duo_detective');

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

DROP TABLE IF EXISTS `participant`;
CREATE TABLE IF NOT EXISTS `participant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motivation` text COLLATE utf8mb4_unicode_ci,
  `experience` text COLLATE utf8mb4_unicode_ci,
  `nom_asso` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_a` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_association` (`nom_asso`),
  KEY `fk_adresse` (`code_a`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `participant`
--

INSERT INTO `participant` (`id`, `nom`, `prenom`, `motivation`, `experience`, `nom_asso`, `code_a`) VALUES
(1, 'DUPONT', 'Martin', 'Passionne de JDR depuis 10 ans', 'expert', 'LesRoisDuJDR', 1),
(2, 'LEMAIRE', 'Sophie', 'Debutante motivee', 'novice', 'LesRoisDuJDR', 1),
(3, 'PETIT', 'Lucas', 'Aime les roles de combat', 'moyen', 'DragonsNoirs', 2),
(4, 'MOREAU', 'Emma', 'Experimentee en intrigue', 'expert', 'DragonsNoirs', 2),
(5, 'MARTIN', 'Alice', 'Adore les enigmes', 'intermediaire', 'GuildOfHeroes', 4),
(6, 'ROBERT', 'Nicolas', 'Fan de combats epique', 'avance', 'GuildOfHeroes', 4),
(7, 'DURAND', 'Pierre', 'Guerrier chevronne', 'expert', 'LesRoisDuJDR', 1),
(8, 'LEGRAND', 'Julie', 'Maître des énigmes', 'expert', 'GuildOfHeroes', 4),
(9, 'BERNARD', 'Thomas', 'Partenaire de Julie', 'avance', 'GuildOfHeroes', 4);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `nom_pays` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nom_pays`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`nom_pays`) VALUES
('Belgique'),
('France'),
('Suisse');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `nom_role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duree_role` int DEFAULT NULL,
  PRIMARY KEY (`nom_role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`nom_role`, `duree_role`) VALUES
('roi', 120),
('reine', 120),
('chevalier', 90),
('mage', 90),
('voleur', 60),
('detective', 120),
('suspect', 90),
('guerrier', 100);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `num_salle` int NOT NULL,
  `surface` int DEFAULT NULL,
  `code_a` int NOT NULL,
  PRIMARY KEY (`num_salle`),
  KEY `fk_adresse` (`code_a`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`num_salle`, `surface`, `code_a`) VALUES
(101, 200, 1),
(102, 150, 2),
(103, 300, 3),
(104, 120, 4);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `nom_ville` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_pays` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nom_ville`),
  KEY `fk_pays` (`nom_pays`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`nom_ville`, `nom_pays`) VALUES
('Paris', 'France'),
('Lyon', 'France'),
('Bruxelles', 'Belgique'),
('Geneve', 'Suisse');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
