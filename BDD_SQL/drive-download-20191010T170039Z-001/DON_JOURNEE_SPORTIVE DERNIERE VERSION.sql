-- ============================================================
-- Script : DON_JOURNEE_SPORTIVE.sql
-- Objet  : Création des séquences et insertion des données dans la base de données JOURNEE SPORTIVE.
--
-- Version  Visa     Date       Commentaires
-- -------  -----    ---------- ------------------------------------

--  1.0    YJ-MB     07/03/2018 Séquences et insertion des données
--- -----  -------   ---------- ------------------------------------

-- ============================================================
--              Supression des séquences 
-- ============================================================
DROP SEQUENCE ID_REMPLACEMENT;
DROP SEQUENCE ID_CONFRONTATION;
DROP SEQUENCE ID_INSCRIPTION;
DROP SEQUENCE ID_PROFESSEUR;
DROP SEQUENCE ID_EQUIPE;
DROP SEQUENCE ID_ECOLE;
DROP SEQUENCE ID_TOURNOI;
DROP SEQUENCE ID_ARBITRE;
DROP SEQUENCE ID_ELEVE;
-- ============================================================
--              Création des séquences 
-- ============================================================
create sequence ID_REMPLACEMENT
  minvalue             1
  start with           1
  increment by         1
  maxvalue          1000
  nocycle;

create sequence ID_CONFRONTATION
  minvalue             1
  start with           1
  increment by         1
  maxvalue         10000
  nocycle;
  
  create sequence ID_INSCRIPTION
  minvalue             1
  start with           1
  increment by         1
  maxvalue        100000
  nocycle;
  
  create sequence ID_EQUIPE
  minvalue             1
  start with           1
  increment by         1
  maxvalue          1000
  nocycle;
  
  create sequence ID_ECOLE
  minvalue             1
  start with           1
  increment by         1
  maxvalue          1000
  nocycle;
  
  create sequence ID_TOURNOI
  minvalue             1
  start with           1
  increment by         1
  maxvalue          1000
  nocycle;
  
  create sequence ID_ARBITRE
  minvalue             1
  start with           1
  increment by         1
  maxvalue          1000
  nocycle;
  
  create sequence ID_PROFESSEUR
  minvalue             1
  start with           1
  increment by         1
  maxvalue          1000
  nocycle;
  
  create sequence ID_ELEVE
  minvalue             1
  start with           1
  increment by         1
  maxvalue          1000
  nocycle;
-- ============================================================
--              Supression des données
-- ============================================================
DELETE FROM JOU_REMPLACEMENT; 
DELETE FROM JOU_CONFRONTATION;
DELETE FROM JOU_INSCRIPTION;
DELETE FROM JOU_ARBITRE;
DELETE FROM JOU_ELEVE;
DELETE FROM JOU_EQUIPE;
DELETE FROM JOU_PROFESSEUR;
DELETE FROM JOU_ECOLE;
DELETE FROM JOU_TOURNOI;
DELETE FROM JOU_PARAMETRE;

COMMIT;


ALTER SESSION SET NLS_DATE_FORMAT ='dd/mm/yyyy';

