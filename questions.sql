-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 10 jan. 2025 à 08:48
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `reponse_vrai` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id`, `course_id`, `reponse_vrai`, `question`) VALUES
(1, 1, 'PHP est un langage de script côté serveur.', 'Qu\'est-ce que PHP ?'),
(2, 1, 'Utilisez le symbole $.', 'Comment déclarer une variable en PHP ?'),
(3, 1, 'function nomDeLaFonction() {...}', 'Quelle est la syntaxe pour une fonction en PHP ?'),
(4, 1, 'Utilisez array() ou [].', 'Comment créer un tableau en PHP ?'),
(5, 1, 'Utilisez include ou require.', 'Comment inclure un fichier en PHP ?'),
(6, 1, 'Une session stocke des données entre les pages.', 'Qu\'est-ce qu\'une session ?'),
(7, 1, 'Utilisez // ou /* */.', 'Comment faire un commentaire en PHP ?'),
(8, 1, 'Utilisez mysqli_connect ou PDO.', 'Comment se connecter à une base de données ?'),
(9, 1, 'GET envoie des données dans l\'URL, POST les envoie dans le corps.', 'Quelle est la différence entre GET et POST ?'),
(10, 1, 'Utilisez try-catch.', 'Comment gérer les erreurs en PHP ?'),
(11, 2, 'JavaScript est un langage de programmation pour le web.', 'Qu\'est-ce que JavaScript ?'),
(12, 2, 'Utilisez let, const ou var.', 'Comment déclarer une variable en JavaScript ?'),
(13, 2, 'let et const ont une portée de bloc, var a une portée fonction.', 'Quelle est la différence entre let, const et var ?'),
(14, 2, 'function nomDeLaFonction() {...}', 'Comment créer une fonction en JavaScript ?'),
(15, 2, 'Un tableau est une collection de valeurs.', 'Qu\'est-ce qu\'un tableau en JavaScript ?'),
(16, 2, 'if (condition) {...}', 'Comment utiliser un if en JavaScript ?'),
(17, 2, 'Un objet est une collection de propriétés.', 'Qu\'est-ce qu\'un objet en JavaScript ?'),
(18, 2, 'Utilisez addEventListener.', 'Comment ajouter un événement à un élément DOM ?'),
(19, 2, 'for (let i = 0; i < n; i++) {...}', 'Quelle est la syntaxe pour une boucle for ?'),
(20, 2, 'Le DOM est la structure d\'un document HTML.', 'Qu\'est-ce que le DOM ?'),
(21, 3, 'SQL est un langage de requête pour les bases de données.', 'Qu\'est-ce que SQL ?'),
(22, 3, 'Utilisez SELECT * FROM nomTable;', 'Comment sélectionner toutes les colonnes d\'une table ?'),
(23, 3, 'INSERT INTO nomTable (colonne1, colonne2) VALUES (valeur1, valeur2);', 'Quelle est la syntaxe pour insérer une nouvelle ligne ?'),
(24, 3, 'UPDATE nomTable SET colonne1 = valeur1 WHERE condition;', 'Comment mettre à jour une ligne ?'),
(25, 3, 'DROP TABLE nomTable;', 'Quelle commande est utilisée pour supprimer une table ?'),
(26, 3, 'Une clé primaire identifie de manière unique chaque ligne d\'une table.', 'Qu\'est-ce qu\'une clé primaire ?'),
(27, 3, 'CREATE TABLE nomTable (colonne1 type, colonne2 type);', 'Comment créer une table ?'),
(28, 3, 'INNER JOIN retourne les lignes correspondantes, LEFT JOIN retourne toutes les lignes de la table de gauche.', 'Quelle est la différence entre INNER JOIN et LEFT JOIN ?'),
(29, 3, 'Utilisez WHERE condition;', 'Comment filtrer des résultats avec WHERE ?'),
(30, 3, 'Un index améliore la vitesse des opérations sur une table.', 'Qu\'est-ce qu\'un index ?'),
(31, 4, 'C++ est un langage de programmation orienté objet.', 'Qu\'est-ce que C++ ?'),
(32, 4, 'type nomVariable;', 'Comment déclarer une variable en C++ ?'),
(33, 4, 'type nomFonction() {...}', 'Quelle est la syntaxe pour une fonction en C++ ?'),
(34, 4, 'type nomTableau[taille];', 'Comment créer un tableau en C++ ?'),
(35, 4, 'Les membres d\'une classe sont privés par défaut, ceux d\'une structure sont publics.', 'Quelle est la différence entre classe et structure ?'),
(36, 4, 'Un constructeur est une fonction spéciale qui initialise un objet.', 'Qu\'est-ce qu\'un constructeur ?'),
(37, 4, 'Utilisez new et delete.', 'Comment gérer la mémoire dynamique ?'),
(38, 4, 'for (initialisation; condition; incrément) {...}', 'Quelle est la syntaxe pour une boucle for ?'),
(39, 4, 'L\'héritage permet de créer une nouvelle classe basée sur une classe existante.', 'Qu\'est-ce que l\'héritage ?'),
(40, 4, 'type* nomPointeur;', 'Comment déclarer un pointeur ?');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8ADC54D5591CC992` (`course_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `FK_8ADC54D5591CC992` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
