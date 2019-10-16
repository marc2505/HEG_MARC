/* ----------------------------------------------------------------------------
Script : CreerEnv-Gaming.sql                         Auteur : Christine Rizzi
Objet  : CC 621-2 BDD - date - Jeux - Création et remplissage des tables
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

-- suppression des tables 
DROP TABLE cc_niveau CASCADE CONSTRAINTS;
DROP TABLE cc_jeu CASCADE CONSTRAINTS;
DROP TABLE cc_joueur CASCADE CONSTRAINTS;

-- création des tables de base fournies
CREATE TABLE cc_niveau (
   niv_no       NUMBER(5)    CONSTRAINT pk_cc_niveau PRIMARY KEY,
   niv_nom      VARCHAR2(15) CONSTRAINT uk_niveau_nom UNIQUE
);

CREATE TABLE cc_jeu (
   jeu_no       NUMBER(5)    CONSTRAINT pk_cc_jeu PRIMARY KEY,
   jeu_nom      VARCHAR2(50) CONSTRAINT uk_jeu_nom UNIQUE,
   jeu_max_j    NUMBER(3),
   jeu_age_min  NUMBER(2),
   jeu_fam_jeu_no NUMBER(5),
   jeu_statut   VARCHAR2(1)
);

CREATE TABLE cc_joueur (
   jou_no       NUMBER(5)    CONSTRAINT pk_cc_joueur PRIMARY KEY,
   jou_nom      VARCHAR2(15),
   jou_prenom   VARCHAR2(15),
   jou_genre     VARCHAR2(1),
   jou_ddn      DATE,
   jou_jeu_no   NUMBER(15) CONSTRAINT fk_cc_jeu_no REFERENCES cc_jeu(jeu_no),
   jou_niv_no   NUMBER(5),
   jou_geo_lieu VARCHAR2(25),
   CONSTRAINT uk_jou_nom_prenom UNIQUE (jou_nom, jou_prenom)
);

  -- ajouter les  clés étrangères de la table CC_JOUEURS
ALTER TABLE cc_joueur ADD CONSTRAINT fk_joueur_niveau FOREIGN KEY (jou_niv_no) REFERENCES cc_niveau(niv_no);


-- intégrer les niveaux de jeux
INSERT INTO cc_niveau VALUES (1, 'Easy');
INSERT INTO cc_niveau VALUES (2, 'Medium');
INSERT INTO cc_niveau VALUES (3, 'Hard');
INSERT INTO cc_niveau VALUES (4, 'Expert');
INSERT INTO cc_niveau VALUES (5, 'Master');
INSERT INTO cc_niveau VALUES (6, 'Grand Master');
COMMIT;

-- ajouter les jeux
insert into cc_jeu values (82,'Age of Empires',82,12,82,1);
insert into cc_jeu values (99,'Age of Empires II: The Age of Kings',81,8,82,1);
insert into cc_jeu values (48,'Assassin''s Creed II',90,8,null,1);
insert into cc_jeu values (33,'Batman: Arkham Asylum',28,16,25,1);
insert into cc_jeu values (25,'Batman: Arkham City',20,12,25,1);
insert into cc_jeu values (16,'BioShock',32,16,16,1);
insert into cc_jeu values (77,'BioShock Infinite',63,8,16,1);
insert into cc_jeu values (86,'Borderlands 2',8,18,null,1);
insert into cc_jeu values (63,'Call of Duty 4: Modern Warfare',77,16,63,1);
insert into cc_jeu values (68,'Call of Duty: Modern Warfare 2',99,12,63,1);
insert into cc_jeu values (81,'Castlevania: Symphony of the Night',96,18,null,1);
insert into cc_jeu values (15,'Chrono Trigger',79,8,null,1);
insert into cc_jeu values (85,'Contra',72,16,null,1);
insert into cc_jeu values (84,'Crash Bandicoot',54,12,null,1);
insert into cc_jeu values (92,'Dark Souls',80,16,null,1);
insert into cc_jeu values (62,'Diablo II',78,16,null,1);
insert into cc_jeu values (37,'Donkey Kong Country',45,8,null,1);
insert into cc_jeu values (34,'Doom',52,18,null,1);
insert into cc_jeu values (83,'Dragon Age: Origins',51,16,null,1);
insert into cc_jeu values (18,'Fallout 3',41,18,18,1);
insert into cc_jeu values (30,'Fallout: New Vegas',64,8,18,1);
insert into cc_jeu values (89,'Final Fantasy IX',99,16,9,1);
insert into cc_jeu values (65,'Final Fantasy VI',77,18,9,1);
insert into cc_jeu values (9,'Final Fantasy VII',52,8,9,1);
insert into cc_jeu values (100,'Final Fantasy VIII',72,18,9,1);
insert into cc_jeu values (60,'Final Fantasy X',92,16,9,1);
insert into cc_jeu values (47,'God of War',94,8,47,1);
insert into cc_jeu values (91,'God of War 3',3,12,47,1);
insert into cc_jeu values (93,'God of War II',50,12,47,1);
insert into cc_jeu values (17,'GoldenEye 007',31,12,null,1);
insert into cc_jeu values (51,'Grand Theft Auto III',55,8,7,1);
insert into cc_jeu values (41,'Grand Theft Auto IV',40,8,7,1);
insert into cc_jeu values (22,'Grand Theft Auto V',27,18,7,1);
insert into cc_jeu values (7,'Grand Theft Auto: San Andreas',22,12,7,1);
insert into cc_jeu values (31,'Grand Theft Auto: Vice City',51,18,7,1);
insert into cc_jeu values (52,'Half-Life',48,16,20,1);
insert into cc_jeu values (20,'Half-Life 2',36,12,20,1);
insert into cc_jeu values (71,'Halo 2',4,18,20,1);
insert into cc_jeu values (49,'Halo 3',61,8,20,1);
insert into cc_jeu values (38,'Halo: Combat Evolved',79,18,20,1);
insert into cc_jeu values (57,'Kingdom Hearts',53,8,57,1);
insert into cc_jeu values (74,'Kingdom Hearts II',14,18,57,1);
insert into cc_jeu values (19,'Mario Kart 64',31,18,8,1);
insert into cc_jeu values (96,'Mario Kart Wii',40,16,8,1);
insert into cc_jeu values (35,'Mass Effect',53,12,12,1);
insert into cc_jeu values (12,'Mass Effect 2',67,12,12,1);
insert into cc_jeu values (67,'Mass Effect 3',70,18,12,1);
insert into cc_jeu values (98,'Mega Man 2',29,18,null,1);
insert into cc_jeu values (53,'Metal Gear Solid',58,12,53,1);
insert into cc_jeu values (87,'Metal Gear Solid 3: Snake Eater',41,8,53,1);
insert into cc_jeu values (75,'Metroid Prime',54,18,null,1);
insert into cc_jeu values (42,'Minecraft',27,12,null,1);
insert into cc_jeu values (46,'Mortal Kombat',18,18,null,1);
insert into cc_jeu values (66,'Pac-Man',7,16,null,1);
insert into cc_jeu values (56,'Pokémon Gold and Silver',49,8,14,1);
insert into cc_jeu values (14,'Pokémon Red and Blue',36,16,14,1);
insert into cc_jeu values (64,'Pokémon Yellow',61,18,14,1);
insert into cc_jeu values (24,'Portal',21,12,null,1);
insert into cc_jeu values (32,'Portal 2',15,16,null,1);
insert into cc_jeu values (10,'Red Dead Redemption',25,8,null,1);
insert into cc_jeu values (76,'Resident Evil',71,12,76,1);
insert into cc_jeu values (97,'Resident Evil 2',80,12,76,1);
insert into cc_jeu values (21,'Resident Evil 4',7,12,76,1);
insert into cc_jeu values (58,'Shadow of the Colossus',78,18,null,1);
insert into cc_jeu values (80,'Silent Hill 2',16,8,80,1);
insert into cc_jeu values (94,'Silent Hill Konami',79,8,80,1);
insert into cc_jeu values (43,'Sonic the Hedgehog',14,12,43,1);
insert into cc_jeu values (88,'Sonic the Hedgehog 2',5,16,43,1);
insert into cc_jeu values (78,'Star Fox 64',86,18,null,1);
insert into cc_jeu values (59,'Star Wars: Battlefront II',42,16,26,1);
insert into cc_jeu values (26,'Star Wars: Knights of the Old Republic',17,8,26,1);
insert into cc_jeu values (90,'StarCraft',58,12,null,1);
insert into cc_jeu values (50,'Street Fighter II',36,8,null,1);
insert into cc_jeu values (5,'Super Mario 64',54,12,8,1);
insert into cc_jeu values (8,'Super Mario Bros.',65,18,8,1);
insert into cc_jeu values (79,'Super Mario Bros. 2',88,8,8,1);
insert into cc_jeu values (3,'Super Mario Bros. 3',66,8,8,1);
insert into cc_jeu values (61,'Super Mario Galaxy',99,16,8,1);
insert into cc_jeu values (45,'Super Mario Kart',85,8,8,1);
insert into cc_jeu values (4,'Super Mario World',60,18,8,1);
insert into cc_jeu values (36,'Super Metroid',57,8,23,1);
insert into cc_jeu values (40,'Super Smash Bros.',65,8,23,1);
insert into cc_jeu values (55,'Super Smash Bros. Brawl',2,12,23,1);
insert into cc_jeu values (23,'Super Smash Bros. Melee',24,18,23,1);
insert into cc_jeu values (11,'Tetris',81,12,null,1);
insert into cc_jeu values (70,'The Elder Scrolls III: Morrowind',36,16,2,1);
insert into cc_jeu values (27,'The Elder Scrolls IV: Oblivion',38,12,2,1);
insert into cc_jeu values (2,'The Elder Scrolls V: Skyrim',29,18,2,1);
insert into cc_jeu values (13,'The Last of Us',11,18,null,1);
insert into cc_jeu values (29,'The Legend of Zelda',21,16,1,1);
insert into cc_jeu values (6,'The Legend of Zelda: A Link to the Past',79,18,1,1);
insert into cc_jeu values (44,'The Legend of Zelda: Majora''s Mask',22,16,1,1);
insert into cc_jeu values (1,'The Legend of Zelda: Ocarina of Time',65,12,1,1);
insert into cc_jeu values (54,'The Legend of Zelda: The Wind Waker',94,12,1,1);
insert into cc_jeu values (73,'The Legend of Zelda: Twilight Princess',98,18,1,1);
insert into cc_jeu values (72,'The Sims',17,18,null,1);
insert into cc_jeu values (28,'The Witcher 3: Wild Hunt',6,8,null,1);
insert into cc_jeu values (39,'Uncharted 2: Among Thieves',73,12,39,1);
insert into cc_jeu values (95,'Uncharted 3: Drake''s Deception',58,16,39,1);
insert into cc_jeu values (69,'World of Warcraft',92,18,null,1);
COMMIT;

-- ajouter les joueurs
INSERT INTO cc_joueur vALUES (100, 'Blanc', 'Barbara', 'F','3.4.2000',15,1,'Genève');
INSERT INTO cc_joueur vALUES (101, 'Perrin', 'Xavier', 'm','4.10.2005',11,4,'Yverdon-les-Bains');
INSERT INTO cc_joueur vALUES (102, 'Lebert', 'Caroline', 'F','21.8.2007',15,3,'Genève');
INSERT INTO cc_joueur vALUES (103, 'Délèze', 'Patricia', 'F','4.10.2004',42,6,'Neuchâtel');
INSERT INTO cc_joueur vALUES (104, 'Abatti', 'Roxana', 'F','5.8.1999',62,3,'Neuchâtel');
INSERT INTO cc_joueur vALUES (105, 'Delaloye', 'Stuart', 'M','20.7.2016',37,3,'Berne');
INSERT INTO cc_joueur vALUES (106, 'Coursier', 'Natalie', 'F','1.12.2002',80,5,'Fribourg');
INSERT INTO cc_joueur vALUES (107, 'Speich', 'Alexandre', 'M','5.5.1998',99,1,'Genève');
INSERT INTO cc_joueur vALUES (108, 'Peyrot', 'Alexandre', 'M','14.6.2011',2,1,'Genève');
INSERT INTO cc_joueur vALUES (109, 'Keller', 'Hugo', 'M','24.8.2005',55,6,'Lausanne');
INSERT INTO cc_joueur vALUES (110, 'Ujlaky', 'Sandra', 'F','23.10.2003',81,6,'Berne');
INSERT INTO cc_joueur vALUES (111, 'Segal', 'Carolina', 'F','13.7.2006',98,2,'Genève');
INSERT INTO cc_joueur vALUES (112, 'Hammad', 'Andrea', 'M','26.6.2002',59,4,'Genève');
INSERT INTO cc_joueur vALUES (113, 'Megevand', 'Philippe', 'M','20.2.2003',96,2,'Neuchâtel');
INSERT INTO cc_joueur vALUES (114, 'Cardoso', 'Estelle', 'F','17.4.2004',73,1,'Lausanne');
INSERT INTO cc_joueur vALUES (115, 'Bignens', 'Duncan', 'M','6.7.2002',99,6,'Lausanne');
INSERT INTO cc_joueur vALUES (116, 'Pache', 'Bruno', 'M','2.6.2003',96,3,'Genève');
INSERT INTO cc_joueur vALUES (117, 'Sauser', 'Cecilia', 'F','12.5.1998',28,3,'Genève');
INSERT INTO cc_joueur vALUES (118, 'Lessard', 'Caroline', 'F','18.7.2005',89,2,'Genève');
INSERT INTO cc_joueur vALUES (119, 'Deruy', 'Jean-Baptiste', 'M','25.11.2006',78,2,'Nyon');
INSERT INTO cc_joueur vALUES (120, 'Decrenisse', 'Myriam', 'F','9.8.2007',39,6,'Fribourg');
INSERT INTO cc_joueur vALUES (121, 'Vesin', 'Anne', 'F','1.4.2005',23,4,'Genève');
INSERT INTO cc_joueur vALUES (122, 'Pereira', 'Emilie', 'F','6.7.2005',4,3,'Lausanne');
INSERT INTO cc_joueur vALUES (123, 'Queval', 'Réka', 'F','24.12.2007',33,5,'Neuchâtel');
INSERT INTO cc_joueur vALUES (124, 'Stemberger', 'Magali', 'F','21.10.2006',62,2,'Fribourg');
INSERT INTO cc_joueur vALUES (125, 'Lacroix', 'Martina', 'F','22.2.2006',94,6,'Fribourg');
INSERT INTO cc_joueur vALUES (126, 'Tanzi', 'Matteo', 'M','15.4.2002',13,3,'Fribourg');
INSERT INTO cc_joueur vALUES (127, 'Brunel', 'Ivan', 'M','24.8.2008',37,2,'Nyon');
INSERT INTO cc_joueur vALUES (128, 'Chevalley', 'Timothy', 'M','24.4.2004',8,6,'Berne');
INSERT INTO cc_joueur vALUES (129, 'Deculty', 'Ludovic', 'M','6.5.2003',24,2,'Fribourg');
INSERT INTO cc_joueur vALUES (130, 'Dufournet', 'Nicolas', 'M','12.5.2010',20,2,'Fribourg');
INSERT INTO cc_joueur vALUES (131, 'Michaud', 'Benoit', 'M','26.11.2005',70,2,'Genève');
INSERT INTO cc_joueur vALUES (132, 'Agnès', 'Carlo', 'M','29.3.2003',70,5,'Genève');
INSERT INTO cc_joueur vALUES (133, 'Javaman', 'Cédric', 'M','25.3.2009',65,6,'Genève');
INSERT INTO cc_joueur vALUES (134, 'Rapido', 'Priscilla', 'F','13.11.2009',48,3,'Neuchâtel');
INSERT INTO cc_joueur vALUES (135, 'Cupelin', 'Rui', 'M','22.1.2005',84,4,'Neuchâtel');
INSERT INTO cc_joueur vALUES (136, 'Bigard', 'Viviane', 'F','28.1.2005',32,2,'Yverdon-les-Bains');
INSERT INTO cc_joueur vALUES (137, 'Lopez', 'Filippo', 'M','1.10.1998',6,3,'Lausanne');
INSERT INTO cc_joueur vALUES (138, 'Mortelier', 'Claudia', 'F','6.11.2008',84,6,'Genève');
INSERT INTO cc_joueur vALUES (139, 'Mehran', 'Sarah', 'F','27.7.2007',82,2,'Berne');
INSERT INTO cc_joueur vALUES (140, 'Rouzaud', 'Laurent', 'M','2.7.2004',37,4,'Fribourg');
INSERT INTO cc_joueur vALUES (141, 'Brette', 'Peter', 'M','22.8.2002',74,4,'Neuchâtel');
INSERT INTO cc_joueur vALUES (142, 'Lamour', 'Sarah', 'F','5.12.2003',91,5,'Berne');
INSERT INTO cc_joueur vALUES (143, 'Ferguson', 'Sandra', 'F','8.11.2009',77,2,'Berne');
INSERT INTO cc_joueur vALUES (144, 'Glaser', 'Anne-Sophie', 'F','28.11.2005',5,6,'Genève');
INSERT INTO cc_joueur vALUES (145, 'Guerfalli', 'Carolina', 'F','30.6.2010',41,1,'Genève');
INSERT INTO cc_joueur vALUES (146, 'Ducommun', 'John-Henry', 'M','2.2.2004',26,4,'Nyon');
INSERT INTO cc_joueur vALUES (147, 'Rohrer', 'Krisztian', 'M','14.5.2006',40,1,'Nyon');
INSERT INTO cc_joueur vALUES (148, 'Toso', 'Amelie', 'F','3.11.2002',26,1,'Genève');
INSERT INTO cc_joueur vALUES (149, 'Piatscheck', 'Johan', 'M','7.12.2002',40,3,'Nyon');
INSERT INTO cc_joueur vALUES (150, 'Breton', 'Alexis', 'M','4.4.1998',92,3,'Genève');
INSERT INTO cc_joueur vALUES (151, 'Orias', 'Vincent', 'M','25.1.2005',77,5,'Yverdon-les-Bains');
INSERT INTO cc_joueur vALUES (152, 'Burgueno', 'Salvatore', 'M','29.9.1997',65,4,'Berne');
INSERT INTO cc_joueur vALUES (153, 'Charlaix', 'Christophe', 'M','1.9.2005',43,6,'Genève');
INSERT INTO cc_joueur vALUES (154, 'Boisbineuf', 'Matteo', 'M','5.1.2004',93,4,'Fribourg');
INSERT INTO cc_joueur vALUES (155, 'Laurent', 'Marcel', 'M','20.4.2007',65,1,'Fribourg');
INSERT INTO cc_joueur vALUES (156, 'Brun', 'Jerome', 'M','24.3.2006',32,3,'Nyon');
INSERT INTO cc_joueur vALUES (157, 'Hutter', 'Stephane', 'M','15.6.2003',30,6,'Berne');
INSERT INTO cc_joueur vALUES (158, 'Gertsch', 'Damien', 'M','12.8.2003',25,6,'Lausanne');
INSERT INTO cc_joueur vALUES (159, 'Soleymani', 'Carole', 'F','11.10.2006',37,4,'Genève');
INSERT INTO cc_joueur vALUES (160, 'Bonvin', 'Laurent', 'M','18.10.2004',36,5,'Nyon');
INSERT INTO cc_joueur vALUES (161, 'Desbiolles', 'Carlos', 'M','28.2.2004',52,3,'Genève');
INSERT INTO cc_joueur vALUES (162, 'Meunier', 'Philip', 'M','6.12.1996',86,3,'Neuchâtel');
INSERT INTO cc_joueur vALUES (163, 'Vahlé', 'Thibaut', 'M','9.10.2008',45,4,'Berne');
INSERT INTO cc_joueur vALUES (164, 'Medema', 'Sofia', 'F','27.6.2003',44,3,'Berne');
INSERT INTO cc_joueur vALUES (165, 'Jeker', 'Laurent', 'M','1.4.1996',43,3,'Nyon');
INSERT INTO cc_joueur vALUES (166, 'Wignall', 'Christophe', 'M','16.1.2002',82,2,'Genève');
INSERT INTO cc_joueur vALUES (167, 'Petzold', 'Evelyn', 'F','29.9.2004',100,1,'Lausanne');
INSERT INTO cc_joueur vALUES (168, 'Schacher', 'Griselda', 'F','31.7.2005',49,6,'Lausanne');
INSERT INTO cc_joueur vALUES (169, 'Rouyat', 'Anne', 'F','30.11.2007',91,1,'Genève');
INSERT INTO cc_joueur vALUES (170, 'Parcero', 'Alexandre', 'M','25.8.2005',98,5,'Genève');
INSERT INTO cc_joueur vALUES (171, 'Kurik', 'Adrien', 'M','15.1.2002',41,6,'Genève');
INSERT INTO cc_joueur vALUES (172, 'Megret', 'Marion', 'F','26.12.1998',30,6,'Fribourg');
INSERT INTO cc_joueur vALUES (173, 'Klejniak', 'Olivier', 'M','21.2.2011',69,6,'Fribourg');
INSERT INTO cc_joueur vALUES (174, 'Illi', 'Béatriz', 'F','8.12.2006',9,4,'Genève');
INSERT INTO cc_joueur vALUES (175, 'Ycabart', 'Vincent', 'M','16.11.2003',6,2,'Yverdon-les-Bains');
INSERT INTO cc_joueur vALUES (176, 'Zuaboni', 'Jean-Fabien', 'M','14.5.2010',50,1,'Nyon');
INSERT INTO cc_joueur vALUES (177, 'Mokrab', 'Julien', 'M','14.8.2003',7,5,'Nyon');
INSERT INTO cc_joueur vALUES (178, 'Bokhorst', 'Cédric', 'M','26.7.2003',23,4,'Genève');
INSERT INTO cc_joueur vALUES (179, 'Morand', 'Nadège', 'F','15.3.2003',81,2,'Fribourg');
INSERT INTO cc_joueur vALUES (180, 'Mccoy', 'Leslie', 'F','12.5.2000',56,6,'Fribourg');
INSERT INTO cc_joueur vALUES (181, 'Persat', 'Belinda', 'F','14.11.2001',86,1,'Genève');
INSERT INTO cc_joueur vALUES (182, 'Remy Jan', 'Hugues-Edouard', 'M','28.2.2006',13,1,'Nyon');
INSERT INTO cc_joueur vALUES (183, 'Kurt', 'Romano', 'M','8.1.2009',16,1,'Neuchâtel');
INSERT INTO cc_joueur vALUES (184, 'Mathieu', 'Vyver Bart', 'M','30.10.2000',19,2,'Yverdon-les-Bains');
INSERT INTO cc_joueur vALUES (185, 'Mari', 'Cedric', 'M','16.8.2015',4,5,'Genève');
INSERT INTO cc_joueur vALUES (186, 'Brillantes', 'Yuri', 'M','17.3.2005',43,3,'Yverdon-les-Bains');
INSERT INTO cc_joueur vALUES (187, 'Walckiers', 'Emmanuelle', 'F','22.9.2010',90,4,'Lausanne');
INSERT INTO cc_joueur vALUES (188, 'Montuori', 'Jérôme', 'M','13.11.2006',72,1,'Nyon');
INSERT INTO cc_joueur vALUES (189, 'Willis', 'Nicolas', 'M','12.4.2004',2,4,'Fribourg');
INSERT INTO cc_joueur vALUES (190, 'Fernet', 'Delphine', 'F','9.3.2009',65,5,'Lausanne');
INSERT INTO cc_joueur vALUES (191, 'Messerli', 'Laure', 'F','21.5.2003',42,2,'Fribourg');
INSERT INTO cc_joueur vALUES (192, 'Bel', 'Camille', 'F','20.5.2004',48,3,'Genève');
INSERT INTO cc_joueur vALUES (193, 'Choux', 'Odile', 'F','4.10.2009',96,5,'Fribourg');
INSERT INTO cc_joueur vALUES (194, 'Sergi', 'Cyril', 'M','9.1.2008',49,4,'Genève');
INSERT INTO cc_joueur vALUES (195, 'Cumes', 'Boris', 'M','15.7.2004',1,5,'Genève');
INSERT INTO cc_joueur vALUES (196, 'Rissetto', 'Fabrice', 'M','7.10.2003',14,3,'Lausanne');
INSERT INTO cc_joueur vALUES (197, 'Ducommun', 'Albert', 'M','7.11.2006',58,2,'Genève');
INSERT INTO cc_joueur vALUES (198, 'Punzi', 'Hermann', 'M','5.10.2008',69,1,'Lausanne');
INSERT INTO cc_joueur vALUES (199, 'Bellec', 'Sébastien', 'M','16.9.2001',1,3,'Berne');
INSERT INTO cc_joueur vALUES (200, 'Senave', 'Laurent', 'M','17.11.2008',61,4,'Fribourg');
INSERT INTO cc_joueur vALUES (201, 'Douglas', 'Flora', 'F','26.5.1998',39,3,'Lausanne');
INSERT INTO cc_joueur vALUES (202, 'Clemente', 'Nathalie', 'F','28.4.2006',28,2,'Fribourg');
INSERT INTO cc_joueur vALUES (203, 'Charrot', 'Pascal', 'M','17.6.2004',79,5,'Fribourg');
INSERT INTO cc_joueur vALUES (204, 'Auffret', 'Sergii', 'M','28.5.2003',54,2,'Berne');
INSERT INTO cc_joueur vALUES (205, 'Delachaux', 'Pascal', 'M','29.12.2006',53,5,'Fribourg');
INSERT INTO cc_joueur vALUES (206, 'Place', 'Julio', 'M','23.11.2006',62,1,'Nyon');
INSERT INTO cc_joueur vALUES (207, 'Bresset', 'Paulo', 'M','15.8.2002',82,1,'Neuchâtel');
INSERT INTO cc_joueur vALUES (208, 'Valette', 'Manuel', 'M','6.12.2009',7,4,'Fribourg');
INSERT INTO cc_joueur vALUES (209, 'Millet', 'Grégory', 'M','21.5.2003',27,4,'Lausanne');
INSERT INTO cc_joueur vALUES (210, 'Heude', 'Philippe', 'M','31.8.2005',91,3,'Neuchâtel');
INSERT INTO cc_joueur vALUES (211, 'Barranco', 'Christophe', 'M','24.11.2003',9,4,'Genève');
INSERT INTO cc_joueur vALUES (212, 'Wallach', 'William', 'M','21.5.2006',92,3,'Yverdon-les-Bains');
INSERT INTO cc_joueur vALUES (213, 'Merle', 'Antoine', 'M','10.6.2007',53,5,'Genève');
INSERT INTO cc_joueur vALUES (214, 'Paris', 'Frédéric', 'M','31.7.2003',89,3,'Lausanne');
INSERT INTO cc_joueur vALUES (215, 'Perrin', 'Caroline', 'F','21.8.1998',99,4,'Genève');
INSERT INTO cc_joueur vALUES (216, 'Vittori', 'Leite Daniel', 'M','18.3.2004',54,3,'Fribourg');
INSERT INTO cc_joueur vALUES (217, 'Karadzic', 'Sebastien', 'M','11.2.1997',26,3,'Berne');
INSERT INTO cc_joueur vALUES (218, 'Cosandier', 'Alexandre', 'M','20.5.2001',72,5,'Genève');
INSERT INTO cc_joueur vALUES (219, 'Rossellat', 'Benjamin', 'M','13.10.2005',54,2,'Genève');
INSERT INTO cc_joueur vALUES (220, 'Valticos', 'Paula', 'F','9.7.2005',43,3,'Neuchâtel');
INSERT INTO cc_joueur vALUES (221, 'Diserens', 'Olivier', 'M','24.12.2004',6,5,'Fribourg');
INSERT INTO cc_joueur vALUES (222, 'Tisserand', 'Michaël', 'M','19.5.2010',30,6,'Fribourg');
INSERT INTO cc_joueur vALUES (223, 'Pittard', 'Guillaume', 'M','8.12.2001',73,4,'Lausanne');
INSERT INTO cc_joueur vALUES (224, 'Macaskill', 'David', 'M','1.12.2006',62,5,'Lausanne');
INSERT INTO cc_joueur vALUES (225, 'Zinzeri', 'Aline', 'F','8.2.2004',78,3,'Genève');
INSERT INTO cc_joueur vALUES (226, 'Faoro', 'David', 'M','26.12.1998',39,6,'Lausanne');
INSERT INTO cc_joueur vALUES (227, 'Fell', 'Damien', 'M','22.6.2015',23,1,'Genève');
INSERT INTO cc_joueur vALUES (228, 'Gonzalez', 'Sarah', 'F','23.3.2003',6,6,'Berne');
INSERT INTO cc_joueur vALUES (229, 'Uzel', 'Peggy', 'F','7.10.1999',17,4,'Neuchâtel');
INSERT INTO cc_joueur vALUES (230, 'Revil', 'Séverine', 'F','19.5.2006',45,4,'Berne');
INSERT INTO cc_joueur vALUES (231, 'Byland', 'Estelle', 'F','3.3.2009',24,6,'Lausanne');
INSERT INTO cc_joueur vALUES (232, 'Dozzi', 'Sébastien', 'M','31.3.2002',79,4,'Berne');
INSERT INTO cc_joueur vALUES (233, 'Guerin', 'Simon', 'M','20.6.2000',53,2,'Berne');
INSERT INTO cc_joueur vALUES (234, 'Schenevey', 'Thierry', 'M','19.1.2007',48,3,'Berne');
INSERT INTO cc_joueur vALUES (235, 'Boch', 'Fabrice', 'M','1.3.2005',87,1,'Lausanne');
INSERT INTO cc_joueur vALUES (236, 'Engel', 'Yvon', 'M','3.6.1998',46,4,'Yverdon-les-Bains');
INSERT INTO cc_joueur vALUES (237, 'Sirié', 'Hicham', 'M','28.4.2005',4,3,'Lausanne');
INSERT INTO cc_joueur vALUES (238, 'Perret', 'Seppo', 'M','8.3.2006',79,6,'Berne');
INSERT INTO cc_joueur vALUES (239, 'Antunes', 'Matthew', 'M','28.3.2005',100,2,'Fribourg');
INSERT INTO cc_joueur vALUES (240, 'Latorre', 'David', 'M','26.3.1999',68,1,'Lausanne');
INSERT INTO cc_joueur vALUES (241, 'Henriot', 'Christine', 'F','3.1.2006',57,2,'Genève');
INSERT INTO cc_joueur vALUES (242, 'Favot', 'Marlen', 'F','19.8.2003',67,3,'Fribourg');
INSERT INTO cc_joueur vALUES (243, 'Gautier', 'Philippe', 'M','2.6.2001',51,1,'Neuchâtel');
INSERT INTO cc_joueur vALUES (244, 'Robert', 'Gwendoline', 'F','4.5.2004',82,1,'Lausanne');
INSERT INTO cc_joueur vALUES (245, 'Bartolini', 'Michele', 'M','17.9.2008',3,1,'Fribourg');
INSERT INTO cc_joueur vALUES (246, 'Picquenot', 'Alexandre', 'M','13.12.1999',39,1,'Genève');
INSERT INTO cc_joueur vALUES (247, 'Spicher', 'Sylvain', 'M','15.7.2009',93,4,'Berne');
INSERT INTO cc_joueur vALUES (248, 'Da Ascencao', 'Sebastien', 'M','6.12.2005',63,3,'Berne');
INSERT INTO cc_joueur vALUES (249, 'Adami', 'Giorgio', 'M','11.12.2002',62,4,'Lausanne');
INSERT INTO cc_joueur vALUES (250, 'Giorgis', 'Florian', 'M','6.5.2007',98,1,'Lausanne');
INSERT INTO cc_joueur vALUES (251, 'Wilcox', 'Stevan', 'M','13.10.2007',96,1,'Berne');
INSERT INTO cc_joueur vALUES (252, 'Bertuzzi', 'Patrick', 'M','29.7.2003',71,4,'Neuchâtel');
INSERT INTO cc_joueur vALUES (253, 'Bonvila', 'Livio', 'M','4.7.2009',72,2,'Fribourg');
INSERT INTO cc_joueur vALUES (254, 'Singh', 'Ben', 'M','27.1.1998',83,1,'Genève');
INSERT INTO cc_joueur vALUES (255, 'Giulietti', 'Didier', 'M','13.2.2005',80,5,'Lausanne');
INSERT INTO cc_joueur vALUES (256, 'Bertossa', 'David', 'M','28.7.2001',90,2,'Lausanne');
INSERT INTO cc_joueur vALUES (257, 'Dunlop', 'Michael', 'M','5.7.2003',75,5,'Fribourg');
INSERT INTO cc_joueur vALUES (258, 'Jeite', 'Senta', 'F','17.2.2004',67,3,'Berne');
INSERT INTO cc_joueur vALUES (259, 'Brachet', 'Christian', 'M','7.1.2007',70,3,'Genève');
INSERT INTO cc_joueur vALUES (260, 'Kouroulou', 'Mathieu', 'M','25.7.2001',32,2,'Fribourg');
INSERT INTO cc_joueur vALUES (261, 'Filippi', 'Hakan', 'M','8.6.2005',39,1,'Lausanne');
INSERT INTO cc_joueur vALUES (262, 'Rusch', 'Alejandro', 'M','17.1.2003',22,2,'Genève');
INSERT INTO cc_joueur vALUES (263, 'Freitag', 'Mia', 'F','14.6.2012',20,4,'Fribourg');
INSERT INTO cc_joueur vALUES (264, 'Machado', 'Nelson', 'M','17.2.2005',27,2,'Fribourg');
INSERT INTO cc_joueur vALUES (265, 'Perrin', 'Patrick', 'M','7.8.2010',9,5,'Neuchâtel');
INSERT INTO cc_joueur vALUES (266, 'Bottin', 'Emilie', 'F','7.2.2006',61,1,'Lausanne');
INSERT INTO cc_joueur vALUES (267, 'Qutaish', 'Paula', 'F','3.1.2002',68,5,'Neuchâtel');
INSERT INTO cc_joueur vALUES (268, 'Chambaz', 'Sabine', 'F','30.4.1999',26,6,'Neuchâtel');
INSERT INTO cc_joueur vALUES (269, 'Poisse', 'Fabrice', 'M','19.9.2003',65,6,'Lausanne');
INSERT INTO cc_joueur vALUES (270, 'Canovas', 'Charles-Albert', 'M','29.7.1998',39,3,'Genève');
INSERT INTO cc_joueur vALUES (271, 'Déon', 'Akbel', 'F','4.4.2005',3,2,'Genève');
INSERT INTO cc_joueur vALUES (272, 'Zysset', 'Christophe', 'M','24.7.2006',85,4,'Genève');
INSERT INTO cc_joueur vALUES (273, 'Tarbaoui', 'John', 'M','7.4.2008',75,5,'Nyon');
INSERT INTO cc_joueur vALUES (274, 'Boudaoui', 'Martin', 'M','19.10.2006',60,4,'Fribourg');
INSERT INTO cc_joueur vALUES (275, 'Onur', 'Christel', 'F','15.4.2006',9,6,'Genève');
INSERT INTO cc_joueur vALUES (276, 'Cardinaux', 'Francisco', 'M','7.1.2007',81,1,'Lausanne');
INSERT INTO cc_joueur vALUES (277, 'Brochand', 'Ludmilla', 'F','4.4.2010',72,1,'Fribourg');
INSERT INTO cc_joueur vALUES (278, 'Aboun', 'Pascual', 'M','2.1.2003',7,4,'Fribourg');
INSERT INTO cc_joueur vALUES (279, 'Pires', 'Magali', 'F','5.2.2000',62,2,'Fribourg');
INSERT INTO cc_joueur vALUES (280, 'Devaud', 'Xavier', 'M','22.11.2005',34,6,'Yverdon-les-Bains');
INSERT INTO cc_joueur vALUES (281, 'Horner', 'Paulo', 'M','5.6.2002',18,6,'Neuchâtel');
INSERT INTO cc_joueur vALUES (282, 'Clarkson', 'Norton', 'M','27.3.1998',79,2,'Fribourg');
INSERT INTO cc_joueur vALUES (283, 'Haegler', 'Giancarlo', 'M','1.7.1999',95,2,'Lausanne');
INSERT INTO cc_joueur vALUES (284, 'Rinaldi', 'David', 'M','14.2.2008',1,2,'Lausanne');
INSERT INTO cc_joueur vALUES (285, 'De Freitas', 'Gregory', 'M','10.6.2013',90,4,'Lausanne');
INSERT INTO cc_joueur vALUES (286, 'Reverdin', 'Myriam', 'F','12.8.2000',99,4,'Fribourg');
INSERT INTO cc_joueur vALUES (287, 'Solna', 'Sander', 'M','29.1.2004',81,3,'Berne');
INSERT INTO cc_joueur vALUES (288, 'Beretta', 'Steven', 'M','20.10.2000',21,3,'Berne');
INSERT INTO cc_joueur vALUES (289, 'Laumonier', 'Helen', 'F','1.4.1999',10,5,'Lausanne');
INSERT INTO cc_joueur vALUES (290, 'Lenski', 'Myriam', 'F','25.6.2007',88,4,'Fribourg');
INSERT INTO cc_joueur vALUES (291, 'Lynch', 'Yves', 'M','21.8.1995',36,4,'Yverdon-les-Bains');
INSERT INTO cc_joueur vALUES (292, 'Simon', 'Sabrina', 'F','30.9.2001',67,3,'Berne');
INSERT INTO cc_joueur vALUES (293, 'Rochaix', 'Julie', 'F','27.11.2009',99,5,'Nyon');
INSERT INTO cc_joueur vALUES (294, 'Sweet', 'Claude', 'M','6.4.2002',62,2,'Genève');
INSERT INTO cc_joueur vALUES (295, 'Hafredal', 'Roberto', 'M','15.10.2003',10,6,'Neuchâtel');
INSERT INTO cc_joueur vALUES (296, 'Magnin', 'Aurelien', 'M','3.7.2001',37,3,'Genève');
INSERT INTO cc_joueur vALUES (297, 'Mordasini', 'Benoit', 'M','26.4.2002',72,4,'Genève');
INSERT INTO cc_joueur vALUES (298, 'Rohr', 'David', 'M','21.11.2002',57,2,'Lausanne');
INSERT INTO cc_joueur vALUES (299, 'Hamdan', 'Elisa', 'F','3.2.2016',82,5,'Lausanne');
INSERT INTO cc_joueur vALUES (300, 'Recour', 'Fabien', 'M','22.7.2009',11,5,'Lausanne');
INSERT INTO cc_joueur vALUES (301, 'Giraud', 'Manuel', 'M','6.8.2005',87,4,'Fribourg');
INSERT INTO cc_joueur vALUES (302, 'Nissen', 'Desiree', 'F','9.6.2003',80,1,'Lausanne');
INSERT INTO cc_joueur vALUES (303, 'Baskali', 'Kris', 'M','10.3.2008',19,3,'Nyon');
INSERT INTO cc_joueur vALUES (304, 'Albertini', 'Mathieu', 'M','4.12.1997',5,4,'Fribourg');
INSERT INTO cc_joueur vALUES (305, 'Watanabe', 'Rayan', 'M','22.1.2007',22,2,'Neuchâtel');
INSERT INTO cc_joueur vALUES (306, 'Maspero', 'Tatiana', 'F','21.8.2009',28,3,'Berne');
INSERT INTO cc_joueur vALUES (307, 'Cheneau', 'Julien', 'M','8.8.2013',18,4,'Nyon');
INSERT INTO cc_joueur vALUES (308, 'Djelloul', 'Anne', 'F','7.5.2006',57,3,'Genève');
INSERT INTO cc_joueur vALUES (309, 'Rall', 'Susan', 'F','25.5.2002',94,1,'Berne');
INSERT INTO cc_joueur vALUES (310, 'Herold', 'Jean-Louis', 'M','6.8.2003',79,4,'Nyon');
INSERT INTO cc_joueur vALUES (311, 'Thomas', 'Thibaut', 'M','22.6.1996',48,5,'Berne');
INSERT INTO cc_joueur vALUES (312, 'Delrieu', 'Francisco', 'M','19.8.2005',92,4,'Lausanne');
INSERT INTO cc_joueur vALUES (313, 'Lapp', 'Kyriakos', 'M','16.5.2003',44,2,'Nyon');
INSERT INTO cc_joueur vALUES (314, 'Ludi', 'Patrick', 'M','31.3.2006',16,6,'Neuchâtel');
INSERT INTO cc_joueur vALUES (315, 'Barmettler', 'Daniel', 'M','14.7.2001',17,3,'Lausanne');
INSERT INTO cc_joueur vALUES (316, 'Fosenbauer', 'Sylvie', 'F','17.4.2007',57,1,'Berne');
INSERT INTO cc_joueur vALUES (317, 'Gomes', 'Mingkwan', 'F','12.6.2004',25,6,'Fribourg');
INSERT INTO cc_joueur vALUES (318, 'Luya', 'Saloua', 'F','13.7.1996',91,6,'Berne');
INSERT INTO cc_joueur vALUES (319, 'Walker', 'Olivier', 'M','18.6.2010',58,1,'Fribourg');
INSERT INTO cc_joueur vALUES (320, 'Collet', 'Manel', 'F','5.12.2001',5,4,'Fribourg');
INSERT INTO cc_joueur vALUES (321, 'Stace', 'Chiara', 'F','8.2.2003',31,2,'Genève');
INSERT INTO cc_joueur vALUES (322, 'Carraz', 'José', 'M','27.8.2004',92,1,'Nyon');
INSERT INTO cc_joueur vALUES (323, 'Allard', 'Guillaume', 'M','14.6.1999',5,5,'Lausanne');
INSERT INTO cc_joueur vALUES (324, 'Lagard', 'Silvio', 'M','4.9.2000',7,5,'Berne');
INSERT INTO cc_joueur vALUES (325, 'Moreira', 'Jerome', 'M','13.1.2017',87,6,'Nyon');
INSERT INTO cc_joueur vALUES (326, 'Lanza', 'José', 'M','26.11.2000',24,2,'Nyon');
INSERT INTO cc_joueur vALUES (327, 'Tricaud', 'Alba', 'F','16.9.2002',77,4,'Genève');
INSERT INTO cc_joueur vALUES (328, 'Harvey', 'Guillaume', 'M','8.5.2006',92,5,'Lausanne');
INSERT INTO cc_joueur vALUES (329, 'Mataoanu', 'Silvio', 'M','30.3.2000',36,5,'Berne');
INSERT INTO cc_joueur vALUES (330, 'Mcauliffe', 'Jerome', 'M','13.1.2008',55,4,'Nyon');
INSERT INTO cc_joueur vALUES (331, 'Cornu', 'Michele', 'F','20.4.2003',42,4,'Fribourg');
COMMIT;



