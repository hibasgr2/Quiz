-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 10 jan. 2025 à 09:01
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
-- Structure de la table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`id`, `nom`) VALUES
(1, 'PHP'),
(2, 'JS'),
(3, 'SQL'),
(4, 'C++');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250109160907', '2025-01-09 16:09:14', 115);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `note` decimal(4,4) NOT NULL,
  `etat` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE `reponse` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `reponse` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reponse`
--

INSERT INTO `reponse` (`id`, `question_id`, `reponse`) VALUES
(1, 1, 'PHP est un langage de script côté serveur.'),
(2, 1, 'PHP est un langage de programmation orienté objet.'),
(3, 1, 'PHP est un langage de requête pour bases de données.'),
(4, 2, 'Utilisez le symbole $.'),
(5, 2, 'Utilisez le symbole @.'),
(6, 2, 'Utilisez le symbole #.'),
(7, 3, 'function nomDeLaFonction() {...}'),
(8, 3, 'function nomDeLaFonction[] {...}'),
(9, 3, 'function: nomDeLaFonction() {...}'),
(10, 4, 'Utilisez array() ou [].'),
(11, 4, 'Utilisez list() ou {}.'),
(12, 4, 'Utilisez map() ou set().'),
(13, 5, 'Utilisez include ou require.'),
(14, 5, 'Utilisez import ou attach.'),
(15, 5, 'Utilisez include_once ou load.'),
(16, 6, 'Une session stocke des données entre les pages.'),
(17, 6, 'Une session est un type de fonction.'),
(18, 6, 'Une session est une méthode de connexion.'),
(19, 7, 'Utilisez // ou /* */.'),
(20, 7, 'Utilisez #.'),
(21, 7, 'Utilisez --.'),
(22, 1, 'PHP est un langage de script côté serveur.'),
(23, 1, 'PHP est un langage de programmation orienté objet.'),
(24, 1, 'PHP est un langage de requête pour bases de données.'),
(25, 2, 'Utilisez le symbole $.'),
(26, 2, 'Utilisez le symbole @.'),
(27, 2, 'Utilisez le symbole #.'),
(28, 3, 'function nomDeLaFonction() {...}'),
(29, 3, 'function nomDeLaFonction[] {...}'),
(30, 3, 'function: nomDeLaFonction() {...}'),
(31, 4, 'Utilisez array() ou [].'),
(32, 4, 'Utilisez list() ou {}.'),
(33, 4, 'Utilisez map() ou set().'),
(34, 5, 'Utilisez include ou require.'),
(35, 5, 'Utilisez import ou attach.'),
(36, 5, 'Utilisez include_once ou load.'),
(37, 6, 'Une session stocke des données entre les pages.'),
(38, 6, 'Une session est un type de fonction.'),
(39, 6, 'Une session est une méthode de connexion.'),
(40, 7, 'Utilisez // ou /* */.'),
(41, 7, 'Utilisez #.'),
(42, 7, 'Utilisez --.'),
(43, 8, 'Utilisez mysqli_connect ou PDO.'),
(44, 8, 'Utilisez db_connect().'),
(45, 8, 'Utilisez open_db().'),
(46, 9, 'GET envoie des données dans l\'URL, POST les envoie dans le corps.'),
(47, 9, 'GET envoie des données dans le corps, POST dans l\'URL.'),
(48, 9, 'GET et POST sont identiques.'),
(49, 10, 'Utilisez try-catch.'),
(50, 10, 'Utilisez if-else.'),
(51, 10, 'Utilisez log().'),
(52, 11, 'JavaScript est un langage de programmation pour le web.'),
(53, 11, 'JavaScript est un langage de script côté serveur.'),
(54, 11, 'JavaScript est un langage de requête.'),
(55, 12, 'Utilisez let, const ou var.'),
(56, 12, 'Utilisez define.'),
(57, 12, 'Utilisez set.'),
(58, 13, 'let et const ont une portée de bloc, var a une portée fonction.'),
(59, 13, 'let a une portée globale, const est une constante.'),
(60, 13, 'Il n\'y a pas de différence.'),
(61, 14, 'function nomDeLaFonction() {...}'),
(62, 14, 'function: nomDeLaFonction() {...}'),
(63, 14, 'nomDeLaFonction() = function {...};'),
(64, 15, 'Un tableau est une collection de valeurs.'),
(65, 15, 'Un tableau est un type de fonction.'),
(66, 15, 'Un tableau est une variable.'),
(67, 16, 'if (condition) {...}'),
(68, 16, 'if [condition] {...}'),
(69, 16, 'if {condition} {...}'),
(70, 17, 'Un objet est une collection de propriétés.'),
(71, 17, 'Un objet est une variable.'),
(72, 17, 'Un objet est une fonction.'),
(73, 18, 'Utilisez addEventListener.'),
(74, 18, 'Utilisez attachEvent.'),
(75, 18, 'Utilisez onClick.'),
(76, 19, 'for (let i = 0; i < n; i++) {...}'),
(77, 19, 'for (i = 0; i < n; i++) {...}'),
(78, 19, 'for {i = 0; i < n; i++} {...}'),
(79, 20, 'Le DOM est la structure d\'un document HTML.'),
(80, 20, 'Le DOM est un langage de programmation.'),
(81, 20, 'Le DOM est un type de tableau.'),
(82, 21, 'SQL est un langage de requête pour les bases de données.'),
(83, 21, 'SQL est un langage de programmation.'),
(84, 21, 'SQL est un langage de script.'),
(85, 22, 'Utilisez SELECT * FROM nomTable;'),
(86, 22, 'Utilisez SELECT ALL FROM nomTable;'),
(87, 22, 'Utilisez SELECT nomTable;'),
(88, 23, 'INSERT INTO nomTable (colonne1, colonne2) VALUES (valeur1, valeur2);'),
(89, 23, 'INSERT nomTable (colonne1, colonne2) VALUES (valeur1, valeur2);'),
(90, 23, 'INSERT INTO nomTable VALUES (valeur1, valeur2);'),
(91, 24, 'UPDATE nomTable SET colonne1 = valeur1 WHERE condition;'),
(92, 24, 'CHANGE nomTable SET colonne1 = valeur1 WHERE condition;'),
(93, 24, 'EDIT nomTable SET colonne1 = valeur1 WHERE condition;'),
(94, 25, 'DROP TABLE nomTable;'),
(95, 25, 'DELETE TABLE nomTable;'),
(96, 25, 'REMOVE TABLE nomTable;'),
(97, 26, 'Une clé primaire identifie de manière unique chaque ligne d\'une table.'),
(98, 26, 'Une clé primaire est une colonne optionnelle.'),
(99, 26, 'Une clé primaire est une clé étrangère.'),
(100, 27, 'CREATE TABLE nomTable (colonne1 type, colonne2 type);'),
(101, 27, 'NEW TABLE nomTable (colonne1 type, colonne2 type);'),
(102, 27, 'MAKE TABLE nomTable (colonne1 type, colonne2 type);'),
(103, 28, 'INNER JOIN retourne les lignes correspondantes, LEFT JOIN retourne toutes les lignes de la table de gauche.'),
(104, 28, 'INNER JOIN retourne toutes les lignes, LEFT JOIN seulement les correspondantes.'),
(105, 28, 'Il n\'y a pas de différence.'),
(106, 29, 'Utilisez WHERE condition;'),
(107, 29, 'Utilisez FILTER condition;'),
(108, 29, 'Utilisez SELECT condition;'),
(109, 30, 'Un index améliore la vitesse des opérations sur une table.'),
(110, 30, 'Un index est une colonne obligatoire.'),
(111, 30, 'Un index est une commande SQL.'),
(112, 31, 'C++ est un langage de programmation orienté objet.'),
(113, 31, 'C++ est un langage de script.'),
(114, 31, 'C++ est un langage de requête.'),
(115, 32, 'type nomVariable;'),
(116, 32, 'nomVariable : type;'),
(117, 32, 'variable nomVariable;'),
(118, 33, 'type nomFonction() {...}'),
(119, 33, 'function nomFonction() {...}'),
(120, 33, 'nomFonction() : type {...};'),
(121, 34, 'type nomTableau[taille];'),
(122, 34, 'nomTableau : type[taille];'),
(123, 34, 'type[] nomTableau;'),
(124, 35, 'Les membres d\'une classe sont privés par défaut, ceux d\'une structure sont publics.'),
(125, 35, 'Il n\'y a pas de différence.'),
(126, 35, 'Les deux sont identiques.'),
(127, 36, 'Un constructeur est une fonction spéciale qui initialise un objet.'),
(128, 36, 'Un constructeur est une variable spéciale.'),
(129, 36, 'Un constructeur est une méthode de destruction.'),
(130, 37, 'Utilisez new et delete.'),
(131, 37, 'Utilisez malloc et free.'),
(132, 37, 'Utilisez allocate et release.'),
(133, 38, 'for (initialisation; condition; incrément) {...}'),
(134, 38, 'for (condition; initialisation; incrément) {...}'),
(135, 38, 'for {initialisation; condition; incrément} {...}'),
(136, 39, 'L\'héritage permet de créer une nouvelle classe basée sur une classe existante.'),
(137, 39, 'L\'héritage est une méthode de déclaration.'),
(138, 39, 'L\'héritage est une fonction de destructeur.'),
(139, 40, 'type* nomPointeur;'),
(140, 40, 'type& nomPointeur;'),
(141, 40, 'type nomPointeur*;');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `matricule` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'Etudiant'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CFBDFA14A76ED395` (`user_id`),
  ADD KEY `IDX_CFBDFA14591CC992` (`course_id`);

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8ADC54D5591CC992` (`course_id`);

--
-- Index pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5FB6DEC71E27F6BF` (`question_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `reponse`
--
ALTER TABLE `reponse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `FK_CFBDFA14591CC992` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `FK_CFBDFA14A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `FK_8ADC54D5591CC992` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `FK_5FB6DEC71E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
