-- ||||||||||||||
--  SCRIPT TP_07 
--  MARC BRUNET
-- ||||||||||||||

-- ||||
--  1)
-- ||||
SELECT * FROM HEG_PERSONNE;


-- ||||
--  2)
-- ||||
SELECT PER_NOM || ' ' || PER_PRENOM AS "Nom + prénom",'('||ROWNUM||')' AS "Num enregistrement" 
FROM heg_personne;


-- ||||
--  3)
-- ||||
SELECT PER_NOM || ' ' || PER_PRENOM AS "Nom + prénom" 
FROM heg_personne 
WHERE UPPER(PER_PRENOM) = 'ALAIN'; 


-- ||||
--  4)
-- ||||
SELECT * 
FROM heg_personne 
WHERE UPPER(PER_SEXE) = 'F' AND PER_ENT_NO = 3;


-- ||||
--  5)
-- ||||
SELECT PER_NOM || ' ' || PER_PRENOM AS "Nom + prénom" 
FROM heg_personne 
WHERE PER_NO IN (2,3,4,6,9,55);


-- ||||
--  6)
-- ||||
SELECT PER_NOM || ' ' || PER_PRENOM AS "Nom + prénom" 
FROM heg_personne 
WHERE Initcap(PER_PRENOM) = 'a';


-- ||||
--  7)
-- ||||
SELECT * 
FROM heg_personne 
WHERE PER_SEXE = 'F' AND PER_PER_NO IS NULL ORDER BY PER_NOM,PER_PRENOM;


-- ||||
--  8)
-- ||||
SELECT SOI_NOM,SOI_LIEU,SOI_DATE 
FROM heg_soiree 
WHERE SOI_DATE BETWEEN '01.11.2019' AND '30.11.2019';


-- ||||
--  9)
-- ||||
SELECT PER_NOM 
FROM heg_personne 
WHERE LOWER(PER_MAIL) NOT LIKE ('%@heg.ch') OR per_mail IS NULL;


-- ||||
--  10)
-- ||||
SELECT PER_NOM || ' ' || PER_PRENOM AS "Nom Complet" 
FROM heg_personne;


-- |||||
--  11)
-- |||||
SELECT 'Le '||TO_CHAR(SOI_DATE,'DD/MM/YY')||' a lieu à '||SOI_LIEU||' la '||SOI_NOM AS "Soirées" 
FROM heg_soiree;


-- |||||
--  12)
-- |||||
SELECT PER_NOM || ' ' || PER_PRENOM AS "Nom prénom" 
FROM heg_personne 
WHERE PER_ENT_NO IS NULL;


-- |||||
--  13)
-- |||||
SELECT PER_NOM || ' ' || PER_PRENOM AS "Nom prénom",ENT_NOM 
FROM heg_personne 
JOIN heg_entreprise ON per_ent_no = ent_no;

-- |||||
--  14)
-- |||||
SELECT * 
FROM heg_personne 
JOIN heg_entreprise ON per_ent_no = ent_no 
WHERE per_mail LIKE ('%.ch') AND per_ent_no IS NOT NULL;


-- |||||
--  15)
-- |||||
SELECT * 
FROM heg_personne 
LEFT JOIN heg_entreprise 
ON per_ent_no = ent_no;


-- |||||
--  16)
-- |||||
SELECT * 
FROM heg_entreprise 
LEFT JOIN heg_personne ON per_ent_no = ent_no;


-- |||||
--  17)
-- |||||
SELECT * 
FROM heg_personne 
WHERE per_per_no IS NOT NULL;


-- |||||
--  18)
-- |||||
SELECT u1.per_nom, u1.per_prenom, u1.per_sexe, u2.per_prenom, u2.per_nom, u2.per_sexe
FROM heg_personne u1
LEFT OUTER JOIN heg_personne u2 ON u2.per_per_no = u1.per_no
WHERE u1.per_per_no IS NOT NULL;

-- |||||
--  19)
-- |||||
SELECT DISTINCT per_nom||' '||per_prenom AS "Liste de participants" 
FROM heg_personne 
JOIN heg_participe ON per_no = par_per_no 
JOIN heg_soiree ON soi_no = par_soi_no;   


-- |||||
--  20)
-- |||||
SELECT DISTINCT per_nom||' '||per_prenom AS "Liste" 
FROM heg_personne 
JOIN heg_participe ON per_no = par_per_no 
JOIN heg_soiree ON soi_no = par_soi_no 
WHERE soi_nom LIKE ('Soirée IGS');


-- |||||
--  21)
-- |||||
SELECT DISTINCT per_nom||' '||per_prenom AS "Liste" 
FROM heg_personne 
WHERE NOT EXISTS(
  SELECT * FROM heg_participe WHERE heg_personne.per_no = heg_participe.par_per_no
);
