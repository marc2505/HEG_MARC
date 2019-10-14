-- ||||||||||||||||||||||||||||||||||||||||||||||
--                    TP03
--                MARC BRUNET
-- ||||||||||||||||||||||||||||||||||||||||||||||

-- ======================
-- SUPPRESSION DES TABLES
-- ======================
DROP TABLE heg_participe;
DROP TABLE heg_personne;
DROP TABLE heg_soiree;
DROP TABLE heg_entreprise;


-- ===================
-- CREATION DES TABLES
-- ===================
CREATE TABLE heg_entreprise (

    ent_no NUMBER(5) PRIMARY KEY,
    ent_nom VARCHAR2(20) CONSTRAINT NN_ENT_NOM NOT NULL CONSTRAINT UK_ENT_NOM UNIQUE,
    ent_mail VARCHAR2(50),
    ent_ville VARCHAR2(20)
    
);

CREATE TABLE heg_soiree (

    soi_no NUMBER(5) PRIMARY KEY,
    soi_nom VARCHAR2(50) CONSTRAINT NN_SOI_NOM NOT NULL,
    soi_date DATE,
    soi_inscription DATE,
    soi_lieu VARCHAR2(25),
    soi_prix NUMBER(4,2) CONSTRAINT CH_SOI_PRIX CHECK (soi_prix > 0),
    CONSTRAINT uk_soi_nom_soi_date UNIQUE (soi_nom,soi_date),
    CONSTRAINT ck_soi_date_inscription CHECK (soi_inscription < soi_date)
);

CREATE TABLE heg_personne (

    per_no NUMBER(5) PRIMARY KEY,
    per_nom VARCHAR2(20) CONSTRAINT NN_PER_NOM NOT NULL,
    per_prenom VARCHAR2(20),
    per_sexe VARCHAR2(1) CONSTRAINT CH_PER_SEXE CHECK(per_sexe='F' OR per_sexe='M'),
    --                              CK_PER_SEXE CHECK(per_sexe IN ('F','M'),
    per_mail VARCHAR2(20),
    per_ent_no NUMBER(5) CONSTRAINT FK_PER_ENT REFERENCES heg_entreprise(ent_no),
    per_per_no NUMBER(5) CONSTRAINT FK_PER_PER REFERENCES heg_personne(per_no)

);

CREATE TABLE heg_participe (

    par_per_no NUMBER(5),
    par_soi_no NUMBER(5),
    CONSTRAINT PK_HEG_PARTICIPE PRIMARY KEY(par_per_no,par_soi_no)

);

ALTER TABLE heg_soiree MODIFY soi_lieu CONSTRAINT nn_soi_lieu NOT NULL;
ALTER TABLE heg_personne DROP CONSTRAINT NN_PER_NOM;
ALTER TABLE heg_personne MODIFY per_nom CONSTRAINT NN_PER_NOM NOT NULL;
ALTER TABLE heg_personne ADD per_taille NUMBER(1,3);
ALTER TABLE heg_personne MODIFY per_taille CONSTRAINT NN_PER_TAILLE NOT NULL;



