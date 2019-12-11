/*============================================================================*/
/* BDD - 621-2 - Contrôle Continu nr 2 - Christine Rizzi                     */
/* DBMS: Oracle 11                                                            */
/* Created on : 29/11/2018 05:19:16                                           */
/*============================================================================*/

ALTER SESSION SET NLS_DATE_FORMAT = 'dd.mm.yyyy';

/*============================================================================*/
/*                                  TABLES                                    */
/*============================================================================*/

DROP TABLE cc_voyageur CASCADE CONSTRAINT;
DROP TABLE cc_destination CASCADE CONSTRAINT;
DROP TABLE cc_package CASCADE CONSTRAINT;
DROP TABLE cc_depart CASCADE CONSTRAINT;

CREATE TABLE cc_voyageur (
  voy_no                    NUMBER(5) CONSTRAINT pk_cc_voyageur PRIMARY KEY,
  voy_civilite              VARCHAR2(4) NOT NULL,
  voy_nom                   VARCHAR2(40) NOT NULL,
  voy_prenom                VARCHAR2(40) NOT NULL,
  voy_ddn                   DATE NOT NULL,
  voy_voy_no                NUMBER(5),
  voy_mail                  VARCHAR2(50),
  voy_nationalite           VARCHAR2(2) NOT NULL,
  voy_cp                    VARCHAR2(10),
  voy_ville                 VARCHAR2(40),
  voy_tel                   VARCHAR2(25),
CONSTRAINT fk_voy_conjoint FOREIGN KEY (voy_voy_no) REFERENCES cc_voyageur(voy_no)
)
;

CREATE TABLE cc_destination (
  des_no                    NUMBER(5) CONSTRAINT pk_cc_destination PRIMARY KEY,
  des_nom                   VARCHAR2(50),
  des_tour_operator         VARCHAR2(40),
  des_argument              VARCHAR2(255),
  des_prix_base             NUMBER(8,2)
)
;

CREATE TABLE cc_package (
  pac_no                    NUMBER(5) CONSTRAINT pk_cc_package PRIMARY KEY,
  pac_nom                   VARCHAR2(40),
  pac_description           VARCHAR2(100),
  pac_code                  VARCHAR2(2),
  pac_supplement            NUMBER(2,1)

)
;

CREATE TABLE cc_depart (
  dep_no                    NUMBER(5) CONSTRAINT pk_cc_depart PRIMARY KEY,
  dep_date                  DATE,
  dep_voy_no                NUMBER(5),
  dep_des_no                NUMBER(5),
  dep_pac_no                NUMBER(5),
  CONSTRAINT fk_voyage_no FOREIGN KEY (dep_voy_no) REFERENCES cc_voyageur(voy_no),
  CONSTRAINT fk_destination_no FOREIGN KEY(dep_des_no) REFERENCES cc_destination(des_no),
  CONSTRAINT fk_package_no FOREIGN KEY (dep_pac_no) REFERENCES cc_package(pac_no)
)
;

/*============================================================================*/
/*                                   DONNEES                                  */
/*============================================================================*/

