-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                            TP VOYAGES MARC
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

-- SELECTION DES TABLES
SELECT * FROM CC_VOYAGEUR;
SELECT * FROM CC_DEPART;
SELECT * FROM CC_DESTINATION;
SELECT * FROM CC_PACKAGE;

SELECT COUNT(DEP_DES_NO) 
FROM CC_DEPART 
WHERE DEP_DES_NO = 12; --20 PERSONNES

SELECT * 
FROM CC_DEPART 
WHERE DEP_DES_NO = 12;
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--      1) Liste des destinations les plus profitables (CA >= 100000)
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

SELECT 
DES_NOM||' - Où '||COUNT(DEP_VOY_NO)||' voyageurs ont généré un encaissement de : ' "Destinations merveilleuses"
FROM CC_DESTINATION
JOIN CC_DEPART ON DES_NO = DEP_DES_NO
JOIN CC_PACKAGE ON DEP_PAC_NO = PAC_NO
GROUP BY DES_NOM;


-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--                  2) Marketing, par tranche d'âge
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

SELECT 
CASE 
  WHEN MONTHS_BETWEEN(SYSDATE,VOY_DDN) <= 25 * 12 THEN 'A) Moins de 25'
  WHEN MONTHS_BETWEEN(SYSDATE,VOY_DDN) > 55 * 12 THEN 'C) 55+'
  ELSE 'B) 26-55'
END "Public cible",
COUNT(DEP_VOY_NO) "Nombre de voyageur",
COUNT(VOY_VOY_NO) "dont x en couple"
FROM CC_VOYAGEUR
JOIN CC_DEPART ON VOY_NO = DEP_VOY_NO
GROUP BY 
CASE 
  WHEN MONTHS_BETWEEN(SYSDATE,VOY_DDN) <= 25 * 12 THEN 'A) Moins de 25'
  WHEN MONTHS_BETWEEN(SYSDATE,VOY_DDN) > 55 * 12 THEN 'C) 55+'
  ELSE 'B) 26-55'
END
ORDER BY 
CASE 
  WHEN MONTHS_BETWEEN(SYSDATE,VOY_DDN) <= 25 * 12 THEN 'A) Moins de 25'
  WHEN MONTHS_BETWEEN(SYSDATE,VOY_DDN) > 55 * 12 THEN 'C) 55+'
  ELSE 'B) 26-55'
END;


-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
--               3) Les couples partent-ils aussi en voyage ?
-- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||







