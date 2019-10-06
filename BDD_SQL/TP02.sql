--  CREATE TABLE Testt(
--      idTestt NUMBER(5)
--  );
--  DROP TABLE Testt;

CREATE TABLE heg_personne (

    per_no NUMBER(5) PRIMARY KEY,
    per_nom VARCHAR2(20),
    per_prenom VARCHAR2(20),
    per_sexe VARCHAR2(1),
    per_mail VARCHAR2(20),
    per_ent_no NUMBER(5),
    per_per_no NUMBER(5)

);

CREATE TABLE heg_entreprise (

    ent_no NUMBER(5) PRIMARY KEY,
    ent_nom VARCHAR2(20),
    ent_mail VARCHAR2(20),
    ent_ville VARCHAR2(20)
    
);

CREATE TABLE heg_soiree (

    soi_no NUMBER(5) PRIMARY KEY,
    soi_nom VARCHAR2(25),
    soi_date DATE,
    soi_inscription DATE,
    soi_lieu VARCHAR2(25),
    soi_prix NUMBER(2,5)

);

CREATE TABLE heg_participe (

    par_per_no NUMBER(5),
    par_soi_no NUMBER(5),
    CONSTRAINT PK_HEG_PARTICIPE PRIMARY KEY(par_per_no,par_soi_no)

);


DROP TABLE heg_participe;
DROP TABLE heg_soiree;
DROP TABLE heg_entreprise;
DROP TABLE heg_personne;