-- ============================================================
--                  Insertion des données
-- ============================================================
-- ============================================================
-- ============================================================
-- ===================  TRANSACTION 1  ========================
-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Ajout des paramètres.
-- ============================================================
INSERT INTO JOU_PARAMETRE VALUES (1,'VESSY','100','08:30','SEJOUR A LA MONTAGNE','10','08:30','17:00','07:45','2');
-- ============================================================
-- Ajout d'une école.
-- ============================================================
INSERT INTO JOU_ECOLE VALUES(ID_ECOLE.NEXTVAL,'RAYMOND-ULDRY','Chemin du Domaine-Patry 1','1224','Chêne-Bougeries');
-- ============================================================
-- Ajout d'un tournoi.
-- ============================================================
INSERT INTO JOU_TOURNOI VALUES(ID_TOURNOI.NEXTVAL , '01/01/2018','TOURNOI DE RAYMOND-ULDRY');
-- ============================================================
--  Ajout d'une inscription.
-- ============================================================
INSERT INTO JOU_INSCRIPTION VALUES (ID_ECOLE.CURRVAL, ID_TOURNOI.CURRVAL,'01/10/2017');
-- =============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','MAURON','Aurélie','01/01/1965','ABCDEF@GMAIL.COM','0763652589','Chemin du Château 8','1213','Petit-Lancy','ABCD');
-- ============================================================
--  Ajout d'une équipe de 5 élèves.
-- =============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Loulou','A');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'PAGE','Stéphane','01/02/2000','EMAIL@HOTMAIL.COM','0793585250','Rue Saint-Laurent 12','1203','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELAVY','Delphine','01/02/2000','EMAIL1@HOTMAIL.COM','0793565423','Boulevard de la Cluse 22','1205','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELALOYE','Sandra','20/02/2000','EMAIL2@HOTMAIL.COM','0793443542','Quai Ernest-Ansermet 2','1206','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'BUTINOF','Valérie','18/05/2000','EMAIL3@HOTMAIL.COM','0793585435','Rue Marignac 5','1206','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'CALIMAN','Yannick','05/07/2000','EMAIL4@HOTMAIL.COM','0793588453','Chemin des Pâquerettes 1C','1213','Petit-Lancy');
-- ============================================================
-- Ajout d'un deuxième professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','WOHR','Kim','01/01/1964','ABCDEFGH@GMAIL.COM','0763652598','boulevard Carl-Vogt 62','1205','Genève','ABCD');
-- ============================================================
-- Ajout d'une nouvelle équipe de 5 élèves.
-- ============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Lolette','A');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANEX','Irène','15/06/2000','EMAIL5@HOTMAIL.COM','0793554875','Avenue de Vaudagne 58','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'JOSS','Olivier','26/07/2000','EMAIL6@HOTMAIL.COM','0793589620','Route du Mandement 12','1242','Satigny');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANVELLE','Elise','09/08/2000','EMAIL7@HOTMAIL.COM','0793568398','Route de Frontenex 130','1208','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DERIVAZ','Céline','26/08/2000','EMAIL8@HOTMAIL.COM','0793589523','Avenue de la Feuillasse 57','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KHOURI','Tarek','19/01/2000','EMAIL9@HOTMAIL.COM','0793589654','Chemin de Joinville 12','1216','Cointrin');
-- ============================================================
-- Ajout d'un arbitre.
-- ============================================================
INSERT INTO JOU_ARBITRE VALUES (ID_ARBITRE.NEXTVAL,'ABDULAID','Pénélope','01/02/1982','DSAFGADF@HOTMAIL.COM','0796545250','Rue Alphonse-Large 17','1217','Meyrin','1234');
-- ============================================================
-- Ajout d'une confrontation.
-- ============================================================
INSERT INTO JOU_CONFRONTATION VALUES (ID_CONFRONTATION.NEXTVAL,ID_EQUIPE.CURRVAL,ID_EQUIPE.CURRVAL-1,ID_TOURNOI.CURRVAL,ID_ARBITRE.CURRVAL,'FOOT','3','0');
-- ============================================================
-- Ajout d'un remplacement.
-- ============================================================
INSERT INTO JOU_REMPLACEMENT VALUES (ID_PROFESSEUR.CURRVAL,ID_PROFESSEUR.CURRVAL-1);
-- ============================================================
-- ============================================================
-- ============================================================
-- ==================  TRANSACTION 2  =========================
-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Ajout d'un professeur.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','DENIC','George','01/01/1992','GEOFEO@GMAIL.COM','0763652532','Route de Morges 12','1232','Genève','ABCD');
-- =============================================================
--  Ajout d'une équipe de 5 élèves.
-- =============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les fous','B');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'JEN','Dimiki','01/02/2001','JEJE@HOTMAIL.COM','0783585290','Rue du Livron 12','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELAVY','Delphine','01/02/2001','EMAIL1@HOTMAIL.COM','0793565423','Ch. des Pierides 25','1207','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELALOYE','Sandra','20/02/2001','EMAIL2@HOTMAIL.COM','0793443542','Avenue des Libellules 10','1219','Châtelaine');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'BUTINOF','Valérie','18/05/2001','EMAIL3@HOTMAIL.COM','0793585435','Rue des Bossons 15','1213','Petit-Lancy');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'CALIMAN','Yannick','05/07/2001','EMAIL4@HOTMAIL.COM','0793588453','Avenue des Morgines','1213','Onex');
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','MURJON','Aurélie','01/01/1976','ALSKDJFI@GMAIL.COM','0763655693','Chemin du Pissenlit 18','1217','Meyrin','ABCD');
-- ============================================================
-- Ajout d'une nouvelle equipe.
-- ============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les big boss','B');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANEX','Irène','15/06/2001','EMAIL5@HOTMAIL.COM','0793554875','Chemin Pierre-Longue 4','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'JOSS','Olivier','26/07/2001','EMAIL6@HOTMAIL.COM','0793589620','Rue des Lattes 2','1219','Lignon');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANVELLE','Elise','09/08/2001','EMAIL7@HOTMAIL.COM','0793656398','Rue Ami-Lullin 3','1205','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DERIVAZ','Céline','26/08/2001','EMAIL8@HOTMAIL.COM','0793589523','Chemin des Bois 16','1205','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KHOURI','Tarek','19/01/2001','EMAIL9@HOTMAIL.COM','0793589654','Chemin des Muguets 9','1296','Versoix');
-- ============================================================
-- Ajout d'un arbitre.
-- ============================================================
INSERT INTO JOU_ARBITRE VALUES (ID_ARBITRE.NEXTVAL,'ALBA','Jean-Claude','22/02/1996','JEANALBA@HOTMAIL.COM','0786544450','Rue des rois 7','1220','Genève','1234');
-- ============================================================
-- Ajout d'une confrontation.
-- ============================================================
INSERT INTO JOU_CONFRONTATION VALUES (ID_CONFRONTATION.NEXTVAL,ID_EQUIPE.CURRVAL,ID_EQUIPE.CURRVAL-1,ID_TOURNOI.CURRVAL,ID_ARBITRE.CURRVAL,'BASKET','1','1');
-- ============================================================
-- Ajout d'un remplacement.
-- ============================================================
INSERT INTO JOU_REMPLACEMENT VALUES (ID_PROFESSEUR.CURRVAL,ID_PROFESSEUR.CURRVAL-1);
-- ============================================================
-- ============================================================
-- ============================================================
-- ====================  TRANSACTION 3  =======================
-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','BERNARD','Delphine','02/03/1990','BEBE@GMAIL.COM','0793652582','Rue de la Capitale','1202','Genève','ABCD');
-- ============================================================
--  Ajout d'une équipe de 5 élèves.
-- =============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les boss','C');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'FERNANDO','Suarez','01/08/2002','FERNANDOV@HOTMAIL.COM','0703580250','Chemin de la Milière 15','1202','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELAVY','Delphine','01/02/2002','EMAIL1@HOTMAIL.COM','0793565423','Chemin du Petit-Sionnet 14','1207','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELALOYE','Sandra','20/02/2002','EMAIL2@HOTMAIL.COM','0793443542','Chemin des Serres 57','1213','Onex');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'BUTINOF','Valérie','18/05/2002','EMAIL3@HOTMAIL.COM','0793585435','Route de Veyrier 32','1234','Vessy');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'CALIMAN','Yannick','05/07/2002','EMAIL4@HOTMAIL.COM','0793588453','Chemin du Gué','1213','Onex');
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','JOSEPH','Jammie','03/04/1991','JOJO@GMAIL.COM','0783652581','Avenue de Meyrin 8','1217','Meyrin','ABCD');
-- ============================================================
-- Ajout d'une nouvelle equipe.
-- ============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les bad girls','C');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANEX','Irène','15/06/2002','EMAIL5@HOTMAIL.COM','0793554875','Chemin de Blonay 14','1234','Vessy');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'JOSS','Olivier','26/07/2002','EMAIL6@HOTMAIL.COM','0793589620','Route de Veyrier 56','1255','Veyrier');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANVELLE','Elise','09/08/2002','EMAIL7@HOTMAIL.COM','0793856398','Chemin du Feuillet 15','1203','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DERIVAZ','Céline','26/08/2002','EMAIL8@HOTMAIL.COM','0793589523','Chemin Cavussin 54','1205','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KHOURI','Tarek','19/01/2002','EMAIL9@HOTMAIL.COM','0793589654','Route de Base 41','1258','Perly');
-- ============================================================
-- Ajout d'un arbitre.
-- ============================================================
INSERT INTO JOU_ARBITRE VALUES (ID_ARBITRE.NEXTVAL,'MONROE','Frank','01/01/1990','FRANKM@HOTMAIL.COM','0786515250','Rue de Vidollet 31','1204','Genève','1234');
-- ============================================================
-- Ajout d'une confrontation.
-- ============================================================
INSERT INTO JOU_CONFRONTATION VALUES (ID_CONFRONTATION.NEXTVAL,ID_EQUIPE.CURRVAL,ID_EQUIPE.CURRVAL-1,ID_TOURNOI.CURRVAL,ID_ARBITRE.CURRVAL,'VOLLEY','1','1');
-- ============================================================
-- Ajout d'un remplacement.
-- ============================================================
INSERT INTO JOU_REMPLACEMENT VALUES (ID_PROFESSEUR.CURRVAL,ID_PROFESSEUR.CURRVAL-1);
-- ============================================================
-- ============================================================
-- ============================================================
-- ====================  TRANSACTION 4  =======================
-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','MORALES','Filipe','11/03/1998','FILIPEM@GMAIL.COM','0723652587','Rue de Carouge','1226','Carouge','ABCD');
-- =============================================================
--  Ajout des équipes.
-- =============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les batands','D');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'LEGRANG','Virginie','21/03/2003','VIRGINIELG@HOTMAIL.COM','0793585253','Avenue de France 45','1204','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELAVY','Delphine','01/02/2003','EMAIL1@HOTMAIL.COM','0793565423','Chemin Archamps 65','1207','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELALOYE','Sandra','20/02/2003','EMAIL2@HOTMAIL.COM','0793443542','Route de Meyrin 52','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'BUTINOF','Valérie','18/05/2003','EMAIL3@HOTMAIL.COM','0793585435','Route de Meyrin 12','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'CALIMAN','Yannick','05/07/2003','EMAIL4@HOTMAIL.COM','0793588453','Chemin du Bac','1213','Onex');
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','BRALS','Chris','02/03/1994','CHRISB@GMAIL.COM','0713652589','Rue de la Servette','1203','Genève','ABCD');
-- ============================================================
-- Ajout d'une nouvelle equipe.
-- ============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les good girls','D');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANEX','Irène','15/06/2003','EMAIL5@HOTMAIL.COM','0793554875','Avenue de la Praille 23','1205','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'JOSS','Olivier','26/07/2003','EMAIL6@HOTMAIL.COM','0793589620','Avenue du MacDonalds 25','1219','Lignon');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANVELLE','Elise','09/08/2003','EMAIL7@HOTMAIL.COM','0793656398','Avenue des Courgettes 12','1203','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DERIVAZ','Céline','26/08/2003','EMAIL8@HOTMAIL.COM','0793589523','Avenue des Corneilles 5','1205','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KHOURI','Tarek','19/01/2003','EMAIL9@HOTMAIL.COM','0793589654','Avenue des Promeneurs 8','1296','Versoix');
-- ============================================================
--  Ajout d'un arbitre.
-- ============================================================
INSERT INTO JOU_ARBITRE VALUES (ID_ARBITRE.NEXTVAL,'VARGAS','Christine','01/02/1980','CHRISTINE@HOTMAIL.COM','0794845250','Rue Ancienne 6','1202','Genève','1234');
-- ============================================================
-- Ajout d'une confrontation.
-- ============================================================
INSERT INTO JOU_CONFRONTATION VALUES (ID_CONFRONTATION.NEXTVAL,ID_EQUIPE.CURRVAL,ID_EQUIPE.CURRVAL-1,ID_TOURNOI.CURRVAL,ID_ARBITRE.CURRVAL,'BASKET','3','0');
-- ============================================================
-- Ajout d'un remplacement.
-- ============================================================
INSERT INTO JOU_REMPLACEMENT VALUES (ID_PROFESSEUR.CURRVAL,ID_PROFESSEUR.CURRVAL-1);
-- ============================================================
-- ============================================================
-- ============================================================
-- ====================  TRANSACTION 5  =======================
-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','MENDEZ','Oso','12/03/1998','OSO@GMAIL.COM','0743651587','Rue de la Prairie 52','1226','Carouge','ABCD');
-- =============================================================
--  Ajout des équipes.
-- =============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les lions','A');
-- ============================================================
-- Ajout d'un élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'FURIS','Vincent','22/04/2000','VINCENT@HOTMAIL.COM','0762585253','Avenue des Grand 2','1209','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELAVY','Delphine','01/02/2000','EMAIL1@HOTMAIL.COM','0793565423','Avenue de Plainpalais 23','1205','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELALOYE','Sandra','20/02/2000','EMAIL2@HOTMAIL.COM','0793443542','Chemin des Pluviers 56','1213','Onex');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'BUTINOF','Valérie','18/05/2000','EMAIL3@HOTMAIL.COM','0793585435','Avenue de Bois-du-Lan 12','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'CALIMAN','Yannick','05/07/2000','EMAIL4@HOTMAIL.COM','0793588453','Avenue des Caraïbes 23','1213','Onex');
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','PUTIN','Claude','03/04/1993','CLAUCLAU@GMAIL.COM','0753652589','Rue de la Coline 25','1203','Genève','ABCD');
-- ============================================================
-- Ajout d'une nouvelle equipe.
-- ============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les loups','A');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANEX','Irène','15/06/2000','EMAIL5@HOTMAIL.COM','0793554875','Chemain Antoine-Verchère 56','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'JOSS','Olivier','26/07/2000','EMAIL6@HOTMAIL.COM','0793589620','Chemin de la Checande 14','1219','Lignon');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANVELLE','Elise','09/08/2000','EMAIL7@HOTMAIL.COM','0795356398','Chemin de la Drize','1202','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DERIVAZ','Céline','26/08/2000','EMAIL8@HOTMAIL.COM','0793589523','Avenue de Bel-Air 5','1205','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KHOURI','Tarek','19/01/2000','EMAIL9@HOTMAIL.COM','0793589654','Chemin des Petits-Bois 9','1296','Versoix');
-- ============================================================
--  Ajout d'un arbitre.
-- ============================================================
INSERT INTO JOU_ARBITRE VALUES (ID_ARBITRE.NEXTVAL,'FERNANDEZ','Vladimir','02/03/1988','VLADIMIR@HOTMAIL.COM','0756845350','Rue Armes 58','1203','Genève','1234');
-- ============================================================
-- Ajout d'une confrontation.
-- ============================================================
INSERT INTO JOU_CONFRONTATION VALUES (ID_CONFRONTATION.NEXTVAL,ID_EQUIPE.CURRVAL,ID_EQUIPE.CURRVAL-1,ID_TOURNOI.CURRVAL,ID_ARBITRE.CURRVAL,'FOOT','3','0');
-- ============================================================
-- Ajout d'un remplacement.
-- ============================================================
INSERT INTO JOU_REMPLACEMENT VALUES (ID_PROFESSEUR.CURRVAL,ID_PROFESSEUR.CURRVAL-1);
-- ============================================================
-- ============================================================
-- ============================================================
-- ====================  TRANSACTION 6  =======================
-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','SERRATE','Carlos','12/08/1998','CARLOS@GMAIL.COM','0734651587','Rue des Asters 47','1224','Carouge','ABCD');
-- ============================================================
--  Ajout d'une équipe de 5 élèves.
-- =============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les tigres','B');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'QUILES','Julio','23/03/2001','JULIO@HOTMAIL.COM','0762585125',' Route de Saint-Julien 23','1213','Petit-Lancy');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELAVY','Delphine','01/02/2001','EMAIL1@HOTMAIL.COM','0793565423','Rue de Montchoisy 2','1207','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DELALOYE','Sandra','20/02/2001','EMAIL2@HOTMAIL.COM','0793443542','Chemin Rieu 5','1213','Onex');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'BUTINOF','Valérie','18/05/2001','EMAIL3@HOTMAIL.COM','0793585435','Chemin de Chavanay 6','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'CALIMAN','Yannick','05/07/2001','EMAIL4@HOTMAIL.COM','0793588453','Chemin du Bac 8','1213','Onex');
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','BRUNER','Marvin','04/11/1993','MARVINB@GMAIL.COM','0723652589','Rue de Rive 2','1203','Genève','ABCD');
-- ============================================================
-- Ajout d'une nouvelle equipe.
-- ============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les phoques','B');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANEX','Irène','15/06/2001','EMAIL5@HOTMAIL.COM','0793554875','Rue des Lattes 5','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'JOSS','Olivier','26/07/2001','EMAIL6@HOTMAIL.COM','0793589620','Route de Malagny 5','1219','Lignon');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANVELLE','Elise','09/08/2001','EMAIL7@HOTMAIL.COM','0793562398','Avenue de Gennecy 9','1206','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DERIVAZ','Céline','26/08/2001','EMAIL8@HOTMAIL.COM','0793589523','Chemin des Picatalons 45','1205','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KHOURI','Tarek','19/01/2001','EMAIL9@HOTMAIL.COM','0793589654','Place de la Mairie 26','1296','Versoix');
-- ============================================================
--  Ajout d'un arbitre.
-- ============================================================
INSERT INTO JOU_ARBITRE VALUES (ID_ARBITRE.NEXTVAL,'PINEDO','Lorie','05/07/1989','LORIE@HOTMAIL.COM','0753445350','Rue de Bel-Air 5','1201','Genève','1234');
-- ============================================================
-- Ajout d'une confrontation.
-- ============================================================
INSERT INTO JOU_CONFRONTATION VALUES (ID_CONFRONTATION.NEXTVAL,ID_EQUIPE.CURRVAL,ID_EQUIPE.CURRVAL-1,ID_TOURNOI.CURRVAL,ID_ARBITRE.CURRVAL,'BASKET','0','3');
-- ============================================================
-- Ajout d'un remplacement.
-- ============================================================
INSERT INTO JOU_REMPLACEMENT VALUES (ID_PROFESSEUR.CURRVAL,ID_PROFESSEUR.CURRVAL-1);
-- ============================================================
-- ============================================================
-- ============================================================
-- ====================  TRANSACTION 7  =======================
-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','BABUSHKA','Céline','12/10/1978','CelB@GMAIL.COM','0768753598','Rue des Astronautes 4','1204','Genève','ABCD');
-- ============================================================
--  Ajout d'une équipe de 5 élèves.
-- =============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les sauvages','C');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ABCDE','Julio','23/03/2002','JULIO@HOTMAIL.COM','0762585125','Cité Vieusseux 23','1203','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'FGHIJ','Delphine','01/02/2002','EMAIL1@HOTMAIL.COM','0793565423','Chemin Antoine-Verchère 2','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KLMNO','Sandra','20/02/2002','EMAIL2@HOTMAIL.COM','0793443542','Chemin de la Herse 5','1213','Onex');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'PQRST','Valérie','18/05/2002','EMAIL3@HOTMAIL.COM','0793585435','Chemin des Voirets 6','1212','Grand-Lancy');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'UVWXY','Yannick','05/07/2002','EMAIL4@HOTMAIL.COM','0793588453','Chemin des Cyprès 8','1213','Onex');
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','ASNIROV','Melvin','04/11/1993','MelvinA@GMAIL.COM','0723652589','Chemin de Mancy 2','1203','Genève','ABCD');
-- ============================================================
-- Ajout d'une nouvelle equipe.
-- ============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les phoques','C');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANEX','Irène','15/06/2002','EMAIL5@HOTMAIL.COM','0793554875','Avenue Sainte-Clotilde 5','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'JOSS','Olivier','26/07/2002','EMAIL6@HOTMAIL.COM','0793589620','Route de Bel-Air 5','1201','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANVELLE','Elise','09/08/2002','EMAIL7@HOTMAIL.COM','0793563948','Avenue de Gennecy 13','1206','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DERIVAZ','Céline','26/08/2002','EMAIL8@HOTMAIL.COM','0793589523','Chemin des Picatalons 7','1205','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KHOURI','Tarek','19/01/2002','EMAIL9@HOTMAIL.COM','0793589654','Place de la Mairie 6','1296','Versoix');
-- ============================================================
--  Ajout d'un arbitre.
-- ============================================================
INSERT INTO JOU_ARBITRE VALUES (ID_ARBITRE.NEXTVAL,'IVANOVIC','Stefan','05/07/1979','StefI@HOTMAIL.COM','0753444123','Rue de Bel-Air 7','1201','Genève','1234');
-- ============================================================
-- Ajout d'une confrontation.
-- ============================================================
INSERT INTO JOU_CONFRONTATION VALUES (ID_CONFRONTATION.NEXTVAL,ID_EQUIPE.CURRVAL,ID_EQUIPE.CURRVAL-1,ID_TOURNOI.CURRVAL,ID_ARBITRE.CURRVAL,'FOOT','1','1');
-- ============================================================
-- Ajout d'un remplacement.
-- ============================================================
INSERT INTO JOU_REMPLACEMENT VALUES (ID_PROFESSEUR.CURRVAL,ID_PROFESSEUR.CURRVAL-1);
-- ============================================================
-- ============================================================
-- ============================================================
-- ===================  TRANSACTION 8  ========================
-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','BABIBEL','Clément','22/02/1988','ClemB@GMAIL.COM','0768755698','Rue des Asters 4','1202','Genève','ABCD');
-- ============================================================
--  Ajout d'une équipe de 5 élèves.
-- =============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les super colonnels','D');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ABCDE','Julio','23/03/2003','JULIO@HOTMAIL.COM','0762585125','Rue Marignac 6','1203','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'FGHIJ','Delphine','01/02/2003','EMAIL1@HOTMAIL.COM','0793565423','Rue de la Prulay 2','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KLMNO','Sandra','20/02/2003','EMAIL2@HOTMAIL.COM','0793443542','Chemin de la Citadelle 5','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'PQRST','Valérie','18/05/2003','EMAIL3@HOTMAIL.COM','0793585435','Chemin des Pâquerettes 6','1212','Grand-Lancy');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'UVWXY','Yannick','05/07/2003','EMAIL4@HOTMAIL.COM','0793588453','Chemin de Bonne 8','1213','Onex');
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','DIMITROVSKI','Vodka','04/11/1993','DIMIV@GMAIL.COM','0723652589','Route de Frontenex 2','1203','Genève','ABCD');
-- ============================================================
-- Ajout d'une nouvelle equipe.
-- ============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les loosers','D');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANEX','Irène','15/06/2003','EMAIL5@HOTMAIL.COM','0793554875','Avenue de Vaudagne 5','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'JOSS','Olivier','26/07/2003','EMAIL6@HOTMAIL.COM','0793589620','Rue des Lattes 5','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANVELLE','Elise','09/08/2003','EMAIL7@HOTMAIL.COM','0793563398','Avenue des Libellules 13','1219','Châtelaine');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DERIVAZ','Céline','26/08/2003','EMAIL8@HOTMAIL.COM','0793589523','Avenue de la Feuillasse 7','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KHOURI','Tarek','19/01/2003','EMAIL9@HOTMAIL.COM','0793589654','Rue Voltaire 6','1201','Genève');
-- ============================================================
--  Ajout d'un arbitre.
-- ============================================================
INSERT INTO JOU_ARBITRE VALUES (ID_ARBITRE.NEXTVAL,'QLASH','Kushtrim','05/07/1979','KUSHQ@HOTMAIL.COM','0753444123','Rue des Délices 7','1201','Genève','1234');
-- ============================================================
-- Ajout d'une confrontation.
-- ============================================================
INSERT INTO JOU_CONFRONTATION VALUES (ID_CONFRONTATION.NEXTVAL,ID_EQUIPE.CURRVAL,ID_EQUIPE.CURRVAL-1,ID_TOURNOI.CURRVAL,ID_ARBITRE.CURRVAL,'FOOT','0','3');
-- ============================================================
-- Ajout d'un remplacement.
-- ============================================================
INSERT INTO JOU_REMPLACEMENT VALUES (ID_PROFESSEUR.CURRVAL,ID_PROFESSEUR.CURRVAL-1);
-- ============================================================
-- ============================================================
-- ============================================================
-- ===================  TRANSACTION 9  ========================
-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','QLASH','Clothilde','23/02/1988','CloQ@GMAIL.COM','0768756544','Rue des Asters 14','1202','Genève','ABCD');
-- ============================================================
--  Ajout d'une équipe de 5 élèves.
-- =============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les astronautes','A');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ABCDE','Julio','23/03/2000','JULIO@HOTMAIL.COM','0762585125','Rue Marignac 16','1203','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'FGHIJ','Delphine','01/02/2000','EMAIL1@HOTMAIL.COM','0793565423','Rue de la Prulay 22','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KLMNO','Sandra','20/02/2000','EMAIL2@HOTMAIL.COM','0793443542','Chemin de la Citadelle 15','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'PQRST','Valérie','18/05/2000','EMAIL3@HOTMAIL.COM','0793585435','Chemin des Pâquerettes 63','1212','Grand-Lancy');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'UVWXY','Yannick','05/07/2000','EMAIL4@HOTMAIL.COM','0793588453','Chemin de Bonne 84','1213','Onex');
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','ABDULRASHID','Leila','04/11/1993','MARVINB@GMAIL.COM','0723652589','Route de Frontenex 52','1203','Genève','ABCD');
-- ============================================================
-- Ajout d'une nouvelle equipe.
-- ============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les pirates','A');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANEX','Irène','15/06/2000','EMAIL5@HOTMAIL.COM','0793554875','Avenue de Vaudagne 25','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'JOSS','Olivier','26/07/2000','EMAIL6@HOTMAIL.COM','0793589620','Rue des Lattes 53','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANVELLE','Elise','09/08/2000','EMAIL7@HOTMAIL.COM','0793546398','Avenue des Libellules 53','1219','Châtelaine');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DERIVAZ','Céline','26/08/2000','EMAIL8@HOTMAIL.COM','0793589523','Avenue de la Feuillasse 17','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KHOURI','Tarek','19/01/2000','EMAIL9@HOTMAIL.COM','0793589654','Rue Voltaire 66','1201','Genève');
-- ============================================================
--  Ajout d'un arbitre.
-- ============================================================
INSERT INTO JOU_ARBITRE VALUES (ID_ARBITRE.NEXTVAL,'JEAN','Bob','05/07/1979','KUSHQ@HOTMAIL.COM','0753444123','Rue des Délices 71','1201','Genève','1234');
-- ============================================================
-- Ajout d'une confrontation.
-- ============================================================
INSERT INTO JOU_CONFRONTATION VALUES (ID_CONFRONTATION.NEXTVAL,ID_EQUIPE.CURRVAL,ID_EQUIPE.CURRVAL-1,ID_TOURNOI.CURRVAL,ID_ARBITRE.CURRVAL,'FOOT','1','1');
-- ============================================================
-- Ajout d'un remplacement.
-- ============================================================
INSERT INTO JOU_REMPLACEMENT VALUES (ID_PROFESSEUR.CURRVAL,ID_PROFESSEUR.CURRVAL-1);
-- ============================================================
-- ============================================================
-- ============================================================
-- ===================  TRANSACTION 10  ========================
-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','JETRAND','Claire','23/02/1988','ClaireJ@GMAIL.COM','0768756544','Rue des Asters 44','1202','Genève','ABCD');
-- ============================================================
--  Ajout d'une équipe de 5 élèves.
-- =============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les sous-estimés','B');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ABCDE','Julio','23/03/2001','JULIO@HOTMAIL.COM','0762585125','Rue Marignac 26','1203','Genève');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'FGHIJ','Delphine','01/02/2001','EMAIL1@HOTMAIL.COM','0793565423','Rue de la Prulay 42','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KLMNO','Sandra','20/02/2001','EMAIL2@HOTMAIL.COM','0793443542','Chemin de la Citadelle 35','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'PQRST','Valérie','18/05/2001','EMAIL3@HOTMAIL.COM','0793585435','Chemin des Pâquerettes 43','1212','Grand-Lancy');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'UVWXY','Yannick','05/07/2001','EMAIL4@HOTMAIL.COM','0793588453','Chemin de Bonne 64','1213','Onex');
-- ============================================================
-- Ajout d'un professeur principal.
-- ============================================================
INSERT INTO JOU_PROFESSEUR VALUES(ID_PROFESSEUR.NEXTVAL,'1','MEMETROV','Karim','04/11/1993','KarimM@GMAIL.COM','0723652589','Route de Frontenex 2','1203','Genève','ABCD');
-- ============================================================
-- Ajout d'une nouvelle equipe.
-- ============================================================
INSERT INTO JOU_EQUIPE VALUES (ID_EQUIPE.NEXTVAL,ID_ECOLE.CURRVAL,ID_PROFESSEUR.CURRVAL,'Les sur-estimés','B');
-- ============================================================
-- Ajout d'élèves.
-- ============================================================
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANEX','Irène','15/06/2001','EMAIL5@HOTMAIL.COM','0793554875','Avenue de Vaudagne 35','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'JOSS','Olivier','26/07/2001','EMAIL6@HOTMAIL.COM','0793589620','Rue des Lattes 59','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'ANVELLE','Elise','09/08/2001','EMAIL7@HOTMAIL.COM','0793566398','Avenue des Libellules 23','1219','Châtelaine');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'DERIVAZ','Céline','26/08/2001','EMAIL8@HOTMAIL.COM','0793589523','Avenue de la Feuillasse 87','1217','Meyrin');
INSERT INTO JOU_ELEVE VALUES (ID_ELEVE.NEXTVAL,ID_EQUIPE.CURRVAL,'KHOURI','Tarek','19/01/2001','EMAIL9@HOTMAIL.COM','0793589654','Rue Voltaire 26','1201','Genève');
-- ============================================================
--  Ajout d'un arbitre.
-- ============================================================
INSERT INTO JOU_ARBITRE VALUES (ID_ARBITRE.NEXTVAL,'ARMINOV','Bruna','05/07/1979','BrunaA@HOTMAIL.COM','0753444123','Rue des Délices 1','1201','Genève','1234');
-- ============================================================
-- Ajout d'une confrontation.
-- ============================================================
INSERT INTO JOU_CONFRONTATION VALUES (ID_CONFRONTATION.NEXTVAL,ID_EQUIPE.CURRVAL,ID_EQUIPE.CURRVAL-1,ID_TOURNOI.CURRVAL,ID_ARBITRE.CURRVAL,'FOOT','0','3');
-- ============================================================
-- Ajout d'un remplacement.
-- ============================================================
INSERT INTO JOU_REMPLACEMENT VALUES (ID_PROFESSEUR.CURRVAL,ID_PROFESSEUR.CURRVAL-1);
-- ============================================================
-- ============================================================
-- ============================================================
-- =================  FIN DES TRANSACTIONS  ===================
-- ============================================================
-- ============================================================
-- ============================================================
-- ============================================================
-- Mise à jour du nom de l'école (de R-U à A-C)
-- ============================================================
-- ============================================================

SELECT * FROM JOU_ECOLE
WHERE ECO_NOM = 'RAYMOND-ULDRY';

UPDATE JOU_ECOLE
SET ECO_NOM = 'ANDRE-CHAVANNES'
WHERE ECO_ID = 1;

SELECT * FROM JOU_ECOLE
WHERE ECO_ID = 1;
COMMIT;

-- ============================================================
-- ============================================================
-- Mise à jour du temps de pause de midi (de 2 heures à 1 heure)
-- ============================================================
-- ============================================================

SELECT * FROM JOU_PARAMETRE
WHERE PAR_TEMPS_PAUSE_MIDI = 2;

UPDATE JOU_PARAMETRE
SET PAR_TEMPS_PAUSE_MIDI = 1
WHERE PAR_ID = 1;

SELECT * FROM JOU_PARAMETRE
WHERE PAR_ID = 1;
COMMIT;

