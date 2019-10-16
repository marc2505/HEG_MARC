/* ----------------------------------------------------------------------------
Script : CC-Halloween-2015.sql                      Auteur : Christian Stettler
Objet  : Contrôle Continu de BDD 621.2 - 31.10.2015
---------------------------------------------------------------------------- */

-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- !!!!!          REMARQUE IMPORTANTE           !!!!!
-- !!!!!   CE SCRIPT NE DOIT PAS ÊTRE MODIFIÉ   !!!!!
-- !!!!!   ==================================   !!!!!
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- Vous devez exécuter une fois ce script pour créer l'environnement initial
-- puis faire vos requêtes dans un autre script.
-- Vous n'avez pas accès à ce script pour effectuer des modifications !!!!!

--------------------------------------------------------------------------
-- Création des tables de base et insertion des données initiales
--------------------------------------------------------------------------

-- suppression des tables de base fournies
DROP TABLE cc_achete;
DROP TABLE cc_produit;
DROP TABLE cc_type;
DROP TABLE cc_personne;

-- création des tables de base fournies
CREATE TABLE cc_personne (
   per_no          NUMBER(5)    CONSTRAINT pk_cc_personne PRIMARY KEY,
   per_nom         VARCHAR2(20),
   per_prenom      VARCHAR2(20),
   per_sexe        VARCHAR2(1),
   per_categorie   VARCHAR2(10)
);

CREATE TABLE cc_type (
   typ_no          NUMBER(5)    CONSTRAINT pk_cc_type PRIMARY KEY,
   typ_nom         VARCHAR2(10)
);

CREATE TABLE cc_produit (
   pro_no          NUMBER(5)    CONSTRAINT pk_cc_produit PRIMARY KEY,
   pro_nom         VARCHAR2(20),
   pro_prix        NUMBER(5,2),
   pro_typ_no      NUMBER(5)
);

CREATE TABLE cc_achete (
   ach_per_no      NUMBER(5) CONSTRAINT fk_cc_achete_personne REFERENCES cc_personne (per_no),
   ach_pro_no      NUMBER(5) CONSTRAINT fk_cc_achete_produit  REFERENCES cc_produit  (pro_no),
   ach_nombre      NUMBER(5),
   CONSTRAINT pk_cc_achete PRIMARY KEY (ach_per_no, ach_pro_no)
);

