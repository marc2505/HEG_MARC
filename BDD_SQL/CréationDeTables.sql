CREATE TABLE exe_Voiture(
       voi_Id NUMBER(5),
       voi_Marque VARCHAR2(50),
       voi_AnneeConstruction NUMBER(4),
       voi_NbKm NUMBER(4)
       --CONSTRAINT PK_Voiture PRIMARY KEY (idVoiture)
);

COMMENT ON TABLE Voiture IS 'Voici un commentaire test ...';

CREATE TABLE Client(
       idClient NUMBER(5),
       nomClient VARCHAR2(50),
       prenomClient VARCHAR2(50),
       dateNaissanceClient DATE,
       adresseClient VARCHAR2(50),
       npaClient NUMBER(4),
       localiteClient VARCHAR2(50)
       --CONSTRAINT PK_Client PRIMARY KEY (idClient)
);

CREATE TABLE Llocation(
       idLlocation NUMBER(5),
       dateDebutLlocation DATE,
       dateFinLlocation DATE,
       dureeLlocation NUMBER(3)
       --CONSTRAINT PK_Llocation PRIMARY KEY (idLlocation)
);

CREATE TABLE Localite(
       idLocalite NUMBER(5),
       npaLocalite NUMBER(4),
       langueParleeLocalite VARCHAR2(50)
       --CONSTRAINT PK_Localite PRIMARY KEY (idLocalite)
);

CREATE TABLE Contrat (
       idContrat NUMBER(5),
       nomContrat VARCHAR2(50),
       descriptionContrat VARCHAR2(255)
       --CONSTRAINT PK_Contrat PRIMARY KEY (idContrat)
);


DROP TABLE Voiture;
DROP TABLE Client;
DROP TABLE Llocation;
DROP TABLE Localite;
DROP TABLE Contrat;