INSERT INTO cc_voyageur VALUES(1,'Mr','Sellier','Gaspard','21.1.1986',NULL,'gaspardsellier@heg.ch','IT','1213','St-Georges','+41 76 335 19 65');
INSERT INTO cc_voyageur VALUES(2,'Mlle','Barbier','Luna','25.1.1982',NULL,'lunabarbier@yahoo.com','CH','1227','Les Acacias','+41 76 770 55 53');
INSERT INTO cc_voyageur VALUES(3,'Mlle','Verdier','Pauline','27.5.1965',NULL,'paulineverdier@bluewin.ch','CH','1283','Malval','+41 79 206 75 81');
INSERT INTO cc_voyageur VALUES(4,'Mlle','Vaillant','Lisa','8.5.1969',NULL,'lisavaillant@yahoo.com','ch','1222','Vésenaz','+41 79 644 89 25');
INSERT INTO cc_voyageur VALUES(5,'Mme','Sellier','Lamia','27.2.1986',NULL,'lamiaricard@outlook.com','ch','1213','St-Georges','+41 76 847 95 98');
INSERT INTO cc_voyageur VALUES(6,'Mme','Adam','Mathilde','28.2.1978',NULL,'mathildeadam@yahoo.com','fr','1227','Les Acacias','+41 79 754 12 12');
INSERT INTO cc_voyageur VALUES(7,'Mr','Charpentier','Tom','3.7.1994',NULL,'tomcharpentier@yahoo.com','it','1227','les acacias','+41 77 084 56 55');
INSERT INTO cc_voyageur VALUES(8,'Mr','Voisin','Mattéo','17.5.1961',NULL,'matteovoisin@heg.ch','ES','1287','Laconnex','+41 78 940 97 15');
INSERT INTO cc_voyageur VALUES(9,'Mlle','Denis','Maïwenn','19.2.1984',NULL,'maiwenndenis@heg.ch','fr','1224','La Gradelle','+41 79 431 46 36');
INSERT INTO cc_voyageur VALUES(10,'Mme','Chartier','Célia','15.10.1971',NULL,'celiachartier@outlook.com','es','1225','Villette','+41 78 648 87 49');
INSERT INTO cc_voyageur VALUES(11,'Mr','Durant','Quentin','30.11.1972',NULL,'quentindurant@gmail.com','es','1256','Troinex','+41 77 537 07 11');
INSERT INTO cc_voyageur VALUES(12,'Mr','Moreno','Félix','8.5.1967',NULL,'felixmoreno@gmail.com','it','1245','Collonge','+41 77 303 26 55');
INSERT INTO cc_voyageur VALUES(13,'Mme','Ruiz','Clara','21.9.1993',NULL,'clararuiz@yahoo.com','CH','1257','Bardonnex','+41 76 544 46 72');
INSERT INTO cc_voyageur VALUES(14,'Mme','Moreno','Fanny','2.5.1965',NULL,'fannyseguin@heg.ch','ch','1245','Collonge','+41 76 756 38 39');
INSERT INTO cc_voyageur VALUES(15,'Mme','Navarro','Nina','9.11.2000',NULL,'ninanavarro@gmail.com','ch','1227','Les Acacias','+41 78 001 20 71');
INSERT INTO cc_voyageur VALUES(16,'Mr','Lacoste','Jules','20.4.1965',NULL,'juleslacoste@gmail.com','DE','1860','Fontanney','+41 79 400 50 83');
INSERT INTO cc_voyageur VALUES(17,'Mr','Vaillant','Kylian','30.7.1968',NULL,'kylianvaillant@yahoo.com','IT','1222','Vésenaz','+41 79 641 21 38');
INSERT INTO cc_voyageur VALUES(18,'Mr','Garnier','Florentin','20.11.1976',NULL,'florentingarnier@yahoo.com','es','1293','Valavran','+41 78 211 80 93');
INSERT INTO cc_voyageur VALUES(19,'Mme','Lamy','Bienvenue','29.1.1953',NULL,'bienvenuelamy@bluewin.ch','ch','1222','Vésenaz','+41 77 441 73 92');
INSERT INTO cc_voyageur VALUES(20,'Mr','Chartier','Amine','25.8.1972',NULL,'aminerobert@outlook.com','ch','1225','Villette','+41 76 275 31 93');
INSERT INTO cc_voyageur VALUES(21,'Mme','Faivre','Marie','19.4.1966',NULL,'mariefaivre@heg.ch','DE','1256','Troinex','+41 79 607 67 11');
INSERT INTO cc_voyageur VALUES(22,'Mr','Lesage','Thibault','30.9.1956',NULL,'thibaultlesage@gmail.com','DE','1253','Vandoeuvres','+41 76 259 90 15');
INSERT INTO cc_voyageur VALUES(23,'Mr','Maillard','Esteban','2.8.1957',NULL,'estebanmaillard@outlook.com','CH','1239','Vireloup','+41 76 376 19 81');
INSERT INTO cc_voyageur VALUES(24,'Mme','Garnier','Marine','26.6.1975',NULL,'marinerousseau@outlook.com','fr','1293','Valavran','+41 77 317 82 42');
INSERT INTO cc_voyageur VALUES(25,'Mr','Blin','Lilian','18.4.1966',NULL,'lilianblin@outlook.com','CH','1253','Vandoeuvres','+41 76 662 03 42');
INSERT INTO cc_voyageur VALUES(26,'Mr','Baron','Noah','5.10.1996',NULL,'noahbaron@yahoo.com','it','1200','Sécheron','+41 76 503 12 22');
INSERT INTO cc_voyageur VALUES(27,'Mlle','Adam','Edwige','14.1.1986',NULL,'edwigeadam@heg.ch','FR','1225','Villette','+41 76 877 68 81');
INSERT INTO cc_voyageur VALUES(28,'Mr','Briand','Mattéo','5.4.1978',NULL,'matteobriand@yahoo.com','CH','1231','Conches','+41 78 072 53 57');
INSERT INTO cc_voyageur VALUES(29,'Mr','Faivre','Julien','8.12.1966',NULL,'julienpoisson@heg.ch','es','1256','Troinex','+41 78 375 25 73');
INSERT INTO cc_voyageur VALUES(30,'Mr','Tanguy','Bastien','30.11.1984',NULL,'bastientanguy@yahoo.com','CH','1242','Satigny','+41 79 874 59 78');
INSERT INTO cc_voyageur VALUES(31,'Mme','Pons','Manon','26.7.1978',NULL,'manonpons@outlook.com','ch','1242','satigny','+41 79 417 53 89');
INSERT INTO cc_voyageur VALUES(32,'Mme','Gallet','Alice','25.5.1980',NULL,'alicegallet@BLUEWIN.ch','IT','1231','Conches','+41 78 094 92 19');
INSERT INTO cc_voyageur VALUES(33,'Mr','Fouquet','Mattéo','14.12.1989',NULL,'matteofouquet@yahoo.com','ch','1239','Vireloup','+41 77 242 48 60');
INSERT INTO cc_voyageur VALUES(34,'Mlle','Marion','Marine','30.12.1999',NULL,'marinemarion@heg.ch','ch','1283','Malval','+41 79 592 85 13');
INSERT INTO cc_voyageur VALUES(35,'Mr','Labbe','Fabrice','9.4.1966',NULL,'fabricelabbe@yahoo.com','CH','1236','Cartigny','+41 77 479 55 45');
INSERT INTO cc_voyageur VALUES(36,'Mme','Boutin','Angelina','26.4.1980',NULL,'angelinaboutin@bluewin.ch','CH','1236','Cartigny','+41 77 984 06 72');
INSERT INTO cc_voyageur VALUES(37,'Mme','Bonnet','Océane','29.2.1984',NULL,'oceanebonnet@heg.ch','IT','1234','Pinchat','+41 79 946 31 71');
INSERT INTO cc_voyageur VALUES(38,'Mr','Marin','Fabrice','28.2.1965',NULL,'fabricemarin@outlook.com','DE','1286','Soral','+41 77 320 41 38');
INSERT INTO cc_voyageur VALUES(39,'Mlle','Roche','Carla','30.8.1964',NULL,'carlaroche@heg.ch','fr','1236','Cartigny','+41 76 171 94 53');
INSERT INTO cc_voyageur VALUES(40,'Mme','Marquet','Chloé','2.5.2000',NULL,'chloemarquet@heg.ch','fr','1000','Vers-chez-les-Blancs','+41 79 114 87 49');
INSERT INTO cc_voyageur VALUES(41,'Mr','Marechal','Marwane','24.9.2000',NULL,'marwanemarechal@yahoo.com','ch','1257','Bardonnex','+41 79 672 67 53');
INSERT INTO cc_voyageur VALUES(42,'Mr','Delmas','Malo','28.4.1956',NULL,'malodelmas@gmail.com','CH','1226','Thônex','+41 79 157 52 86');
INSERT INTO cc_voyageur VALUES(43,'Mr','Marin','Mael','8.7.1993',NULL,'maelmarin@yahoo.com','DE','1241','Puplinge','+41 78 362 36 12');
INSERT INTO cc_voyageur VALUES(44,'Mr','Roques','Grégory','28.11.1966',NULL,'gregoryroques@gmail.com','fr','1241','Puplinge','+41 76 591 48 87');
INSERT INTO cc_voyageur VALUES(45,'Mr','Etienne','Paul','8.5.1968',NULL,'pauletienne@heg.ch','CH','1222','Vésenaz','+41 76 823 67 52');
INSERT INTO cc_voyageur VALUES(46,'Mr','Costa','Antonin','29.4.1970',NULL,'antonincosta@gmail.com','CH','1225','Villette','+41 76 334 05 27');
INSERT INTO cc_voyageur VALUES(47,'Mr','Rossignol','Killian','6.9.1972',NULL,'killianrossignol@bluewin.ch','FR','1285','Athenaz','+41 77 344 45 29');
INSERT INTO cc_voyageur VALUES(48,'Mr','Collet','Zacharis','17.6.1948',NULL,'zachariscollet@gmail.com','FR','1243','Presinge','+41 79 936 93 34');
INSERT INTO cc_voyageur VALUES(49,'Mr','Godin','Jordan','28.9.1997',NULL,'jordangodin@yahoo.com','DE','1227','les acacias','+41 76 087 65 38');
INSERT INTO cc_voyageur VALUES(50,'Mlle','Morand','Chloé','4.4.1975',NULL,'chloemorand@heg.ch','DE','1253','Vandoeuvres','+41 76 790 22 61');
INSERT INTO cc_voyageur VALUES(51,'Mlle','Gregoire','Éloïse','12.2.1955',NULL,'eloisegregoire@gmail.com','IT','1247','Anières','+41 78 659 77 78');
INSERT INTO cc_voyageur VALUES(52,'Mme','Dumoulin','Lilou','30.6.1991',NULL,'liloudumoulin@bluewin.ch','ES','1254','Monniaz','+41 79 049 99 21');
INSERT INTO cc_voyageur VALUES(53,'Mlle','Caron','Lina','12.12.1975',NULL,'linacaron@gmail.com','DE','1285','Athenaz','+41 79 201 55 40');
INSERT INTO cc_voyageur VALUES(54,'Mme','Renault','Margaux','31.12.1974',NULL,'margauxrenault@BLUEWIN.ch','ES','1231','Conches','+41 77 782 93 26');
INSERT INTO cc_voyageur VALUES(55,'Mme','Millet','Mélanie','2.8.1984',NULL,'melaniemillet@outlook.com','it','1224','La Gradelle','+41 76 221 74 95');
INSERT INTO cc_voyageur VALUES(56,'Mr','Barthelemy','Yanis','30.7.1986',NULL,'yanisbarthelemy@bluewin.ch','DE','1224','La Gradelle','+41 76 696 15 57');
INSERT INTO cc_voyageur VALUES(57,'Mme','Dupre','Carla','11.6.1989',NULL,'carladupre@heg.ch','FR','1242','Satigny','+41 79 975 41 52');
INSERT INTO cc_voyageur VALUES(58,'Mr','Colin','Adrian','28.2.1981',NULL,'adriancolin@heg.ch','it','1222','Vésenaz','+41 77 013 89 33');
INSERT INTO cc_voyageur VALUES(59,'Mme','Arnaud','Mélissa','23.3.1989',NULL,'melissaarnaud@heg.ch','ES','1222','Vésenaz','+41 77 611 2 99');
INSERT INTO cc_voyageur VALUES(60,'Mme','Couturier','Yasmine','5.4.1971',NULL,'yasminecouturier@gmail.com','IT','1223','Ruè','+41 78 005 50 46');
INSERT INTO cc_voyageur VALUES(61,'Mr','Jamet','Lilian','27.9.1988',NULL,'lilianjamet@heg.ch','it','1245','Collonge','+41 76 990 84 52');
INSERT INTO cc_voyageur VALUES(62,'Mme','Blin','Alexandra','4.10.1993',NULL,'alexandrablin@gmail.com','ES','1245','Collonge','+41 77 099 63 18');
INSERT INTO cc_voyageur VALUES(63,'Mme','Bouvet','Salomé','10.11.1994',NULL,'salomebouvet@bluewin.ch','FR','1255','Veyrier','+41 78 488 87 72');
INSERT INTO cc_voyageur VALUES(64,'Mlle','Legrand','Valentine','17.1.1956',NULL,'valentinelegrand@heg.ch','ch','1248','Hermance','+41 78 917 89 83');
INSERT INTO cc_voyageur VALUES(65,'Mme','Vaillant','Alexia','3.7.1956',NULL,'alexiavaillant@bluewin.ch','it','1247','Anières','+41 76 965 55 98');
INSERT INTO cc_voyageur VALUES(66,'Mr','Ferre','Maxence','30.5.1958',NULL,'maxenceferre@gmail.com','CH','1225','Villette','+41 78 549 51 97');
INSERT INTO cc_voyageur VALUES(67,'Mme','Tran','Marine','6.9.1988',NULL,'marinetran@gmail.com','FR','1233','Sézenove','+41 78 210 30 04');
INSERT INTO cc_voyageur VALUES(68,'Mr','Chevalier','Cédric','6.3.1990',NULL,'cedricchevalier@heg.ch','FR','1233','Sézenove','+41 77 394 15 66');
INSERT INTO cc_voyageur VALUES(69,'Mme','Gilbert','Lily','30.8.1991',NULL,'lilygilbert@heg.ch','ch','1283','Malval','+41 79 600 26 66');
INSERT INTO cc_voyageur VALUES(70,'Mr','Leger','Mael','1.10.1964',NULL,'maelleger@outlook.com','es','1234','Pinchat','+41 79 681 44 47');
INSERT INTO cc_voyageur VALUES(71,'Mr','Rault','Kyllian','4.12.1981',NULL,'kyllianrault@gmail.com','ch','1200','Sécheron','+41 79 865 79 60');
INSERT INTO cc_voyageur VALUES(72,'Mr','Brun','Benjamin','21.12.1998',NULL,'benjaminbrun@heg.ch','CH','1242','Satigny','+41 77 887 18 80');
INSERT INTO cc_voyageur VALUES(73,'Mlle','Berthier','Katell','2.11.1980',NULL,'katellberthier@bluewin.CH','CH','1212','Arare','+41 77 339 17 97');
INSERT INTO cc_voyageur VALUES(74,'Mme','David','Lou','12.1.1997',NULL,'loudavid@bluewin.ch','ch','1242','satigny','+41 77 050 37 11');
INSERT INTO cc_voyageur VALUES(75,'Mr','Leroux','Bruno','27.11.1947',NULL,'brunole.roux@yahoo.com','it','1254','Monniaz','+41 78 886 60 03');
INSERT INTO cc_voyageur VALUES(76,'Mr','Tardy','Pierre','16.2.1975',NULL,'pierretardy@heg.ch','DE','1290','Versoix le Bourg','+41 77 842 97 92');
INSERT INTO cc_voyageur VALUES(77,'Mme','Prevot','Julie','22.3.1979',NULL,'julieprevot@heg.ch','IT','1222','Vésenaz','+41 77 406 82 39');
INSERT INTO cc_voyageur VALUES(78,'Mr','Robin','Simon','18.7.1994',NULL,'simonrobin@yahoo.com','CH','1225','Villette','+41 77 090 05 86');
INSERT INTO cc_voyageur VALUES(79,'Mr','Herve','Dylan','30.7.1961',NULL,'dylanherve@outlook.com','es','1228','Plan-les-Ouates','+41 76 875 86 71');
INSERT INTO cc_voyageur VALUES(80,'Mme','Pages','Edwige','2.1.1969',NULL,'edwigepages@yahoo.com','DE','1228','Plan-les-Ouates','+41 78 259 33 24');
INSERT INTO cc_voyageur VALUES(81,'Mr','Vasseur','Maxence','3.3.1981',NULL,'maxencevasseur@yahoo.com','ch','1292','Pregny','+41 77 724 39 53');
INSERT INTO cc_voyageur VALUES(82,'Mr','Roger','Lorenzo','20.6.1992',NULL,'lorenzoroger@heg.ch','ch','1200','Sécheron','+41 78 955 09 00');
INSERT INTO cc_voyageur VALUES(83,'Mr','Paul','Maxime','9.8.1956',NULL,'maximepaul@heg.ch','CH','1224','La Gradelle','+41 77 467 55 75');
INSERT INTO cc_voyageur VALUES(84,'Mlle','Magnier','Clémence','4.3.1966',NULL,'clemencemagnier@yahoo.com','IT','1242','Satigny','+41 79 176 93 74');
INSERT INTO cc_voyageur VALUES(85,'Mr','Fontaine','Hugo','6.11.1952',NULL,'hugofontaine@gmail.com','ch','1231','Conches','+41 79 599 88 03');
INSERT INTO cc_voyageur VALUES(86,'Mme','Dubreuil','Elsa','14.12.1956',NULL,'elsadubreuil@gmail.com','ch','1231','Conches','+41 77 631 13 63');
INSERT INTO cc_voyageur VALUES(87,'Mlle','Mangin','Élise','28.10.1995',NULL,'elisemangin@bluewin.ch','ch','1254','Monniaz','+41 76 846 68 87');
INSERT INTO cc_voyageur VALUES(88,'Mme','Breton','Laura','13.11.1998',NULL,'laurabreton@heg.ch','CH','1285','Athenaz','+41 79 117 00 74');
INSERT INTO cc_voyageur VALUES(89,'Mr','Lacroix','Émile','20.12.1966',NULL,'emilelacroix@outlook.com','FR','1290','Versoix le Bourg','+41 79 282 73 59');
INSERT INTO cc_voyageur VALUES(90,'Mr','Mary','Victor','29.6.1973',NULL,'victormary@outlook.com','DE','1244','Chevrier','+41 76 783 96 43');
INSERT INTO cc_voyageur VALUES(91,'Mr','Morand','Kyllian','11.4.1995',NULL,'kyllianmorand@outlook.com','it','1241','Puplinge','+41 77 641 38 24');
INSERT INTO cc_voyageur VALUES(92,'Mr','Marion','Samuel','17.4.1997',NULL,'samuelmarion@bluewin.ch','FR','1256','Troinex','+41 77 973 24 56');
INSERT INTO cc_voyageur VALUES(93,'Mr','Morvan','Hugo','27.2.1939',NULL,'hugomorvan@heg.ch','DE','1217','Meyrin','+41 78 839 97 70');
INSERT INTO cc_voyageur VALUES(94,'Mme','Gauthier','Léa','28.4.1977',NULL,'leagauthier@heg.ch','it','1200','Sécheron','+41 77 582 61 56');
INSERT INTO cc_voyageur VALUES(95,'Mr','Carre','Théo','18.4.1971',NULL,'theocarre@gmail.com','CH','1200','Sécheron','+41 77 818 44 74');
INSERT INTO cc_voyageur VALUES(96,'Mlle','Ferre','Lucie','1.4.1948',NULL,'lucieferre@bluewin.ch','CH','1213','St-Georges','+41 77 971 31 42');
INSERT INTO cc_voyageur VALUES(97,'Mme','Maillard','Fanny','29.7.1968',NULL,'fannymaillard@heg.ch','CH','1200','Sécheron','+41 77 347 58 77');
INSERT INTO cc_voyageur VALUES(98,'Mme','Poulain','Lisa','14.9.1985',NULL,'lisapoulain@BLUEWIN.ch','es','1200','Sécheron','+41 76 331 55 70');
INSERT INTO cc_voyageur VALUES(99,'Mr','Monier','Guillaume','16.8.1990',NULL,'guillaumemonier@gmail.com','FR','1216','Cointrin','+41 76 544 59 46');
INSERT INTO cc_voyageur VALUES(100,'Mr','Forestier','Renaud','21.12.1950',NULL,'renaudforestier@heg.ch','FR','1232','Confignon','+41 77 975 07 35');
INSERT INTO cc_voyageur VALUES(101,'Mme','Bigot','Jasmine','22.6.1971',NULL,'jasminebigot@outlook.com','ES','1231','Conches','+41 79 262 16 25');
INSERT INTO cc_voyageur VALUES(102,'Mlle','Prevost','Edwige','18.3.1965',NULL,'edwigeprevost@gmail.com','ch','1200','Sécheron','+41 76 335 36 32');
INSERT INTO cc_voyageur VALUES(103,'Mlle','Pineau','Clotilde','29.9.1979',NULL,'clotildepineau@gmail.com','ES','1223','Ruè','+41 76 450 33 72');
INSERT INTO cc_voyageur VALUES(104,'Mme','Dias','Clémence','3.4.1970',NULL,'clemencedias@bluewin.ch','CH','1216','Cointrin','+41 76 821 17 96');
INSERT INTO cc_voyageur VALUES(105,'Mlle','Leon','Rosalie','28.7.1988',NULL,'rosalieleon@outlook.com','CH','1217','Meyrin','+41 76 832 95 88');
INSERT INTO cc_voyageur VALUES(106,'Mme','Morand','Éloïse','5.3.1959',NULL,'eloisemorand@bluewin.ch','ES','1242','satigny','+41 77 778 16 50');
INSERT INTO cc_voyageur VALUES(107,'Mlle','Le','Lilou','9.4.1967',NULL,'liloule@bluewin.ch','DE','1253','Vandoeuvres','+41 78 613 87 17');
INSERT INTO cc_voyageur VALUES(108,'Mlle','Humbert','Solene','25.11.1957',NULL,'solenehumbert@heg.ch','DE','1256','Troinex','+41 77 719 98 10');
INSERT INTO cc_voyageur VALUES(109,'Mr','Voisin','Thomas','24.9.1993',NULL,'thomasvoisin@bluewin.ch','ES','1227','Les Acacias','+41 78 717 40 82');
INSERT INTO cc_voyageur VALUES(110,'Mme','Mercier','Elsa','13.6.1959',NULL,'elsamercier@outlook.com','FR','1242','satigny','+41 79 792 23 73');
INSERT INTO cc_voyageur VALUES(111,'Mme','Prevot','Ambre','5.3.1972',NULL,'ambreprevot@outlook.com','it','1233','Sézenove','+41 77 252 46 98');
INSERT INTO cc_voyageur VALUES(112,'Mr','Fouquet','Marwane','8.1.1980',NULL,'marwanefouquet@bluewin.ch','it','1233','Sézenove','+41 77 513 85 71');
INSERT INTO cc_voyageur VALUES(113,'Mme','Marin','Maëlle','5.2.1961',NULL,'maellemarin@outlook.com','fr','1200','Sécheron','+41 78 803 66 42');
INSERT INTO cc_voyageur VALUES(114,'Mlle','Blot','Alexandra','2.3.1996',NULL,'alexandrablot@outlook.com','es','1242','satigny','+41 78 302 97 38');
INSERT INTO cc_voyageur VALUES(115,'Mme','Millot','Fanny','21.3.1974',NULL,'fannymillot@heg.ch','es','1245','Collonge','+41 79 872 29 91');
INSERT INTO cc_voyageur VALUES(116,'Mme','Bouchet','Lina','30.11.1986',NULL,'linabouchet@yahoo.com','ch','1223','Ruè','+41 77 168 05 56');
INSERT INTO cc_voyageur VALUES(117,'Mr','Caron','Victor','18.12.1994',NULL,'victorcaron@outlook.com','FR','1255','Veyrier','+41 76 250 13 51');
INSERT INTO cc_voyageur VALUES(118,'Mlle','Menard','Luna','2.7.1969',NULL,'lunamenard@heg.ch','ch','1222','Vésenaz','+41 79 979 95 37');
INSERT INTO cc_voyageur VALUES(119,'Mme','Hebert','Jeanne','29.1.1971',NULL,'jeannehebert@bluewin.ch','it','1254','Monniaz','+41 76 515 95 45');
INSERT INTO cc_voyageur VALUES(120,'Mr','Roy','Mathéo','8.9.1943',NULL,'matheoroy@gmail.com','DE','1227','les acacias','+41 76 055 48 37');
INSERT INTO cc_voyageur VALUES(121,'Mlle','Lefebvre','Clotilde','8.2.1964',NULL,'clotildelefebvre@outlook.com','es','1232','Confignon','+41 79 681 78 20');
INSERT INTO cc_voyageur VALUES(122,'Mr','Leduc','Jordan','19.5.1960',NULL,'jordanleduc@outlook.com','it','1251','Veigy (Suisse)','+41 79 526 07 04');
INSERT INTO cc_voyageur VALUES(123,'Mr','Herve','Timothée','2.6.1962',NULL,'timotheeherve@gmail.com','FR','1246','Corsier','+41 76 616 57 86');
INSERT INTO cc_voyageur VALUES(124,'Mr','Sauvage','Maxime','29.5.1964',NULL,'maximesauvage@heg.ch','FR','1222','Vésenaz','+41 78 035 72 96');
INSERT INTO cc_voyageur VALUES(125,'Mlle','Marchand','Lisa','30.4.1989',NULL,'lisamarchand@yahoo.com','fr','1231','Conches','+41 77 638 15 23');
INSERT INTO cc_voyageur VALUES(126,'Mme','Boulanger','Maïlé','14.3.1983',NULL,'maileboulanger@heg.ch','ch','1233','Sézenove','+41 79 023 51 88');
INSERT INTO cc_voyageur VALUES(127,'Mr','Lacroix','Thibault','2.12.1968',NULL,'thibaultlacroix@yahoo.com','IT','1233','Sézenove','+41 79 909 77 90');
INSERT INTO cc_voyageur VALUES(128,'Mr','Voisin','Noah','13.4.1998',NULL,'noahvoisin@outlook.com','CH','1239','Vireloup','+41 76 245 18 70');
INSERT INTO cc_voyageur VALUES(129,'Mr','Colas','Mehdi','21.7.1983',NULL,'mehdicolas@gmail.com','CH','1212','Arare','+41 79 421 88 64');
INSERT INTO cc_voyageur VALUES(130,'Mlle','Hernandez','Léa','14.9.1949',NULL,'leahernandez@heg.ch','ch','1298','Céligny','+41 76 154 86 38');
INSERT INTO cc_voyageur VALUES(131,'Mr','Diaz','Mathieu','15.5.1969',NULL,'mathieudiaz@outlook.com','ch','1294','Malagny','+41 76 872 80 99');
INSERT INTO cc_voyageur VALUES(132,'Mr','Marquet','Félix','9.6.1981',NULL,'felixmarquet@heg.ch','it','1200','Sécheron','+41 76 788 85 34');
INSERT INTO cc_voyageur VALUES(133,'Mr','Jacquet','Valentin','1.9.1990',NULL,'valentinjacquet@heg.ch','ch','1244','Chevrier','+41 76 932 40 79');
INSERT INTO cc_voyageur VALUES(134,'Mlle','Chartier','Marie','24.12.1973',NULL,'celiachartier@gmail.com','it','1223','Ruè','+41 76 074 22 21');
INSERT INTO cc_voyageur VALUES(135,'Mlle','Dupond','Anaëlle','18.11.1980',NULL,'anaelledupond@yahoo.com','ch','1253','Vandoeuvres','+41 79 832 30 55');
INSERT INTO cc_voyageur VALUES(136,'Mr','Duval','Enzo','12.11.2000',NULL,'enzoduval@heg.ch','ch','1212','Arare','+41 78 728 88 06');
INSERT INTO cc_voyageur VALUES(137,'Mme','Thibault','Catherine','6.2.1986',NULL,'catherinethibault@outlook.com','fr','1224','La Gradelle','+41 78 274 30 17');
INSERT INTO cc_voyageur VALUES(138,'Mme','Huguet','Margot','6.9.1987',NULL,'margothuguet@yahoo.com','ch','1246','Corsier','+41 78 708 34 51');
INSERT INTO cc_voyageur VALUES(139,'Mlle','Vial','Sara','2.12.1948',NULL,'saravial@yahoo.com','DE','1293','Valavran','+41 79 287 06 29');
INSERT INTO cc_voyageur VALUES(140,'Mme','Bernier','Lola','24.11.1975',NULL,'lolabernier@outlook.com','CH','1242','Satigny','+41 77 859 36 29');
INSERT INTO cc_voyageur VALUES(141,'Mr','Weber','Rémi','18.6.1977',NULL,'remiweber@outlook.com','CH','1233','Sézenove','+41 79 690 45 61');
INSERT INTO cc_voyageur VALUES(142,'Mr','Le roux','Lilian','24.3.1970',NULL,'lilianle.roux@outlook.com','ch','1256','Troinex','+41 78 684 52 90');
INSERT INTO cc_voyageur VALUES(143,'Mme','Robin','Inès','22.11.1986',NULL,'inesrobin@yahoo.com','FR','1225','Villette','+41 77 569 56 83');
INSERT INTO cc_voyageur VALUES(144,'Mlle','Bouchard','Syrine','18.8.1973',NULL,'syrinebouchard@outlook.com','ch','1860','Fontanney','+41 79 093 86 64');
INSERT INTO cc_voyageur VALUES(145,'Mr','Blot','Julien','30.5.1990',NULL,'julienblot@outlook.com','fr','1225','Villette','+41 77 627 59 84');
INSERT INTO cc_voyageur VALUES(146,'Mme','Pichon','Julie','29.1.1975',NULL,'juliepichon@bluewin.ch','IT','1293','Valavran','+41 79 904 47 48');
INSERT INTO cc_voyageur VALUES(147,'Mlle','Laporte','Salomé','29.5.1998',NULL,'salomelaporte@heg.ch','fr','1820','Vernex','+41 77 402 81 87');
INSERT INTO cc_voyageur VALUES(148,'Mr','Tanguy','Mohamed','12.2.1983',NULL,'mohamedtanguy@yahoo.com','it','1257','Bardonnex','+41 78 471 58 75');
INSERT INTO cc_voyageur VALUES(149,'Mlle','Monnet','Lana','16.3.1971',NULL,'lanamonnet@bluewin.ch','es','1285','Athenaz','+41 79 673 39 85');
INSERT INTO cc_voyageur VALUES(150,'Mr','Blot','Nathan','8.11.2000',NULL,'nathanblot@gmail.com','fr','1293','Valavran','+41 77 652 72 10');
INSERT INTO cc_voyageur VALUES(151,'Mr','Guiraud','Mohamed','24.9.1951',NULL,'mohamedguiraud@heg.ch','ES','1288','Aire-la-Ville','+41 79 060 85 09');
INSERT INTO cc_voyageur VALUES(152,'Mme','Boulanger','Lola','28.2.1989',NULL,'lolaboulanger@yahoo.com','DE','1219','Aïre','+41 76 456 98 44');
INSERT INTO cc_voyageur VALUES(153,'Mr','Rey','Yanis','15.8.1986',NULL,'yanisrey@gmail.com','CH','1242','satigny','+41 78 629 45 77');
INSERT INTO cc_voyageur VALUES(154,'Mr','Allard','Timéo','20.3.1993',NULL,'timeoallard@bluewin.ch','ch','1216','Cointrin','+41 77 636 14 04');
INSERT INTO cc_voyageur VALUES(155,'Mme','Monnier','Maéva','18.2.1987',NULL,'maevamonnier@heg.ch','fr','1244','Chevrier','+41 77 808 38 40');
INSERT INTO cc_voyageur VALUES(156,'Mlle','Mouton','Julie','28.6.1969',NULL,'juliemouton@heg.ch','ch','1231','Conches','+41 76 228 81 56');
INSERT INTO cc_voyageur VALUES(157,'Mlle','Duval','Élisa','9.1.1999',NULL,'elisaduval@yahoo.com','FR','1236','Cartigny','+41 77 897 48 99');
INSERT INTO cc_voyageur VALUES(158,'Mr','Etienne','Simon','7.7.1968',NULL,'simonetienne@yahoo.com','CH','1224','La Gradelle','+41 76 183 88 91');
INSERT INTO cc_voyageur VALUES(159,'Mme','Breton','Luna','6.4.1972',NULL,'lunabreton@heg.ch','CH','1290','Versoix le Bourg','+41 76 526 16 40');
INSERT INTO cc_voyageur VALUES(160,'Mr','Charles','Pierre','7.5.1992',NULL,'pierrecharles@gmail.com','IT','1225','Villette','+41 78 936 70 79');
INSERT INTO cc_voyageur VALUES(161,'Mr','Roy','Adrien','24.12.1957',NULL,'adrienroy@bluewin.ch','ES','1254','Monniaz','+41 76 962 27 23');
INSERT INTO cc_voyageur VALUES(162,'Mr','Descamps','Samuel','7.4.1969',NULL,'samueldescamps@yahoo.com','CH','1242','Satigny','+41 79 582 75 26');
INSERT INTO cc_voyageur VALUES(163,'Mr','Boyer','Paul','22.5.1987',NULL,'paulboyer@outlook.com','ch','1213','St-Georges','+41 76 730 70 08');
INSERT INTO cc_voyageur VALUES(164,'Mme','Bataille','Amandine','24.9.1997',NULL,'amandinebataille@bluewin.ch','fr','1223','Ruè','+41 77 737 78 63');
INSERT INTO cc_voyageur VALUES(165,'Mme','Huguet','Capucine','21.4.1964',NULL,'capucinehuguet@gmail.com','it','1285','Athenaz','+41 79 681 89 34');
INSERT INTO cc_voyageur VALUES(166,'Mr','Bouvier','Lilian','24.8.1966',NULL,'lilianbouvier@outlook.com','es','1236','Cartigny','+41 78 860 88 16');
INSERT INTO cc_voyageur VALUES(167,'Mr','Rousseau','Anthony','11.7.1977',NULL,'anthonyrousseau@yahoo.com','IT','1254','Monniaz','+41 76 114 98 78');
INSERT INTO cc_voyageur VALUES(168,'Mlle','Roger','Léane','30.12.1963',NULL,'leaneroger@gmail.com','DE','1288','Aire-la-Ville','+41 78 443 82 60');
INSERT INTO cc_voyageur VALUES(169,'Mme','Bayle','Lilou','27.5.1950',NULL,'liloubayle@gmail.com','IT','1254','Monniaz','+41 78 195 45 12');
INSERT INTO cc_voyageur VALUES(170,'Mlle','Duval','Luna','13.11.1954',NULL,'lunaduval@BLUEWIN.ch','ch','1290','Versoix le Bourg','+41 78 600 49 93');
INSERT INTO cc_voyageur VALUES(171,'Mr','Valette','Mohamed','26.3.1950',NULL,'mohamedvalette@gmail.com','CH','1281','Russin','+41 78 749 52 40');
INSERT INTO cc_voyageur VALUES(172,'Mr','Jung','Gaspard','25.10.1980',NULL,'gaspardjung@heg.ch','DE','1236','Cartigny','+41 78 203 82 35');
INSERT INTO cc_voyageur VALUES(173,'Mr','Grand','Théo','13.4.1957',NULL,'theogrand@yahoo.com','DE','1222','Vésenaz','+41 76 403 45 43');
INSERT INTO cc_voyageur VALUES(174,'Mr','Andre','Dorian','28.9.1979',NULL,'dorianandre@yahoo.com','DE','1254','Monniaz','+41 76 594 51 48');
INSERT INTO cc_voyageur VALUES(175,'Mr','Lamy','Valentin','2.6.1985',NULL,'valentinlamy@heg.ch','CH','1244','Chevrier','+41 76 774 04 59');
INSERT INTO cc_voyageur VALUES(176,'Mr','Guichard','Nicolas','16.1.1980',NULL,'nicolasguichard@yahoo.com','es','1820','Vernex','+41 78 882 67 12');
INSERT INTO cc_voyageur VALUES(177,'Mlle','Potier','Lauriane','30.10.1957',NULL,'laurianepotier@gmail.com','ES','1243','Presinge','+41 79 771 59 17');
INSERT INTO cc_voyageur VALUES(178,'Mme','Hubert','Romane','4.12.1983',NULL,'romanehubert@yahoo.com','ES','1227','Les Acacias','+41 76 753 49 01');
INSERT INTO cc_voyageur VALUES(179,'Mr','Morin','Nathan','17.7.1986',NULL,'nathanmorin@yahoo.com','ch','1860','Fontanney','+41 78 523 65 12');
INSERT INTO cc_voyageur VALUES(180,'Mme','Ribeiro','Léonie','14.6.1993',NULL,'leonieribeiro@outlook.com','FR','1281','Russin','+41 77 358 74 43');
INSERT INTO cc_voyageur VALUES(181,'Mme','Le corre','Alice','11.12.1949',NULL,'alicele.corre@bluewin.ch','DE','1218','Le Grand-Saconnex','+41 76 398 55 00');
INSERT INTO cc_voyageur VALUES(182,'Mr','Moulin','Élouan','11.12.1949',NULL,'elouanmoulin@heg.ch','IT','1218','Le Grand-Saconnex','+41 76 794 88 20');
INSERT INTO cc_voyageur VALUES(183,'Mr','Lopez','Gilbert','30.9.1950',NULL,'gilbertlopez@outlook.com','ES','1222','Vésenaz','+41 78 364 26 06');
INSERT INTO cc_voyageur VALUES(184,'Mlle','Evrard','Nina','19.11.1999',NULL,'ninaevrard@bluewin.ch','ch','1222','Vésenaz','+41 79 988 84 83');
INSERT INTO cc_voyageur VALUES(185,'Mlle','Moreau','Salomé','18.7.1948',NULL,'salomemoreau@yahoo.com','es','1257','Bardonnex','+41 76 923 20 95');
INSERT INTO cc_voyageur VALUES(186,'Mr','Peron','Bastien','2.8.1994',NULL,'bastienperon@heg.ch','fr','1241','Puplinge','+41 78 481 55 29');
INSERT INTO cc_voyageur VALUES(187,'Mme','Pasquier','Charlotte','14.7.1971',NULL,'charlottepasquier@yahoo.com','IT','1253','Vandoeuvres','+41 78 480 30 75');
INSERT INTO cc_voyageur VALUES(188,'Mlle','Tellier','Anaïs','24.8.1962',NULL,'anaistellier@yahoo.com','fr','1860','Fontanney','+41 79 360 66 61');
INSERT INTO cc_voyageur VALUES(189,'Mr','Chapuis','Grégory','14.7.1980',NULL,'gregorychapuis@heg.ch','DE','1214','Vernier','+41 76 978 08 99');
INSERT INTO cc_voyageur VALUES(190,'Mr','Claude','Quentin','30.8.1950',NULL,'quentinclaude@yahoo.com','ch','1219','Aïre','+41 79 536 30 91');
INSERT INTO cc_voyageur VALUES(191,'Mr','Maire','Antoine','27.11.1959',NULL,'antoinemaire@yahoo.com','ch','1200','Sécheron','+41 79 877 84 36');
INSERT INTO cc_voyageur VALUES(192,'Mr','Hubert','Hugo','16.8.1977',NULL,'hugohubert@gmail.com','fr','1239','Vireloup','+41 79 022 55 24');
INSERT INTO cc_voyageur VALUES(193,'Mlle','Mangin','Maïwenn','21.8.1958',NULL,'maiwennmangin@outlook.com','CH','1242','satigny','+41 76 488 35 76');
INSERT INTO cc_voyageur VALUES(194,'Mr','Lamy','Julien','24.1.1994',NULL,'julienlamy@yahoo.com','ch','1217','Meyrin','+41 79 958 00 83');
INSERT INTO cc_voyageur VALUES(195,'Mr','Gallet','Dimitri','28.3.1999',NULL,'dimitrigallet@bluewin.ch','IT','1245','Collonge','+41 76 104 93 86');
INSERT INTO cc_voyageur VALUES(196,'Mlle','Paul','Catherine','26.1.1996',NULL,'catherinepaul@gmail.com','DE','1251','Veigy (Suisse)','+41 79 833 51 23');
INSERT INTO cc_voyageur VALUES(197,'Mr','Leleu','Constant','24.9.1988',NULL,'constantleleu@outlook.com','fr','1292','Pregny','+41 77 336 60 86');
INSERT INTO cc_voyageur VALUES(198,'Mr','Leblanc','Théo','21.3.1958',NULL,'theoleblanc@yahoo.com','CH','1233','Sézenove','+41 77 960 69 97');
INSERT INTO cc_voyageur VALUES(199,'Mr','Robert','Bruno','11.2.1960',NULL,'brunorobert@outlook.com','fr','1233','Sézenove','+41 79 108 98 52');
INSERT INTO cc_voyageur VALUES(200,'Mlle','Blanchard','Ambre','31.1.1968',NULL,'ambreblanchard@outlook.com','ES','1241','Puplinge','+41 77 277 69 85');
COMMIT;

