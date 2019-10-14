-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                              SUPPRESSION DES TABLES
-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
DROP TABLE exe_dept;
DROP TABLE exe_employe;

-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                              CRÉATION DES TABLES
-- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
CREATE TABLE exe_dept(

    dep_no NUMBER(5) CONSTRAINT pk_exe_dept PRIMARY KEY,
    dep_nom VARCHAR2(50) CONSTRAINT nn_dep_nom NOT NULL
--  dep_emp_no NUMBER(5) CONSTRAINT fk_exe_dept_employe REFERENCES exe_employe(emp_no)

);

CREATE TABLE exe_employe(

    emp_no NUMBER(5) CONSTRAINT pk_exe_employe PRIMARY KEY,
    emp_prenom VARCHAR2(20) CONSTRAINT nn_emp_prenom NOT NULL,
    emp_nom VARCHAR2(50) CONSTRAINT nn_emp_nom NOT NULL,
    emp_email VARCHAR2(50),
    emp_embauche DATE,
    emp_salaire NUMBER(8,2) CONSTRAINT nn_emp_salaire NOT NULL,
--  emp_emp_no NUMBER(5) CONSTRAINT fk_exe_employe_employe REFERENCES exe_employe(emp_no),
--  emp_dep_no NUMBER(5) CONSTRAINT fk_exe_dept_employe REFERENCES exe_dept(dep_no),
    CONSTRAINT uk_emp_nom_prenom UNIQUE(emp_prenom,emp_nom)
--  CONSTRAINT nomDeLaContrainte Type_De_Contrainte (listeDesChamps)
);

ALTER TABLE exe_dept ADD dep_emp_no NUMBER(5) CONSTRAINT fk_exe_dept_emp REFERENCES exe_employe(emp_no);

-- ALTER TABLE exe_dept ADD (dep_emp_no NUMBER(5) CONSTRAINT fk_exe_dept_employe REFERENCES exe_employe(emp_no);

-- ce qui est en dessous est faux ...
ALTER TABLE exe_dept DROP CONSTRAINT nn_dep_nom;

COMMIT;
ROLLBACK;
SELECT * FROM EXE_DEPT;
