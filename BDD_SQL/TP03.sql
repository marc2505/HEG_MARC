-- ||||||||||||||||||||||||||||||||||||||||||||||
--                    TP03
--                MARC BRUNET
-- ||||||||||||||||||||||||||||||||||||||||||||||

-- ======================
-- SUPPRESSION DES TABLES
-- ======================
DROP TABLE heg_participe;
DROP TABLE heg_soiree;
DROP TABLE heg_entreprise;
DROP TABLE heg_personne;

-- ===================
-- CREATION DES TABLES
-- ===================
CREATE TABLE heg_personne (

    per_no NUMBER(5) PRIMARY KEY,
    per_nom VARCHAR2(20) CONSTRAINT NN_PER_NOM NOT NULL,
    per_prenom VARCHAR2(20),
    per_sexe VARCHAR2(1) CONSTRAINT CH_PER_SEXE CHECK(per_sexe='F' OR per_sexe='M'),
    per_mail VARCHAR2(20),
    per_ent_no NUMBER(5) CONSTRAINT FK_PER_ENT REFERENCES heg_entreprise(ent_no),
    per_per_no NUMBER(5) CONSTRAINT FK_PER_PER REFERENCES heg_personne(per_no)

);

CREATE TABLE heg_entreprise (

    ent_no NUMBER(5) PRIMARY KEY,
    ent_nom VARCHAR2(20) CONSTRAINT NN_ENT_NOM NOT NULL CONSTRAINT UK_ENT_NOM UNIQUE,
    ent_mail VARCHAR2(20),
    ent_ville VARCHAR2(20)
    
);

CREATE TABLE heg_soiree (

    soi_no NUMBER(5) PRIMARY KEY,
    soi_nom VARCHAR2(25) CONSTRAINT NN_SOI_NOM NOT NULL CONSTRAINT UK_SOI_NOM UNIQUE,
    soi_date DATE CONSTRAINT UK_SOI_DATE UNIQUE,
    soi_inscription DATE CONSTRAINT CH_SOI_INSCRIPTION CHECK (soi_inscription < soi_date),
    soi_lieu VARCHAR2(25),
    soi_prix NUMBER(2,5) CONSTRAINT CH_SOI_PRIX CHECK (soi_prix > 0)

);

CREATE TABLE heg_participe (

    par_per_no NUMBER(5),
    par_soi_no NUMBER(5),
    CONSTRAINT PK_HEG_PARTICIPE PRIMARY KEY(par_per_no,par_soi_no)

);


