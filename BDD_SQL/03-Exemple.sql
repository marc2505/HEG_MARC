/* ----------------------------------------------------------------------------
Script : 03-Exemple-LDD.sql                         Auteur : Christian Stettler
Objet  : Création des tables d'exemple, avec toutes les contraintes
---------------------------------------------------------------------------- */

-- Suppression des tables pour que le script soit réexecutable
-- ATTENTION : l'ordre de suppression est important !! (CONTRAINTES existantes)

DROP TABLE exe_employe;
DROP TABLE exe_dept;

-- Création des tables
-- ATTENTION : l'ordre de création est important !! (CONTRAINTES à créer)

CREATE TABLE exe_dept (
   dep_no       NUMBER(5)    CONSTRAINT pk_exe_dept PRIMARY KEY,
   dep_nom      VARCHAR2(20)
);

CREATE TABLE exe_employe (
   emp_no       NUMBER(5)    CONSTRAINT pk_exe_employe PRIMARY KEY,
   emp_prenom   VARCHAR2(20),
   emp_nom      VARCHAR2(20) CONSTRAINT nn_emp_nom     NOT NULL,
   emp_email    VARCHAR2(25) CONSTRAINT uk_emp_email   UNIQUE,
   emp_embauche DATE DEFAULT SYSDATE CONSTRAINT nn_emp_embauche NOT NULL,
   emp_salaire  NUMBER(8,2)  CONSTRAINT ch_emp_salaire CHECK (emp_salaire > 0),
   emp_emp_no   NUMBER(5)    CONSTRAINT fk_exe_employe_chef REFERENCES exe_employe (emp_no),
   emp_dep_no   NUMBER(5)    CONSTRAINT fk_exe_employe_dept REFERENCES exe_dept (dep_no)
);

-- Modification de tables : ajout/suppression  d'attributs, de contraintes

ALTER TABLE exe_dept ADD  (dep_lieu VARCHAR2(20));
ALTER TABLE exe_dept ADD  (CONSTRAINT uk_dep_nom UNIQUE (dep_nom));
ALTER TABLE exe_dept DROP (dep_lieu);
ALTER TABLE exe_employe DROP CONSTRAINT ch_emp_salaire;

ALTER TABLE exe_employe ADD (
   CONSTRAINT ch_emp_salaire    CHECK(emp_salaire >= 0),
   CONSTRAINT uk_emp_nom_prenom UNIQUE (emp_nom,emp_prenom)
);