-- insertion des données initiales:
INSERT INTO cc_personne VALUES (1, 'Sauser', 'Alexandre', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (2, 'Blanco', 'Raphael', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (3, 'Parisot', 'Noe', 'M', 'Jeune');
INSERT INTO cc_personne VALUES (4, 'Piaget', 'Juliette', 'F', NULL);
INSERT INTO cc_personne VALUES (5, 'Gorgerat', 'Alexandre', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (6, 'Rey', 'Emilie', 'F', 'Etudiant');
INSERT INTO cc_personne VALUES (7, 'Charles', 'Geraldine', 'F', 'Assistant');
INSERT INTO cc_personne VALUES (8, 'Favre', 'Arthur', 'M', 'Prof');
INSERT INTO cc_personne VALUES (9, 'Minder', 'Liam', 'M', NULL);
INSERT INTO cc_personne VALUES (10, 'Saillen', 'Lynn', 'F', 'Jeune');
INSERT INTO cc_personne VALUES (11, 'Bartolini', 'Jan-Lucas', 'M', 'Assistant');
INSERT INTO cc_personne VALUES (12, 'Fraiseau', 'Samantha', 'F', 'Prof');
INSERT INTO cc_personne VALUES (13, 'Nasser', 'Theo', 'M', 'Assistant');
INSERT INTO cc_personne VALUES (14, 'Seppey', 'Loris', 'M', 'Prof');
INSERT INTO cc_personne VALUES (15, 'Pirolli', 'Antonia', 'F', 'Etudiant');
INSERT INTO cc_personne VALUES (16, 'Stucki', 'Marianne', 'F', 'Etudiant');
INSERT INTO cc_personne VALUES (17, 'Hofmann', 'Simon', 'M', NULL);
INSERT INTO cc_personne VALUES (18, 'Pastek', 'Tom', 'M', 'Jeune');
INSERT INTO cc_personne VALUES (19, 'Sandoz', 'Flavio', 'M', 'Prof');
INSERT INTO cc_personne VALUES (20, 'Blum', 'Kylian', 'M', 'Jeune');
INSERT INTO cc_personne VALUES (21, 'Ames', 'Paul', 'M', 'Assistant');
INSERT INTO cc_personne VALUES (22, 'Perroud', 'Cindy', 'F', 'Jeune');
INSERT INTO cc_personne VALUES (23, 'Kern', 'Gaetano', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (24, 'Cortez', 'Guillaume', 'M', 'Prof');
INSERT INTO cc_personne VALUES (25, 'Jaccard', 'Mandarine', 'F', 'Jeune');
INSERT INTO cc_personne VALUES (26, 'Lynch', 'Corentin', 'M', 'Prof');
INSERT INTO cc_personne VALUES (27, 'Nogueira', 'Sacha', 'M', 'Jeune');
INSERT INTO cc_personne VALUES (28, 'Major', 'Camille', 'F', 'Prof');
INSERT INTO cc_personne VALUES (29, 'Hofmann', 'Pascal', 'M', 'Jeune');
INSERT INTO cc_personne VALUES (30, 'Coulon', 'Aline', 'F', NULL);
INSERT INTO cc_personne VALUES (31, 'Pasche', 'Killian', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (32, 'Pessina', 'Sylvie', 'F', 'Assistant');
INSERT INTO cc_personne VALUES (33, 'Sarrasin', 'Johann', 'M', 'Jeune');
INSERT INTO cc_personne VALUES (34, 'Pastek', 'Linda', 'F', 'Etudiant');
INSERT INTO cc_personne VALUES (35, 'Martin', 'Gilles', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (36, 'Bichsel', 'Basile', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (37, 'Oguey', 'Melvyn', 'M', 'Prof');
INSERT INTO cc_personne VALUES (38, 'Gallaz', 'Rayan', 'M', 'Prof');
INSERT INTO cc_personne VALUES (39, 'Pastek', 'Justine', 'F', 'Jeune');
INSERT INTO cc_personne VALUES (40, 'Matthys', 'Nils', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (41, 'Tao', 'Ludovic', 'M', NULL);
INSERT INTO cc_personne VALUES (42, 'Berset', 'Noah', 'M', NULL);
INSERT INTO cc_personne VALUES (43, 'Weber', 'Lois', 'M', 'Assistant');
INSERT INTO cc_personne VALUES (44, 'Pastek', 'Coralie', 'F', 'Prof');
INSERT INTO cc_personne VALUES (45, 'Menetrier', 'Valentin', 'M', NULL);
INSERT INTO cc_personne VALUES (46, 'Sprunger', 'Anthony', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (47, 'Schnyder', 'Eluned', 'F', 'Jeune');
INSERT INTO cc_personne VALUES (48, 'Broccard', 'Marion', 'F', 'Jeune');
INSERT INTO cc_personne VALUES (49, 'Sierro', 'Celia', 'F', 'Etudiant');
INSERT INTO cc_personne VALUES (50, 'Viret', 'Nathan', 'M', 'Jeune');
INSERT INTO cc_personne VALUES (51, 'Bernet', 'Luka', 'M', 'Prof');
INSERT INTO cc_personne VALUES (52, 'Bouvard', 'Antonin', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (53, 'Rossi', 'Lisa', 'F', 'Assistant');
INSERT INTO cc_personne VALUES (54, 'Dudler', 'Charlotte', 'F', 'Etudiant');
INSERT INTO cc_personne VALUES (55, 'Busigny', 'Milos', 'M', NULL);
INSERT INTO cc_personne VALUES (56, 'Hamonic', 'Thomas', 'M', 'Jeune');
INSERT INTO cc_personne VALUES (57, 'Allet', 'Jeremie', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (58, 'Moret', 'Ethan', 'M', 'Jeune');
INSERT INTO cc_personne VALUES (59, 'Cretegny', 'Sathya', 'M', 'Prof');
INSERT INTO cc_personne VALUES (60, 'Fischer', 'Dominika', 'F', NULL);
INSERT INTO cc_personne VALUES (61, 'Daetsch', 'Amandine', 'F', 'Etudiant');
INSERT INTO cc_personne VALUES (62, 'Lepers', 'Mathieu', 'M', 'Prof');
INSERT INTO cc_personne VALUES (63, 'Tapparel', 'Diane', 'F', 'Assistant');
INSERT INTO cc_personne VALUES (64, 'Fantino', 'Alicia', 'F', NULL);
INSERT INTO cc_personne VALUES (65, 'Roulet', 'Joel', 'M', NULL);
INSERT INTO cc_personne VALUES (66, 'Gebauer', 'Romain', 'M', 'Jeune');
INSERT INTO cc_personne VALUES (67, 'Sismanovic', 'Felix', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (68, 'Chaves', 'Alexi', 'M', NULL);
INSERT INTO cc_personne VALUES (69, 'Duriaux', 'Severine', 'F', 'Jeune');
INSERT INTO cc_personne VALUES (70, 'Muzzolin', 'Benjamin', 'M', 'Etudiant');
INSERT INTO cc_personne VALUES (71, 'Pastek', 'Eliane', 'F', 'Assistant');
INSERT INTO cc_personne VALUES (72, 'Behrens', 'Axel', 'M', 'Jeune');
INSERT INTO cc_personne VALUES (73, 'Baker', 'Valentin', 'M', NULL);
INSERT INTO cc_personne VALUES (74, 'Mekonen', 'Sara', 'F', 'Assistant');
INSERT INTO cc_personne VALUES (75, 'Muller', 'Kim', 'F', 'Etudiant');
COMMIT;

INSERT INTO cc_type VALUES (1, 'Boisson');
INSERT INTO cc_type VALUES (2, 'Alcool');
INSERT INTO cc_type VALUES (3, 'Gâteau');
COMMIT;

INSERT INTO cc_produit VALUES (1, 'Cocktail courge',     3.5, 2);
INSERT INTO cc_produit VALUES (2, 'Cupcake sorcière',    3.0, 3);
INSERT INTO cc_produit VALUES (3, 'Muffin citrouille',   3.0, 3);
INSERT INTO cc_produit VALUES (4, 'Jus de courge',       2.5, 1);
INSERT INTO cc_produit VALUES (5, 'Courg''burger',       5.0, 3);
INSERT INTO cc_produit VALUES (6, 'Cerveau en pastèque', 4.0, 3);
INSERT INTO cc_produit VALUES (7, 'Cocktail sorcière',   4.5, 2);
INSERT INTO cc_produit VALUES (8, 'Doigt d''araignée',   2.5, 3);
INSERT INTO cc_produit VALUES (9, 'Soupe de courge',     4.0, 1);
INSERT INTO cc_produit VALUES (10, 'Chips fantôme',      2.0, 3);
INSERT INTO cc_produit VALUES (11, 'Jus de courge',      4.0, 1);
INSERT INTO cc_produit VALUES (12, 'Cupcake citrouille', 3.0, 3);
INSERT INTO cc_produit VALUES (13, 'Bière à la courge',  3.0, 2);
INSERT INTO cc_produit VALUES (14, 'Dexter cupcake',     3.5, 3);
INSERT INTO cc_produit VALUES (15, 'Tarte à la courge',  3.5, 3);
INSERT INTO cc_produit VALUES (16, 'Frites-Potiron',     2.5, 3);
INSERT INTO cc_produit VALUES (17, 'Bière du fantôme',   3.0, 2);
INSERT INTO cc_produit VALUES (18, 'Coca-Courge',        2.0, 1);
COMMIT;

INSERT INTO cc_achete VALUES ( 1,  3, 1);
INSERT INTO cc_achete VALUES ( 3,  4, 1);
INSERT INTO cc_achete VALUES ( 4, 11, 1);
INSERT INTO cc_achete VALUES ( 4, 17, 1);
INSERT INTO cc_achete VALUES ( 7,  4, 1);
INSERT INTO cc_achete VALUES ( 9, 16, 4);
INSERT INTO cc_achete VALUES (11, 11, 1);
INSERT INTO cc_achete VALUES (15,  5, 1);
INSERT INTO cc_achete VALUES (22,  4, 2);
INSERT INTO cc_achete VALUES (23, 14, 1);
INSERT INTO cc_achete VALUES (25, 12, 1);
INSERT INTO cc_achete VALUES (27, 13, NULL);
INSERT INTO cc_achete VALUES (28,  1, 1);
INSERT INTO cc_achete VALUES (28,  2, 1);
INSERT INTO cc_achete VALUES (28,  3, 3);
INSERT INTO cc_achete VALUES (28,  4, 2);
INSERT INTO cc_achete VALUES (29,  6, 1);
INSERT INTO cc_achete VALUES (31,  7, 1);
INSERT INTO cc_achete VALUES (31,  8, NULL);
INSERT INTO cc_achete VALUES (31,  9, 1);
INSERT INTO cc_achete VALUES (31, 10, 1);
INSERT INTO cc_achete VALUES (31, 11, 4);
INSERT INTO cc_achete VALUES (31, 12, 3);
INSERT INTO cc_achete VALUES (33,  5, 1);
INSERT INTO cc_achete VALUES (33, 13, 1);
INSERT INTO cc_achete VALUES (35, 10, 3);
INSERT INTO cc_achete VALUES (35, 11, 1);
INSERT INTO cc_achete VALUES (39,  1, 1);
INSERT INTO cc_achete VALUES (39,  3, 1);
INSERT INTO cc_achete VALUES (39, 11, 0);
INSERT INTO cc_achete VALUES (40,  7, 1);
INSERT INTO cc_achete VALUES (40,  8, 1);
INSERT INTO cc_achete VALUES (41,  2, 0);
INSERT INTO cc_achete VALUES (41,  3, NULL);
INSERT INTO cc_achete VALUES (43,  7, 1);
INSERT INTO cc_achete VALUES (44,  3, 1);
INSERT INTO cc_achete VALUES (50, 11, 0);
INSERT INTO cc_achete VALUES (51,  3, 3);
INSERT INTO cc_achete VALUES (55, 10, 2);
INSERT INTO cc_achete VALUES (55, 15, 1);
INSERT INTO cc_achete VALUES (57, 11, 1);
INSERT INTO cc_achete VALUES (58, 14, 1);
INSERT INTO cc_achete VALUES (61, 11, 0);
INSERT INTO cc_achete VALUES (71,  4, 2);
INSERT INTO cc_achete VALUES (72,  2, 1);
INSERT INTO cc_achete VALUES (72,  6, 0);
INSERT INTO cc_achete VALUES (74,  4, NULL);
INSERT INTO cc_achete VALUES (75, 11, 1);
INSERT INTO cc_achete VALUES (75, 13, 3);
INSERT INTO cc_achete VALUES (75, 14, 1);
COMMIT;
