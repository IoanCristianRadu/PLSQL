SELECT p.denumire_produs,rc.cantitate , rc.pret , rc.cantitate * rc.pret AS Valoare
FROM produse p, rand_comenzi rc
WHERE p.id_produs = rc.id_produs

SELECT produse.denumire_produs, rand_comenzi.cantitate, rand_comenzi.pret,
rand_comenzi.cantitate * rand_comenzi.pret AS Valoare
FROM produse, rand_comenzi
WHERE produse.id_produs= rand_comenzi.id_produs;

SELECT UPPER(denumire_departament)
FROM departamente
WHERE id_locatie = 1700;

SELECT nume
FROM angajati
WHERE UPPER(nume) LIKE ('S%');

SELECT 'Produsul: ' || INITCAP(denumire_produs) || ' are pretul_minim ' || pret_min produs_pret_minim
FROM produse;

SELECT id_client, CONCAT(nume_client,sex), LENGTH(prenume_client), nivel_venituri FROM clienti 
WHERE SUBSTR(nivel_venituri,1,1)='F';

SELECT SUBSTR('MAMALIGA' , 2 , 3)
FROM dual;

SELECT ROUND(45.923 , 2), ROUND(45.923 , 0) FROM DUAL;
SELECT TRUNC(45.923 , 2), TRUNC(45.923,0) FROM DUAL;

SELECT  nr_comanda,data, ROUND(MONTHS_BETWEEN(sysdate , data)) , NEXT_DAY(data , 'FRIDAY'), ADD_MONTHS(data , 2)
FROM comenzi
ORDER BY MONTHS_BETWEEN(sysdate , data);

SELECT nr_comanda, data , MONTHS_BETWEEN(sysdate, data),round(MONTHS_BETWEEN(sysdate, data)) , TRUNC(MONTHS_BETWEEN(sysdate, data))
FROM comenzi 
WHERE round(MONTHS_BETWEEN(sysdate, data))=200;

SELECT TRUNC(20.89 , 0)
FROM dual;

SELECT nr_comanda, data, ROUND(data, 'MONTH') , ROUND(data , 'YEAR') 
FROM comenzi
WHERE data LIKE '%-00%'; 

SELECT nr_comanda, data, TO_CHAR(data, 'MM/YY') data_incheierii_comenzii 
FROM comenzi;

SELECT nr_comanda, data , EXTRACT(YEAR FROM data) ,EXTRACT(MONTH FROM data) , EXTRACT(DAY FROM data)  
FROM comenzi;

SELECT DATA
FROM comenzi
WHERE EXTRACT(MONTH from DATA) IN (7, 8);

Select comision , NVL(comision , 0) from angajati;

SELECT nume,comision, NVL(comision,0), NVL2(comision, 1, 0)
FROM angajati;

SELECT nume, length(nume), prenume, length(prenume), NULLIF(length(nume), length(prenume)) rezultat
FROM angajati;

SELECT AVG(rc.cantitate  *  rc.pret), MAX(rc.cantitate  *  rc.pret), MIN(rc.cantitate  *  rc.pret), sum(rc.cantitate  *  rc.pret) 
FROM rand_comenzi rc;

SELECT COUNT(*) nr_produse 
FROM produse 
WHERE pret_min>350;

SELECT COUNT (DISTINCT salariul) FROM angajati;

SELECT count(rowid) from comenzi;
SELECT COUNT(nr_comanda) nr_comenzi FROM comenzi;

SELECT id_produs, ROUND( AVG(cantitate) , 2) medie_produse 
FROM rand_comenzi
GROUP BY id_produs
ORDER BY medie_produse;

SELECT id_produs, round(AVG(cantitate) , 1)
FROM rand_comenzi
GROUP BY id_produs
HAVING AVG(cantitate) > 25;

SELECT comenzi.nr_comanda, SUM(rand_comenzi.cantitate  *  rand_comenzi.pret) total_comanda
FROM comenzi, rand_comenzi
WHERE rand_comenzi.nr_comanda=comenzi.nr_comanda
GROUP BY comenzi.nr_comanda
ORDER BY total_comanda ;

SELECT comenzi.nr_comanda, SUM(rand_comenzi.cantitate  *  rand_comenzi.pret) total_comanda
FROM comenzi, rand_comenzi
WHERE rand_comenzi.nr_comanda=comenzi.nr_comanda
GROUP BY comenzi.nr_comanda
HAVING SUM(rand_comenzi.cantitate  *  rand_comenzi.pret)  BETWEEN 1000 AND 3000  
ORDER BY total_comanda DESC;













