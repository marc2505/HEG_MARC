-- CC HALLOWEEN 
-- MARC

-- SELECTION DES TABLES
SELECT * FROM cc_achete;
SELECT * FROM cc_personne;
SELECT * FROM cc_produit;
SELECT * FROM cc_type;
SELECT * FROM cc_tarif;

-- CREATION DE LA TABLE TARIF
CREATE TABLE cc_tarif (
       tar_no NUMBER(5) PRIMARY KEY,
       tar_nom VARCHAR2(50)
);

-- INSERTION DE TROIS LIGNES DANS LA TABLE CC_TARIF
INSERT INTO cc_tarif VALUES (1,'Normal');
INSERT INTO cc_tarif VALUES (2,'Réduit');
INSERT INTO cc_tarif VALUES (3,'Déguisé');

-- AJOUT DE LA CLÉ ÉTRANGÈRE DU TARIF DANS LA TABLE CC_PERSONNE
ALTER TABLE cc_personne ADD per_tar_no NUMBER(5) DEFAULT 1 CONSTRAINT fk_per_tar REFERENCES cc_personne(per_no);

-- MODIFICATION DE DONNEES DANS LA TABLE CC_PERSONNE
UPDATE cc_personne
SET per_tar_no = 2
WHERE per_categorie IN ('Etudiant','Jeune');

-- CREATION DE LA TABLE CC_RABAIS
CREATE TABLE cc_rabais (
       rab_tar_no NUMBER(5) CONSTRAINT fk_tarif REFERENCES cc_tarif(tar_no),
       rab_typ_no NUMBER(5) CONSTRAINT fk_type REFERENCES cc_type(typ_no),
       rab_pourcentage NUMBER(2) CONSTRAINT nn_rab_pour NOT NULL CONSTRAINT ck_rab_pour CHECK (rab_pourcentage > 10 AND rab_pourcentage < 60),
       CONSTRAINT pk_rabais PRIMARY KEY (rab_tar_no,rab_typ_no)
);

ALTER TABLE cc_achete MODIFY ach_nombre DEFAULT 1;

UPDATE cc_achete
SET ach_nombre = 1
WHERE ach_nombre = NULL;

COMMIT;

ALTER TABLE cc_achete MODIFY ach_nombre CONSTRAINT nn_ach_nbr NOT NULL CONSTRAINT ck_ach_nbr CHECK (ach_nombre > 0);

ADD CONSTRAINT nn_ach_nbr NOT NULL (ach_nombre);

CONSTRAINT ck_ach_nbr CHECK (ach_nombre > 0)









