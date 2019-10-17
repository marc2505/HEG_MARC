-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                             TP04 BDD/SQL
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

-- SUPPRESSION DES DONNEES DANS LES TABLES ET SELECT * DE TOUTES LES TABLES

DELETE FROM HEG_ENTREPRISE;
SELECT * FROM HEG_ENTREPRISE;

DELETE FROM HEG_PERSONNE;
SELECT * FROM HEG_PERSONNE;

DELETE FROM HEG_SOIREE;
SELECT * FROM HEG_SOIREE;

DELETE FROM HEG_PARTICIPE;
SELECT * FROM HEG_PARTICIPE;

-- INSERTION DANS LES TABLES

-- HEG_ENTREPRISE
INSERT INTO HEG_ENTREPRISE (ENT_NO,ENT_NOM,ENT_MAIL,ENT_VILLE) 
VALUES (1,'ACER','acer@gmail.com','Gen�ve');
INSERT INTO HEG_ENTREPRISE VALUES (2,'DELL','dell@gmail.com','Lausanne');
INSERT INTO HEG_ENTREPRISE VALUES (3,'SUN','sun@gmail.com','Z�rich');
INSERT INTO HEG_ENTREPRISE VALUES (4,'ORACLE','oracle@gmail.com','Berne');
INSERT INTO HEG_ENTREPRISE VALUES (5,'IBM','ibm@gmail.com','Fribourg');
INSERT INTO HEG_ENTREPRISE VALUES (6,'NOKIA','nokia@gmail.com','Neuchatel');
INSERT INTO HEG_ENTREPRISE VALUES (7,'APPLE','apple@gmail.com','Washignton');

-- HEG_PERSONNE
INSERT INTO HEG_PERSONNE (PER_NO,PER_NOM,PER_PRENOM,PER_SEXE,PER_MAIL,PER_ENT_NO,PER_PER_NO)
VALUES (1,'REMORD','Yves','M','YVES.R@GMAIL.COM',3,null);
INSERT INTO HEG_PERSONNE VALUES (2,'VANBUS','Hillary','F','HILLARY.V@GMAIL.COM',5,null);
INSERT INTO HEG_PERSONNE VALUES (3,'CARRE','Otto','M','OTTO.C@GMAIL.COM',null,null);
INSERT INTO HEG_PERSONNE VALUES (4,'VAISSELLE','Aude','F','AUDE.V@GMAIL.COM',2,null);
INSERT INTO HEG_PERSONNE VALUES (5,'TERIEUR','Alex','M','ALEX.T@GMAIL.COM',3,null);
INSERT INTO HEG_PERSONNE VALUES (6,'HOCHON','Paul','M','PAUL.H@GMAIL.COM',2,null);
INSERT INTO HEG_PERSONNE VALUES (7,'DORSA','Elsa','F','ELSE.D@GMAIL.COM',3,null);

-- CHANGEMENT DU FORMATAGE DES DATES
ALTER SESSION SET NLS_DATE_FORMAT ='dd/mm/yyyy';

-- HEG_SOIREE
INSERT INTO HEG_SOIREE (SOI_NO,SOI_NOM,SOI_DATE,SOI_INSCRIPTION,SOI_LIEU,SOI_PRIX)
VALUES (1,'Soir�e IGS partie 1','28/09/2020','26/09/2020','Battelle',15.00);
INSERT INTO HEG_SOIREE VALUES (2,'Soir�e IGS partie 2','26/10/2020','24/10/2020','Battelle',20.00);
INSERT INTO HEG_SOIREE VALUES (3,'Soir�e Profs','26/10/2021',null,'Carouge',50.00);


-- AJOUT DU COUPLE JOHN & AUDE
INSERT INTO HEG_PERSONNE VALUES (8,'DOEUF','John','M','JOHN.D@GMAIL.COM',3,null);
INSERT INTO HEG_PERSONNE VALUES (9,'ITION','Aude','F','AUDE.I@GMAIL.COM',3,8);
UPDATE HEG_PERSONNE 
SET PER_PER_NO = 9 
WHERE PER_NO = 8;

-- ALEX A PARTICIP� AUX 3 SOIREES
INSERT INTO HEG_PARTICIPE (PAR_PER_NO,PAR_SOI_NO) VALUES (5,1);
INSERT INTO HEG_PARTICIPE (PAR_PER_NO,PAR_SOI_NO) VALUES (5,2);
INSERT INTO HEG_PARTICIPE (PAR_PER_NO,PAR_SOI_NO) VALUES (5,3);