UPDATE cc_voyageur SET voy_voy_no = 5 where voy_no = 1;
UPDATE cc_voyageur SET voy_voy_no = 1 where voy_no = 5;
UPDATE cc_voyageur SET voy_voy_no = 7 where voy_no = 6;
UPDATE cc_voyageur SET voy_voy_no = 6 where voy_no = 7;
UPDATE cc_voyageur SET voy_voy_no = 20 where voy_no = 10;
UPDATE cc_voyageur SET voy_voy_no = 14 where voy_no = 12;
UPDATE cc_voyageur SET voy_voy_no = 12 where voy_no = 14;
UPDATE cc_voyageur SET voy_voy_no = 49 where voy_no = 15;
UPDATE cc_voyageur SET voy_voy_no = 24 where voy_no = 18;
UPDATE cc_voyageur SET voy_voy_no = 10 where voy_no = 20;
UPDATE cc_voyageur SET voy_voy_no = 29 where voy_no = 21;
UPDATE cc_voyageur SET voy_voy_no = 18 where voy_no = 24;
UPDATE cc_voyageur SET voy_voy_no = 32 where voy_no = 28;
UPDATE cc_voyageur SET voy_voy_no = 21 where voy_no = 29;
UPDATE cc_voyageur SET voy_voy_no = 31 where voy_no = 30;
UPDATE cc_voyageur SET voy_voy_no = 30 where voy_no = 31;
UPDATE cc_voyageur SET voy_voy_no = 28 where voy_no = 32;
UPDATE cc_voyageur SET voy_voy_no = 15 where voy_no = 49;
UPDATE cc_voyageur SET voy_voy_no = 56 where voy_no = 55;
UPDATE cc_voyageur SET voy_voy_no = 55 where voy_no = 56;
UPDATE cc_voyageur SET voy_voy_no = 59 where voy_no = 58;
UPDATE cc_voyageur SET voy_voy_no = 58 where voy_no = 59;
UPDATE cc_voyageur SET voy_voy_no = 62 where voy_no = 61;
UPDATE cc_voyageur SET voy_voy_no = 61 where voy_no = 62;
UPDATE cc_voyageur SET voy_voy_no = 68 where voy_no = 67;
UPDATE cc_voyageur SET voy_voy_no = 67 where voy_no = 68;
UPDATE cc_voyageur SET voy_voy_no = 74 where voy_no = 72;
UPDATE cc_voyageur SET voy_voy_no = 72 where voy_no = 74;
UPDATE cc_voyageur SET voy_voy_no = 80 where voy_no = 79;
UPDATE cc_voyageur SET voy_voy_no = 79 where voy_no = 80;
UPDATE cc_voyageur SET voy_voy_no = 86 where voy_no = 85;
UPDATE cc_voyageur SET voy_voy_no = 85 where voy_no = 86;
UPDATE cc_voyageur SET voy_voy_no = 97 where voy_no = 95;
UPDATE cc_voyageur SET voy_voy_no = 95 where voy_no = 97;
UPDATE cc_voyageur SET voy_voy_no = 112 where voy_no = 111;
UPDATE cc_voyageur SET voy_voy_no = 111 where voy_no = 112;
UPDATE cc_voyageur SET voy_voy_no = 127 where voy_no = 126;
UPDATE cc_voyageur SET voy_voy_no = 126 where voy_no = 127;
UPDATE cc_voyageur SET voy_voy_no = 145 where voy_no = 143;
UPDATE cc_voyageur SET voy_voy_no = 143 where voy_no = 145;
UPDATE cc_voyageur SET voy_voy_no = 182 where voy_no = 181;
UPDATE cc_voyageur SET voy_voy_no = 181 where voy_no = 182;
COMMIT;

