-- Pays / Associations / Rôles / Missions / JDR / Dispos / Matériel
INSERT INTO Pays VALUES ('France'), ('Belgique'), ('Suisse');

INSERT INTO Association VALUES ('LesRoisDuJDR'), ('DragonsNoirs'), ('GuildOfHeroes');

INSERT INTO Role (nom_role, duree_role) VALUES
('roi', 120), ('reine', 120), ('chevalier', 90),
('mage', 90), ('voleur', 60), ('detective', 120), ('suspect', 90), ('guerrier', 100);

INSERT INTO Mission VALUES
('tuer_roi'), ('defendre_chateau'), ('trouver_tresor'),
('interroger_suspects'), ('chercher_indices'), ('capturer_prisonnier');

INSERT INTO JDR (nom_jeu, duree_role) VALUES
('Tournoi Medieval', 360),
('Quete Fantastique', 480),
('Donjon Urbain', 240),
('Enquete Victorienne', 300);

INSERT INTO Disponibilite VALUES
('2025-01-15', '2025-01-20'),
('2025-02-01', '2025-02-05'),
('2025-03-01', '2025-03-02'),
('2025-03-15', '2025-03-16');

INSERT INTO Materiel (nom_m, quantite) VALUES
('epees_latex', 15),
('armures_mousse', 8),
('de_20_faces', 50),
('boucliers_mousse', 10),
('cape_noire', 20),
('torches_led', 30);

-- Villes / Adresses / Salles
INSERT INTO Ville VALUES
('Paris', 'France'),
('Lyon', 'France'),
('Bruxelles', 'Belgique'),
('Geneve', 'Suisse');

INSERT INTO Adresse VALUES
(1, 12, 'Paris'),
(2, 45, 'Lyon'),
(3, 78, 'Bruxelles'),
(4, 10, 'Geneve');

INSERT INTO Salle VALUES
(101, 200, 1),
(102, 150, 2),
(103, 300, 3),
(104, 120, 4);

-- Participants (ids auto)
INSERT INTO Participant (nom, prenom, motivation, experience, nom_asso, code_a) VALUES
('DUPONT', 'Martin', 'Passionne de JDR depuis 10 ans', 'expert', 'LesRoisDuJDR', 1),
('LEMAIRE', 'Sophie', 'Debutante motivee', 'novice', 'LesRoisDuJDR', 1),
('PETIT', 'Lucas', 'Aime les roles de combat', 'moyen', 'DragonsNoirs', 2),
('MOREAU', 'Emma', 'Experimentee en intrigue', 'expert', 'DragonsNoirs', 2),
('MARTIN', 'Alice', 'Adore les enigmes', 'intermediaire', 'GuildOfHeroes', 4),
('ROBERT', 'Nicolas', 'Fan de combats epique', 'avance', 'GuildOfHeroes', 4),
('DURAND', 'Pierre', 'Guerrier chevronne', 'expert', 'LesRoisDuJDR', 1),
('LEGRAND', 'Julie', 'Maitre des enigmes', 'expert', 'GuildOfHeroes', 4),
('BERNARD', 'Thomas', 'Partenaire de Julie', 'avance', 'GuildOfHeroes', 4);

-- Assos, rôles, partenaires, dispos, etc.
INSERT INTO Ass_asso_participant VALUES
('LesRoisDuJDR', 1), ('LesRoisDuJDR', 2), ('DragonsNoirs', 3),
('DragonsNoirs', 4), ('GuildOfHeroes', 5), ('GuildOfHeroes', 6),
('LesRoisDuJDR', 7), ('GuildOfHeroes', 8), ('GuildOfHeroes', 9);

INSERT INTO Partenaire VALUES
(1, 2, 'frere_soeur'),
(3, 4, 'couple'),
(8, 9, 'duo_detective');

INSERT INTO Ass_role_participant VALUES
(1, 'roi', '2025-01-10'),
(2, 'reine', '2025-01-10'),
(3, 'chevalier', '2025-01-10'),
(4, 'mage', '2025-01-10'),
(5, 'detective', '2025-02-20'),
(6, 'suspect', '2025-02-20'),
(7, 'guerrier', '2025-01-10'),
(8, 'detective', '2025-03-01'),
(9, 'suspect', '2025-03-01');

INSERT INTO Ass_mission_role VALUES
('tuer_roi', 'voleur', 60),
('defendre_chateau', 'chevalier', 90),
('interroger_suspects', 'detective', 60),
('chercher_indices', 'detective', 60),
('interroger_suspects', 'suspect', 30),
('capturer_prisonnier', 'guerrier', 80);

INSERT INTO Ass_JDR_mission VALUES
('tuer_roi', 'Tournoi Medieval'),
('defendre_chateau', 'Tournoi Medieval'),
('interroger_suspects', 'Enquete Victorienne'),
('chercher_indices', 'Enquete Victorienne'),
('capturer_prisonnier', 'Tournoi Medieval');

INSERT INTO Ass_salle_JDR VALUES
(101, 'Tournoi Medieval', 'medieval'),
(102, 'Quete Fantastique', 'fantasy'),
(103, 'Donjon Urbain', 'donjon'),
(104, 'Enquete Victorienne', 'enquete'),
(103, 'Tournoi Medieval', 'medieval');

INSERT INTO Ass_dispo_salle VALUES
(101, '2025-01-15', '2025-01-20'),
(102, '2025-02-01', '2025-02-05'),
(104, '2025-03-01', '2025-03-02'),
(103, '2025-03-15', '2025-03-16');

INSERT INTO Ass_dispo_participant VALUES
(1, '2025-01-15', '2025-01-20'),
(2, '2025-01-15', '2025-01-20'),
(7, '2025-01-15', '2025-01-20'),
(5, '2025-03-01', '2025-03-02'),
(6, '2025-03-15', '2025-03-16'),
(8, '2025-03-01', '2025-03-02'),
(9, '2025-03-01', '2025-03-02');

INSERT INTO Ass_materiel_salle VALUES
(101, 'epees_latex'),
(101, 'armures_mousse'),
(101, 'torches_led'),
(104, 'boucliers_mousse'),
(104, 'cape_noire');