-- PAUL A PARTICIP� � LA SOIR�E IGS PARTIE 1
INSERT INTO HEG_PARTICIPE VALUES (6,1);

-- JOHN & AUDE ONT PARTICIP� � LA SOIR�E PROFS
INSERT INTO HEG_PARTICIPE VALUES (8,3);
INSERT INTO HEG_PARTICIPE VALUES (9,3);

-- ALEX TRAVAILLE MAINTENANT CHEZ DELL
UPDATE HEG_PERSONNE SET PER_ENT_NO = 2 WHERE PER_NOM = 'TERIEUR';

-- ELSA S'EST MARRI�E AVEC YVES ET ELLE S'APPELLE 'ELSA REMORD-DORSA'
UPDATE HEG_PERSONNE 
SET PER_PER_NO = 1, PER_NOM = 'REMORD-DORSA' 
WHERE PER_PRENOM = 'Elsa';
UPDATE HEG_PERSONNE
SET PER_PER_NO = 7
WHERE PER_NO = 1;

-- LES SOIREES QUI SE SONT D�ROUL�ES � BATTELLE ONT CO�T� 3.- DE PLUS
UPDATE HEG_SOIREE
SET SOI_PRIX = SOI_PRIX + 3
WHERE SOI_LIEU = 'Battelle';

-- JOHN N'A PAS PARTICIP� � LA SOIR�E PROFS
DELETE FROM HEG_PARTICIPE WHERE PAR_PER_NO = 8 AND PAR_SOI_NO = 3;

-- |||||||||||||||||||||||||||||||||
-- TESTS DES CONTRAINTES D'INT�GRIT�
-- |||||||||||||||||||||||||||||||||
-- TABLE HEG_ENTREPRISE
-- TEST "PK" -> ENT_NO
INSERT INTO HEG_ENTREPRISE VALUES (1,'Microsoft','microsoft@gmail.com','Gen�ve');
-- TEST "NOT NULL" -> ENT_NOM
INSERT INTO HEG_ENTREPRISE VALUES (4,'','test@gmail.com','Gen�ve');
-- ET "UNIQUE" -> ENT_NOM
INSERT INTO HEG_ENTREPRISE VALUES (5,'APPLE','apple@gmail.com','Gen�ve');

-- TABLE HEG_SOIREE
-- TEST "PK" -> SOI_NO
INSERT INTO HEG_SOIREE VALUES (3,'test','01/02/2020','01/01/2020','Lieu',15.00);
-- TEST "NOT NULL" -> SOI_NOM
INSERT INTO HEG_SOIREE VALUES (4,'','01/02/2020','01/01/2020','Lieu',15.00);
-- TEST "CK" -> SOI_PRIX > 0
INSERT INTO HEG_SOIREE VALUES (5,'test','01/02/2020','01/01/2020','Lieu',00.00);
-- TEST "UK" -> SOI_DATE & SOI_NOM (NE FONCTIONNE PAS ...)
-- INSERT INTO HEG_SOIREE VALUES (6,'Soir�e Profs','01/02/2020','01/01/2020','Lieu',20.00);
-- INSERT INTO HEG_SOIREE VALUES (7,'Soir�e IGS partie 1','01/02/2020','01/01/2020','Lieu',20.00);
-- TEST "CK" -> SOI_INSCRIPTION < SOI_DATE
INSERT INTO HEG_SOIREE VALUES (8,'test','01/01/2020','02/01/2020','Lieu',20.00);

-- TABLE HEG_PERSONNE
-- TEST "PK" -> PER_NO
INSERT INTO HEG_PERSONNE VALUES (7,'TEST','TEST','M','TEST.T@GMAIL.COM',3,null);
-- TEST "NN" -> PER_NOM
INSERT INTO HEG_PERSONNE VALUES (10,'','TEST','M','TEST.T@GMAIL.COM',3,null);
-- TEST "CK" -> PER_SEXE
INSERT INTO HEG_PERSONNE VALUES (11,'TEST','TEST','H','TEST.T@GMAIL.COM',3,null);
-- TEST "FK" -> PER_ENT_NO
INSERT INTO HEG_PERSONNE VALUES (12,'TEST','TEST','M','TEST.T@GMAIL.COM',15,null);
-- TEST "FK" -> PER_PER_NO
INSERT INTO HEG_PERSONNE VALUES (13,'TEST','TEST','M','TEST.T@GMAIL.COM',3,15);

-- TABLE HEG_PARTICIPE
-- TEST "PK" -> PAR_PER_NO / PAR_SOI_NO
INSERT INTO HEG_PARTICIPE VALUES (5,2);

-- VALIDATION DES EXECUTIONS
COMMIT;