INSERT INTO cc_destination VALUES(1,'Papouasie-Nouvelle-Guinée','HEG''s tour','L''un des pays les moins explorés du monde',3780);
INSERT INTO cc_destination VALUES(2,'Delta de l''Okavango du Botswana','Let''s travel now','Inoubliable – la migration des animaux africains vers les eaux du delta',4975);
INSERT INTO cc_destination VALUES(3,'Côte des Squelettes de Namibie','HEG''s tour','Du sable à perte de vue',4945);
INSERT INTO cc_destination VALUES(4,'Les Rocheuses canadiennes','Swiss voyage','Une vue à couper le souffle au parc national de Banff',3210);
INSERT INTO cc_destination VALUES(5,'Péninsule du Yucatán, Mexique','Swiss voyage','Le Grand Cenote n''attend plus que vous',4388);
INSERT INTO cc_destination VALUES(6,'Forêt de Bialowieza en Pologne','HEG''s tour','Bienvenue… à la forêt de Białowieża',5541);
INSERT INTO cc_destination VALUES(7,'Grand Canyon aux Etats-Unis','Let''s travel now','Laissez-vous aspirer par le canyon',9915);
INSERT INTO cc_destination VALUES(8,'Les récifs coralliens de l''Indonésie','Swiss voyage','Une tortue à écailles qui passait par là…',6868);
INSERT INTO cc_destination VALUES(9,'Les Grandes Plaines du Montana aux Etats-Unis','HEG''s tour','Les bisons du parc national de Yellowstone',8908);
INSERT INTO cc_destination VALUES(10,'Madagascar','Swiss voyage','Le plus petit lémur du monde pèse l''équivalent d''un petit paquet de raisins secs',10015);
INSERT INTO cc_destination VALUES(11,'Les îles Galapagos','Let''s travel now','Les créatures endémiques de ces îles sont toutes exceptionnellement sympathiques !',5624);
INSERT INTO cc_destination VALUES(12,'Jodhpur en Inde','HEG''s tour','Un langur, en train de surveiller son royaume',9144);
INSERT INTO cc_destination VALUES(13,'Antarctique','HEG''s tour','Calme et magnifique',4269);
COMMIT;

