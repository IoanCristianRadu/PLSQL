--functie care returneaza numarul de angajati din fiecare departament
-- functia o apelam intr-o procedura care afiseaza departamentele al caror numar de angajati este mai mare ca o anumita valoare primita ca parametru
--le punem intr-un packet

CREATE OR REPLACE FUNCTION nr_angajati(p_id_departament angajati.id_departament%type)
RETURN NUMBER
IS
--cursor c is  SELECT id_departament
--             FROM angajati
--             GROUP BY id_departament;
a NUMBER(10);
BEGIN
SELECT count(*) INTO a FROM angajati WHERE id_departament = p_id_departament;
return a;
END;
/

SELECT nr_angajati(90) from dual;

CREATE OR REPLACE PROCEDURE afisare_departamente(valoare angajati.id_departament%type)
IS
cursor c is  SELECT id_departament
             FROM angajati
             GROUP BY id_departament;
a NUMBER;
BEGIN
for r in c loop
  SELECT nr_angajati(r.id_departament) INTO a FROM DUAL;
  IF a>=valoare THEN
    dbms_output.put_line('Departamentul ' || r.id_departament || ' are ' || a || ' angajati');
  END IF;
end loop;
close c;
END;
/

call afisare_departamente(5);

CREATE PACKAGE tema AS
FUNCTION nr_angajati(p_id_departament angajati.id_departament%type)
RETURN NUMBER;
PROCEDURE afisare_departamente(valoare angajati.id_departament%type);
END tema;
/

CREATE OR REPLACE PACKAGE BODY tema AS
FUNCTION nr_angajati(p_id_departament angajati.id_departament%type)
RETURN NUMBER
IS
--cursor c is  SELECT id_departament
--             FROM angajati
--             GROUP BY id_departament;
a NUMBER(10);
BEGIN
SELECT count(*) INTO a FROM angajati WHERE id_departament = p_id_departament;
RETURN a;
END;

PROCEDURE afisare_departamente(valoare angajati.id_departament%type)
IS
cursor c is  SELECT id_departament
             FROM angajati
             GROUP BY id_departament;
a NUMBER;
BEGIN
for r in c loop
  SELECT tema.nr_angajati(r.id_departament) INTO a FROM DUAL;
  IF a>=valoare THEN
    dbms_output.put_line('Departamentul ' || r.id_departament || ' are ' || a || ' angajati');
  END IF;
end loop;
END;

END;
/

execute tema.afisare_departamente(5);

set serveroutput on;

SELECT count(*) FROM angajati WHERE id_departament = 90;

SELECT id_departament
FROM angajati
GROUP BY id_departament;