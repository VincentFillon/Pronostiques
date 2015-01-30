-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 27 Novembre 2014 à 16:00
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `pronostiques`
--

-- --------------------------------------------------------

--
-- Structure de la table `actualites`
--

CREATE TABLE IF NOT EXISTS `actualites` (
  `Titre` text COLLATE utf8_bin NOT NULL,
  `Texte` text COLLATE utf8_bin NOT NULL,
  `Image` text COLLATE utf8_bin NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `actualites`
--

INSERT INTO `actualites` (`Titre`, `Texte`, `Image`, `Date`) VALUES
('40 ans de prison pour Nicolas Anelka !', 'Nicolas Anelka a été condamné à 40 ans de prison. L’ancien international français s’est rendu coupable d’avoir mangé une vache sacrée lors d’un barbecue avec des amis.', 'anelka-vache.jpg', '2014-10-29'),
('Ballon League des Champions 2014 / 2015', 'Les images du nouveau ballon de la League des Champions saison 2014 / 2015 sont sorties !', 'ballon_2015.jpg', '2014-07-18'),
('Rugby : La finale du Top 14 au Camp Nou !', 'La finale de l''édition 2015-2016 du championnat de France de rugby sera organisée au Camp Nou de Barcelone le vendredi 24 juin au soir. C''est la première fois que l''épilogue du championnat de France de rugby se tient hors des frontières nationales. Les principaux stades français seront en effet indisponibles car retenus pour les huitièmes de finale de l''Euro 2016 de football.', 'final-rugby_top-14_camp-nou.jpg', '2014-11-04'),
('Suspension provisoire pour Zinedine Zidane par le Tribunal administratif du sport espagnol', 'Zinedine Zidane, entraîneur de la réserve du Real Madrid sanctionné pour défaut de diplôme, a finalement obtenu vendredi 31 octobre une suspension provisoire de cette sanction de la part du Tribunal administratif du sport (TAD) espagnol en attendant une décision sur le fond, a annoncé le club madrilène.', 'Zidane-suspension-provisoire.jpg', '2014-11-01'),
('Milos Raonic qualifié pour la finale de Paris-Bercy', 'Le Canadien Milos Raonic, numéro 10 mondial, s''est qualifié pour la deuxième fois de sa carrière pour la finale d''un Masters 1000 de Paris-Bercy, en battant le Tchèque Tomas Berdych en trois sets 6-3, 3-6, 7-5 samedi 1er novembre en demi-finale à Paris-Bercy.', 'milos-raonic-a-paris.jpg', '2014-11-01');

-- --------------------------------------------------------

--
-- Structure de la table `championnats`
--

CREATE TABLE IF NOT EXISTS `championnats` (
  `Championnat` varchar(40) COLLATE utf8_bin NOT NULL,
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `Sport` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `championnats`
--

INSERT INTO `championnats` (`Championnat`, `id`, `Sport`) VALUES
('Ligue 1', 'ligue1', 'foot'),
('Top 14', 'top14', 'rugby');

-- --------------------------------------------------------

--
-- Structure de la table `ligue1`
--

CREATE TABLE IF NOT EXISTS `ligue1` (
  `Rang` int(11) NOT NULL,
  `Equipe` varchar(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `PTS` int(11) NOT NULL,
  `J` int(11) NOT NULL,
  `G` int(11) NOT NULL,
  `N` int(11) NOT NULL,
  `P` int(11) NOT NULL,
  `BP` int(11) NOT NULL,
  `BC` int(11) NOT NULL,
  `Diff` int(11) NOT NULL,
  PRIMARY KEY (`Rang`),
  UNIQUE KEY `Rang` (`Rang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `ligue1`
--

INSERT INTO `ligue1` (`Rang`, `Equipe`, `PTS`, `J`, `G`, `N`, `P`, `BP`, `BC`, `Diff`) VALUES
(1, 'Marseille', 25, 11, 8, 1, 2, 25, 9, 16),
(2, 'PSG', 21, 11, 5, 6, 0, 21, 7, 14),
(3, 'Lyon', 20, 11, 6, 2, 3, 21, 9, 12),
(4, 'Saint-Etienne', 20, 11, 6, 2, 3, 11, 10, 1),
(5, 'Nantes', 19, 11, 5, 4, 2, 10, 7, 3),
(6, 'Bordeaux', 18, 11, 5, 3, 3, 16, 13, 3),
(7, 'Nice', 17, 11, 5, 2, 4, 16, 15, 1),
(8, 'AS Monaco FC', 17, 11, 5, 2, 4, 13, 12, 1),
(9, 'Rennes', 15, 11, 4, 3, 4, 13, 13, 0),
(10, 'FC Metz', 15, 11, 4, 3, 4, 10, 10, 0),
(11, 'Lille', 15, 11, 4, 3, 4, 8, 9, -1),
(12, 'Toulouse', 14, 11, 4, 2, 5, 13, 15, -2),
(13, 'Montpellier', 14, 11, 4, 2, 5, 9, 11, -2),
(14, 'Stade Reims', 14, 11, 4, 2, 5, 11, 20, -9),
(15, 'SM Caen', 12, 11, 3, 3, 5, 12, 12, 0),
(16, 'Lens', 11, 11, 3, 2, 6, 10, 13, -3),
(17, 'Lorient', 10, 11, 3, 1, 7, 9, 14, -5),
(18, 'Bastia', 10, 11, 2, 4, 5, 9, 16, -7),
(19, 'Evian', 10, 11, 3, 1, 7, 11, 20, -9),
(20, 'EA Guingamp', 9, 11, 3, 0, 8, 8, 21, -13);

-- --------------------------------------------------------

--
-- Structure de la table `top14`
--

CREATE TABLE IF NOT EXISTS `top14` (
  `Rang` int(11) NOT NULL,
  `Equipe` varchar(40) COLLATE utf8_bin NOT NULL,
  `PTS` int(11) NOT NULL,
  `J` int(11) NOT NULL,
  `G` int(11) NOT NULL,
  `N` int(11) NOT NULL,
  `P` int(11) NOT NULL,
  `BP` int(11) NOT NULL,
  `BC` int(11) NOT NULL,
  `Diff` int(11) NOT NULL,
  PRIMARY KEY (`Rang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `top14`
--

INSERT INTO `top14` (`Rang`, `Equipe`, `PTS`, `J`, `G`, `N`, `P`, `BP`, `BC`, `Diff`) VALUES
(1, 'Rugby Club Toulonnais', 33, 10, 7, 0, 3, 326, 189, 137),
(2, 'ASM Clermont', 31, 10, 7, 0, 3, 242, 173, 69),
(3, 'Stade Français', 31, 10, 7, 0, 3, 234, 224, 10),
(4, 'Union Bordeaux-Bègles', 27, 10, 6, 0, 4, 296, 233, 63),
(5, 'Montpellier Hérault Rugby', 26, 10, 6, 0, 4, 216, 176, 40),
(6, 'Racing Métro 92', 25, 10, 5, 0, 5, 225, 218, 7),
(7, 'Grenoble', 24, 10, 5, 0, 5, 252, 302, -50),
(8, 'Stade Toulousain', 23, 10, 5, 0, 5, 227, 200, 27),
(9, 'Aviron Bayonnais', 21, 10, 4, 0, 6, 214, 206, 8),
(10, 'Atlantique Stade Rochelais', 19, 10, 4, 0, 6, 220, 295, -75),
(11, 'CA Brive-Corrèze', 18, 10, 4, 0, 6, 206, 266, -60),
(12, 'Lyon LOU', 17, 10, 4, 0, 6, 181, 248, -67),
(13, 'Oyonnax', 16, 10, 3, 0, 7, 201, 226, -25),
(14, 'Castres Olympique', 15, 10, 3, 0, 7, 202, 286, -84);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `login` varchar(16) COLLATE utf8_bin NOT NULL,
  `mdp` varchar(40) COLLATE utf8_bin NOT NULL,
  `mail` varchar(255) COLLATE utf8_bin NOT NULL,
  `profil` enum('ADMIN','Lambda') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`login`, `mdp`, `mail`, `profil`) VALUES
('Vincent', 'cbd0c9b85e772cf0dcede08fbbca959ea54098d0', '20cent06@live.fr', 'ADMIN');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