INSERT INTO cc_package VALUES(1,'Tout inclus','Pension complète + boissons + activités','TI',1.5);
INSERT INTO cc_package VALUES(2,'Pension complète','Hôtel et petit déjeuner et repas','PC',1.3);
INSERT INTO cc_package VALUES(3,'Demi pension','Hôtel et petit déjeuner','DP',1.2);
INSERT INTO cc_package VALUES(4,'Basic','Hôtel seul','BA',1.1);
INSERT INTO cc_package VALUES(5,'Special','Organisation ad hoc','SP',2);
COMMIT;

INSERT INTO cc_depart VALUES(1,'27.1.2019',42,2,2);
INSERT INTO cc_depart VALUES(2,'28.5.2019',4,6,3);
INSERT INTO cc_depart VALUES(3,'15.4.2019',17,1,1);
INSERT INTO cc_depart VALUES(4,'20.5.2019',43,8,4);
INSERT INTO cc_depart VALUES(5,'23.4.2019',31,3,3);
INSERT INTO cc_depart VALUES(6,'21.12.2018',9,9,3);
INSERT INTO cc_depart VALUES(7,'21.1.2019',23,11,3);
INSERT INTO cc_depart VALUES(8,'27.1.2019',39,2,3);
INSERT INTO cc_depart VALUES(9,'27.1.2019',39,2,1);
INSERT INTO cc_depart VALUES(10,'7.1.2019',24,13,2);
INSERT INTO cc_depart VALUES(11,'7.1.2019',18,13,2);
INSERT INTO cc_depart VALUES(12,'11.5.2019',36,2,2);
INSERT INTO cc_depart VALUES(13,'7.5.2019',2,4,2);
INSERT INTO cc_depart VALUES(14,'28.2.2019',49,3,2);
INSERT INTO cc_depart VALUES(15,'28.2.2019',15,3,2);
INSERT INTO cc_depart VALUES(16,'7.6.2019',36,12,5);
INSERT INTO cc_depart VALUES(17,'15.12.2018',22,8,1);
INSERT INTO cc_depart VALUES(18,'28.2.2019',1,3,2);
INSERT INTO cc_depart VALUES(19,'28.2.2019',5,3,2);
INSERT INTO cc_depart VALUES(20,'14.3.2019',19,8,1);
INSERT INTO cc_depart VALUES(21,'10.5.2019',28,13,2);
INSERT INTO cc_depart VALUES(22,'22.4.2019',22,11,2);
INSERT INTO cc_depart VALUES(23,'7.6.2019',24,9,4);
INSERT INTO cc_depart VALUES(24,'7.6.2019',18,9,4);
INSERT INTO cc_depart VALUES(25,'29.4.2019',27,11,1);
INSERT INTO cc_depart VALUES(26,'17.4.2019',47,12,2);
INSERT INTO cc_depart VALUES(27,'15.4.2019',49,1,2);
INSERT INTO cc_depart VALUES(28,'15.4.2019',15,1,2);
INSERT INTO cc_depart VALUES(29,'24.12.2018',14,6,4);
INSERT INTO cc_depart VALUES(30,'24.12.2018',12,6,4);
INSERT INTO cc_depart VALUES(31,'21.2.2019',11,12,1);
INSERT INTO cc_depart VALUES(32,'2.2.2019',17,12,3);
INSERT INTO cc_depart VALUES(33,'24.2.2019',46,13,4);
INSERT INTO cc_depart VALUES(34,'31.1.2019',8,6,4);
INSERT INTO cc_depart VALUES(35,'19.1.2019',12,5,3);
INSERT INTO cc_depart VALUES(36,'31.12.2018',31,9,2);
INSERT INTO cc_depart VALUES(37,'31.12.2018',30,9,2);
INSERT INTO cc_depart VALUES(38,'28.5.2019',29,6,5);
INSERT INTO cc_depart VALUES(39,'28.5.2019',21,6,5);
INSERT INTO cc_depart VALUES(40,'11.5.2019',40,2,5);
INSERT INTO cc_depart VALUES(41,'15.4.2019',40,1,1);
INSERT INTO cc_depart VALUES(42,'1.6.2019',39,7,1);
INSERT INTO cc_depart VALUES(43,'11.12.2018',13,9,5);
INSERT INTO cc_depart VALUES(44,'20.5.2019',14,13,5);
INSERT INTO cc_depart VALUES(45,'20.5.2019',12,13,5);
INSERT INTO cc_depart VALUES(46,'15.4.2019',25,1,3);
INSERT INTO cc_depart VALUES(47,'19.1.2019',14,5,3);
INSERT INTO cc_depart VALUES(48,'3.12.2018',17,4,1);
INSERT INTO cc_depart VALUES(49,'21.12.2018',20,13,3);
INSERT INTO cc_depart VALUES(50,'21.12.2018',10,13,3);
INSERT INTO cc_depart VALUES(51,'13.6.2019',33,1,2);
INSERT INTO cc_depart VALUES(52,'11.5.2019',44,2,3);
INSERT INTO cc_depart VALUES(53,'19.2.2019',39,5,2);
INSERT INTO cc_depart VALUES(54,'16.12.2018',28,8,4);
INSERT INTO cc_depart VALUES(55,'1.4.2019',5,6,1);
INSERT INTO cc_depart VALUES(56,'1.4.2019',1,6,1);
INSERT INTO cc_depart VALUES(57,'8.12.2018',32,7,3);
INSERT INTO cc_depart VALUES(58,'31.1.2019',27,7,5);
INSERT INTO cc_depart VALUES(59,'15.6.2019',25,6,3);
INSERT INTO cc_depart VALUES(60,'28.6.2019',47,7,1);
INSERT INTO cc_depart VALUES(61,'30.6.2019',17,4,5);
INSERT INTO cc_depart VALUES(62,'13.5.2019',79,2,1);
INSERT INTO cc_depart VALUES(63,'13.5.2019',80,2,1);
INSERT INTO cc_depart VALUES(64,'13.5.2019',56,13,1);
INSERT INTO cc_depart VALUES(65,'1.7.2019',56,3,3);
INSERT INTO cc_depart VALUES(66,'13.5.2019',55,13,1);
INSERT INTO cc_depart VALUES(67,'1.7.2019',55,3,3);
INSERT INTO cc_depart VALUES(68,'25.2.2019',68,12,3);
INSERT INTO cc_depart VALUES(69,'25.2.2019',67,12,3);
INSERT INTO cc_depart VALUES(70,'13.5.2019',8,2,1);
INSERT INTO cc_depart VALUES(71,'21.1.2019',86,11,3);
INSERT INTO cc_depart VALUES(72,'13.5.2019',86,2,2);
INSERT INTO cc_depart VALUES(73,'21.1.2019',85,11,3);
INSERT INTO cc_depart VALUES(74,'13.5.2019',85,2,2);
INSERT INTO cc_depart VALUES(75,'6.5.2019',97,4,5);
INSERT INTO cc_depart VALUES(76,'6.5.2019',95,4,5);
INSERT INTO cc_depart VALUES(77,'3.12.2018',127,4,3);
INSERT INTO cc_depart VALUES(78,'21.1.2019',127,5,4);
INSERT INTO cc_depart VALUES(79,'3.12.2018',126,4,3);
INSERT INTO cc_depart VALUES(80,'21.1.2019',126,5,4);
INSERT INTO cc_depart VALUES(81,'3.6.2019',143,7,1);
INSERT INTO cc_depart VALUES(82,'3.6.2019',145,7,1);
INSERT INTO cc_depart VALUES(83,'10.6.2019',182,12,4);
INSERT INTO cc_depart VALUES(84,'10.6.2019',181,12,4);
INSERT INTO cc_depart VALUES(85,'17.12.2018',83,8,1);
INSERT INTO cc_depart VALUES(86,'10.6.2019',175,12,4);
INSERT INTO cc_depart VALUES(87,'10.6.2019',193,9,2);
INSERT INTO cc_depart VALUES(88,'21.1.2019',192,5,4);
INSERT INTO cc_depart VALUES(89,'24.12.2018',107,13,2);
INSERT INTO cc_depart VALUES(90,'21.1.2019',194,5,2);
INSERT INTO cc_depart VALUES(91,'22.4.2019',66,11,4);
INSERT INTO cc_depart VALUES(92,'1.7.2019',110,3,5);
INSERT INTO cc_depart VALUES(93,'13.5.2019',100,13,4);
INSERT INTO cc_depart VALUES(94,'24.12.2018',78,6,5);
INSERT INTO cc_depart VALUES(95,'21.1.2019',170,5,4);
INSERT INTO cc_depart VALUES(96,'4.3.2019',183,3,1);
INSERT INTO cc_depart VALUES(97,'10.6.2019',121,9,2);
INSERT INTO cc_depart VALUES(98,'1.4.2019',196,6,4);
INSERT INTO cc_depart VALUES(99,'15.4.2019',177,1,2);
INSERT INTO cc_depart VALUES(100,'24.12.2018',195,6,3);
INSERT INTO cc_depart VALUES(101,'22.4.2019',103,11,5);
INSERT INTO cc_depart VALUES(102,'18.3.2019',141,8,3);
INSERT INTO cc_depart VALUES(103,'10.12.2018',120,7,2);
INSERT INTO cc_depart VALUES(104,'13.5.2019',117,2,5);
INSERT INTO cc_depart VALUES(105,'6.5.2019',128,4,2);
INSERT INTO cc_depart VALUES(106,'3.6.2019',117,7,1);
INSERT INTO cc_depart VALUES(107,'21.1.2019',196,11,5);
INSERT INTO cc_depart VALUES(108,'4.3.2019',53,3,2);
INSERT INTO cc_depart VALUES(109,'13.5.2019',198,2,2);
INSERT INTO cc_depart VALUES(110,'28.1.2019',94,2,5);
INSERT INTO cc_depart VALUES(111,'21.1.2019',54,5,5);
INSERT INTO cc_depart VALUES(112,'22.4.2019',172,11,4);
INSERT INTO cc_depart VALUES(113,'4.3.2019',167,3,4);
INSERT INTO cc_depart VALUES(114,'10.6.2019',52,9,2);
INSERT INTO cc_depart VALUES(115,'10.6.2019',109,12,2);
INSERT INTO cc_depart VALUES(116,'24.12.2018',66,13,2);
INSERT INTO cc_depart VALUES(117,'4.3.2019',168,3,2);
INSERT INTO cc_depart VALUES(118,'1.4.2019',190,6,1);
INSERT INTO cc_depart VALUES(119,'15.4.2019',57,1,1);
INSERT INTO cc_depart VALUES(120,'24.12.2018',154,9,4);
INSERT INTO cc_depart VALUES(121,'21.1.2019',183,5,1);
INSERT INTO cc_depart VALUES(122,'1.4.2019',115,6,3);
INSERT INTO cc_depart VALUES(123,'19.8.2019',83,1,2);
INSERT INTO cc_depart VALUES(124,'3.6.2019',51,7,4);
INSERT INTO cc_depart VALUES(125,'10.6.2019',154,9,3);
INSERT INTO cc_depart VALUES(126,'15.4.2019',187,1,3);
INSERT INTO cc_depart VALUES(127,'25.2.2019',52,12,3);
INSERT INTO cc_depart VALUES(128,'25.2.2019',193,12,4);
INSERT INTO cc_depart VALUES(129,'13.5.2019',78,13,4);
INSERT INTO cc_depart VALUES(130,'6.5.2019',140,4,4);
INSERT INTO cc_depart VALUES(131,'1.4.2019',152,6,1);
INSERT INTO cc_depart VALUES(132,'21.1.2019',60,11,5);
INSERT INTO cc_depart VALUES(133,'10.6.2019',113,9,4);
INSERT INTO cc_depart VALUES(134,'25.2.2019',134,12,3);
INSERT INTO cc_depart VALUES(135,'10.6.2019',118,9,4);
INSERT INTO cc_depart VALUES(136,'22.4.2019',142,11,5);
INSERT INTO cc_depart VALUES(137,'24.12.2018',155,9,1);
INSERT INTO cc_depart VALUES(138,'3.12.2018',100,4,3);
INSERT INTO cc_depart VALUES(139,'21.1.2019',121,5,3);
INSERT INTO cc_depart VALUES(140,'3.12.2018',60,4,4);
INSERT INTO cc_depart VALUES(141,'17.12.2018',91,8,3);
INSERT INTO cc_depart VALUES(142,'3.6.2019',106,7,3);
INSERT INTO cc_depart VALUES(143,'24.12.2018',140,13,5);
INSERT INTO cc_depart VALUES(144,'18.3.2019',169,8,2);
INSERT INTO cc_depart VALUES(145,'21.1.2019',60,11,2);
INSERT INTO cc_depart VALUES(146,'6.5.2019',75,4,5);
INSERT INTO cc_depart VALUES(147,'10.6.2019',160,9,1);
INSERT INTO cc_depart VALUES(148,'13.5.2019',164,2,3);
INSERT INTO cc_depart VALUES(149,'19.8.2019',92,1,2);
INSERT INTO cc_depart VALUES(150,'24.12.2018',136,9,1);
INSERT INTO cc_depart VALUES(151,'24.12.2018',172,13,5);
INSERT INTO cc_depart VALUES(152,'19.8.2019',153,1,2);
INSERT INTO cc_depart VALUES(153,'28.1.2019',73,2,1);
INSERT INTO cc_depart VALUES(154,'10.6.2019',65,12,3);
INSERT INTO cc_depart VALUES(155,'1.4.2019',165,6,5);
INSERT INTO cc_depart VALUES(156,'10.6.2019',157,12,5);
INSERT INTO cc_depart VALUES(157,'10.6.2019',73,12,2);
INSERT INTO cc_depart VALUES(158,'10.12.2018',183,7,1);
INSERT INTO cc_depart VALUES(159,'1.7.2019',188,5,2);
INSERT INTO cc_depart VALUES(160,'24.12.2018',194,13,2);
INSERT INTO cc_depart VALUES(161,'19.8.2019',158,1,2);
INSERT INTO cc_depart VALUES(162,'22.4.2019',73,11,4);
INSERT INTO cc_depart VALUES(163,'10.6.2019',144,12,2);
INSERT INTO cc_depart VALUES(164,'28.1.2019',187,2,4);
INSERT INTO cc_depart VALUES(165,'24.12.2018',167,13,4);
INSERT INTO cc_depart VALUES(166,'25.2.2019',96,12,1);
INSERT INTO cc_depart VALUES(167,'22.4.2019',104,11,4);
INSERT INTO cc_depart VALUES(168,'22.4.2019',94,11,5);
INSERT INTO cc_depart VALUES(169,'24.12.2018',129,6,1);
INSERT INTO cc_depart VALUES(170,'18.3.2019',123,8,5);
INSERT INTO cc_depart VALUES(171,'6.5.2019',164,4,4);
INSERT INTO cc_depart VALUES(172,'13.5.2019',151,13,3);
INSERT INTO cc_depart VALUES(173,'24.12.2018',52,6,2);
INSERT INTO cc_depart VALUES(174,'25.2.2019',152,12,1);
INSERT INTO cc_depart VALUES(175,'24.12.2018',152,13,2);
INSERT INTO cc_depart VALUES(176,'13.5.2019',199,2,2);
INSERT INTO cc_depart VALUES(177,'21.1.2019',154,5,3);
INSERT INTO cc_depart VALUES(178,'28.1.2019',142,2,4);
INSERT INTO cc_depart VALUES(179,'24.12.2018',186,13,5);
INSERT INTO cc_depart VALUES(180,'13.5.2019',151,2,5);
INSERT INTO cc_depart VALUES(181,'4.3.2019',148,3,3);
INSERT INTO cc_depart VALUES(182,'17.12.2018',54,8,5);
INSERT INTO cc_depart VALUES(183,'24.12.2018',109,6,2);
INSERT INTO cc_depart VALUES(184,'3.12.2018',163,4,4);
INSERT INTO cc_depart VALUES(185,'1.4.2019',78,6,5);
INSERT INTO cc_depart VALUES(186,'10.12.2018',148,7,5);
INSERT INTO cc_depart VALUES(187,'28.1.2019',73,2,5);
INSERT INTO cc_depart VALUES(188,'28.1.2019',170,2,3);
INSERT INTO cc_depart VALUES(189,'3.6.2019',184,7,3);
INSERT INTO cc_depart VALUES(190,'24.12.2018',178,9,2);
INSERT INTO cc_depart VALUES(191,'18.3.2019',111,8,4);
INSERT INTO cc_depart VALUES(192,'21.1.2019',176,5,2);
INSERT INTO cc_depart VALUES(193,'4.3.2019',200,3,5);
INSERT INTO cc_depart VALUES(194,'15.4.2019',178,1,4);
INSERT INTO cc_depart VALUES(195,'18.3.2019',117,8,3);
INSERT INTO cc_depart VALUES(196,'22.4.2019',122,11,3);
INSERT INTO cc_depart VALUES(197,'25.2.2019',159,12,2);
INSERT INTO cc_depart VALUES(198,'24.12.2018',142,9,2);
INSERT INTO cc_depart VALUES(199,'13.5.2019',105,2,1);
INSERT INTO cc_depart VALUES(200,'18.3.2019',112,8,4);
COMMIT;                 
