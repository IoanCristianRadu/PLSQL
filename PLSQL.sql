declare
m decimal;
n float;
begin
m:=100.20;
n:=100.20;
write(m || ' ' || n);
end;
/

DECLARE
v_salariul angajati.salariul%type;
cursor c is SELECT salariul FROM angajati;
BEGIN
for r in c loop
write(r.salariul);
end loop;
close c;
end;
/


VARIABLE n number

BEGIN
select count(*) into :n
from comenzi
where modalitate = 'online';
END;
/

PRINT n 
   -- afiseaza 32
begin
 :n:=:n+5;
 dbms_output.put_line('n='||:n);
  -- afiseaza n=37
 :n:=:n+5;
 dbms_output.put_line('n='||:n);
 -- afiseaza n=42
end;
/
PRINT n
  -- afiseaza 42
  
  
  -- se afiseaza salariul si prenumele angajatului cu numele Abel
VARIABLE g_salariul number
DEFINE s_nume=Abel
DECLARE 
v_prenume angajati.nume%type;
BEGIN
select prenume,salariul into v_prenume, :g_salariul
from angajati where nume='&s_nume'; 
DBMS_OUTPUT.PUT_LINE ('Prenumele angajatului este: '||v_prenume);
END;
/
print g_salariul


DECLARE
v_var1 NUMBER :=100; 
v_var2 NUMBER;
v_var3 NUMBER := v_var2;
v_var4 VARCHAR(20) := 'variabila PL/SQL';
v_var5 NUMBER NOT NULL := v_var1;
c_const1 CONSTANT DATE := TO_DATE('12/02/2007','dd/mm/yyyy');
c_const2 CONSTANT NUMBER NOT NULL := 2;
c_const3 CONSTANT NUMBER := NULL;
v_var6 NUMBER DEFAULT NULL;

BEGIN
DBMS_OUTPUT.PUT_LINE('variabila 1 = '||v_var1);
DBMS_OUTPUT.PUT_LINE('variabila 2 = '||v_var2);
DBMS_OUTPUT.PUT_LINE('variabila 3 = '||v_var3);
DBMS_OUTPUT.PUT_LINE('variabila 4 = '||v_var4);
DBMS_OUTPUT.PUT_LINE('variabila 5 = '||v_var5);
DBMS_OUTPUT.PUT_LINE('constanta 1 = '||c_const1);
DBMS_OUTPUT.PUT_LINE('constanta 2 = '||c_const2);
DBMS_OUTPUT.PUT_LINE('constanta 3 = '||c_const3);
DBMS_OUTPUT.PUT_LINE('variabila 6 = '||v_var6);
END;
/


DECLARE
var NUMBER;
BEGIN
var := 1;
DBMS_OUTPUT.PUT_LINE(var);

  <<bloc1>>
  DECLARE
  var NUMBER;
  BEGIN
  var :=2;
  DBMS_OUTPUT.PUT_LINE(var);
  END bloc1;

  DBMS_OUTPUT.PUT_LINE(var);

  <<bloc2>>
  DECLARE
  var NUMBER;
  BEGIN
  var :=3;
  DBMS_OUTPUT.PUT_LINE(var);

    <<bloc3>>
    DECLARE
    var NUMBER;
    BEGIN
    var :=4;
    DBMS_OUTPUT.PUT_LINE(var);
    DBMS_OUTPUT.PUT_LINE(bloc2.var);
    END bloc3;
  DBMS_OUTPUT.PUT_LINE(var);
  END bloc2;
DBMS_OUTPUT.PUT_LINE(var);
END;
/

DECLARE
stoc NUMBER(3):=600;
mesaj VARCHAR2(50):='Produsul 101';
BEGIN
  DECLARE
  stoc NUMBER(3):=10;
  mesaj VARCHAR2(50):='Produsul 102';
  um VARCHAR2(10):= ' bucati ';
  BEGIN
  stoc:= stoc+1;
  mesaj:='Stocul pentru '||mesaj||' este de: '||stoc||um;
  DBMS_OUTPUT.PUT_LINE(mesaj);
  END;
stoc:= stoc+100;
DBMS_OUTPUT.PUT_LINE(mesaj);
END;
/

VARIABLE rezultat NUMBER
DECLARE
BEGIN
:rezultat := (&v_nr3 + &v_nr4) / 3;
END;
/
print rezultat

ACCEPT p_sal PROMPT 'Introduce?i salariul:'
ACCEPT p_procent PROMPT 'Introduce?i procentul:'
DECLARE
v_sal number := &p_sal;
v_procent number := &p_procent;
BEGIN
write(v_sal + v_sal*v_procent/100);
END;
/

ACCEPT p_pret PROMPT 'Introduceti pretul'
DECLARE
v_pret number := &p_pret;
BEGIN
write(v_pret - v_pret*24/100);
END;
/

VARIABLE v_denumire VARCHAR2(20);
DEFINE v_descriere = 'Kakka'
DECLARE
v_id_produs produse.id_produs%type;
BEGIN
:v_denumire := 'Kappa';
SELECT MAX(id_produs) INTO v_id_produs FROM produse;
v_id_produs := v_id_produs + 10;
INSERT INTO produse VALUES(v_id_produs, :v_denumire , '&v_descriere',NULL,NULL,NULL);
END;
/

DECLARE
v_lista produse.pret_lista%type;
BEGIN
SELECT pret_lista into v_lista from produse where id_produs=&p;
dbms_output.put_line ('Pretul de lista initial este: '||v_lista);
IF v_lista < 500 THEN 
	v_lista:=2* v_lista;
ELSIF v_lista between 500 and 1000 THEN
	v_lista:=1.5 * v_lista;
ELSE 
	v_lista:=1.25* v_lista;
END IF;
dbms_output.put_line('Pretul final este: '||v_lista);
end;
/

select id_produs from produse;


DECLARE
v_comision angajati.comision%type;
BEGIN
SELECT comision INTO v_comision FROM angajati WHERE id_angajat = 100;
IF v_comision=0 THEN write(v_comision);
ELSIF v_comision <> 0 THEN write ('LOL');
ELSIF v_comision IS NULL THEN write('Kappa');
END IF;
END;
/

DECLARE
v_lista propduse.pret_lista%type;
BEGIN
SELECT pret_lista into v_lista from produse where id_produs=&p;
dbms_output.put_line ('Pretul de lista initial este: '||v_lista);

v_lista:= CASE WHEN v_lista < 500 THEN 2*v_lista
        WHEN v_lista between 500 and 1000 THEN 1.5*v_lista
        ELSE 1.25 * v_lista END;
write('Pretul final este: ' || v_lista);
END;
/

DECLARE
a NUMBER :=1;
BEGIN
LOOP 
write(a);
a:=a+1;
EXIT WHEN(a=10);
END LOOP;
END;
/


DECLARE
cursor c is SELECT id_angajat,salariul FROM angajati;
v_avg_sal NUMBER;
BEGIN
SELECT AVG(salariul) into v_avg_sal from angajati;
for r in c loop
IF r.id_angajat between 100 and 110 and r.salariul > v_avg_sal THEN write(r.id_angajat || ' ' || r.salariul);
END IF;
end loop;
END;
/

DECLARE
v_sal angajati.salariul%type;
v_salMediu v_sal%type;
i number(4):=100;
BEGIN
SELECT avg(salariul) into v_salmediu from angajati;
dbms_output.put_line('Salariul mediu este: '||v_salmediu);
loop
select salariul into v_sal from angajati where id_angajat=i;
dbms_output.put_line('Salariatul cu codul '||i||' are salariul: '||v_sal);
i:=i+1;
exit when v_sal<v_salmediu or i>110;
end loop;
end;
/

DECLARE
a NUMBER :=1;
BEGIN

WHILE a<10 LOOP
write(a);
a:=a+a;
END LOOP;
END;
/


BEGIN
FOR a IN a..z LOOP
write(a);
end loop;
end;
/

DECLARE
i NUMBER:=1;

a NUMBER:=10;
BEGIN
for k in 1..10 loop
a:=a-i;
EXIT WHEN(a<0);
write(a);
i:=i+k;
END LOOP;
END;
/

DECLARE
i NUMBER :=0;
j NUMBER :=0;
BEGIN
<<loop_extern>>
LOOP
  i:=i+1;
  j:=0;
  <<loop_intern>>
  LOOP
    j:=j+1;
    write(j);
    EXIT loop_extern WHEN i=3;
    EXIT WHEN j = 2;
  END LOOP;
END LOOP;
   
END;
/

DECLARE
TYPE tip_angajat IS RECORD(
v_id_angajat angajati.id_angajat%type,
v_nume angajati.nume%type);
r tip_angajat;
BEGIN
SELECT id_angajat,nume INTO r FROM angajati WHERE id_angajat=100;
write(r.v_id_angajat || ' ' || r.v_nume);
END;
/

DECLARE
--declarare tip
type num_table is table of produse.denumire_produs%type index by pls_integer;
-- declarare variabil? tablou
v_tab num_table;
i number(5):=2252;
BEGIN
--incarcarea in tablou:
loop
SELECT denumire_produs into v_tab(i) from produse where id_produs=i;
i:=i+1;
exit when i>2255;
end loop;
--extragerea din tablou
for i in v_tab.first..v_tab.last loop
IF v_tab.EXISTS(i) then
dbms_output.put_line('Nume produs: '|| v_tab(i));
end if;
end loop;
dbms_output.put_line('Total produse in tabloul indexat: '|| v_tab.count);
END;
/

SET SERVEROUTPUT ON
BEGIN
DELETE FROM produse p
WHERE categorie='hardware3' and not exists (select 1 from rand_comenzi r where p.id_produs=r.id_produs);
DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' randuri sterse');
ROLLBACK;
DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' randuri afectate');
END;
/

SELECT *
FROM rand_comenzi r, produse p
WHERE p.id_produs = r.id_produs AND p.categorie='hardware3';

ACCEPT g_rid PROMPT 'Introduceti id_ul regiunii:'
VARIABLE nr_sters VARCHAR2(100)
DECLARE

ACCEPT g_rid PROMPT 'Introduceti id-ul regiunii:'
VARIABLE nr_sters varchar2(100)
DECLARE
BEGIN
DELETE FROM regiuni WHERE id_regiune=&g_rid;
:nr_sters:=TO_CHAR(SQL%ROWCOUNT)||' INREGISTRARI STERSE';
END;
/
PRINT nr_sters
ROLLBACK;


DECLARE
CURSOR ang_cursor IS SELECT id_angajat,prenume FROM angajati;
v_id_angajat  angajati.id_angajat%type;
v_prenume angajati.prenume%type;
BEGIN
open ang_cursor;
fetch ang_cursor into v_id_angajat,v_prenume;
write(v_id_angajat);
write(v_prenume);
fetch ang_cursor into v_id_angajat,v_prenume;
write(v_id_angajat);
write(v_prenume);
END;
/

CREATE TABLE mesaje 
(cod varchar2(7),
nume varchar2(20)
);

DECLARE
cursor c is select * from angajati order by id_angajat;
r c%rowtype;
BEGIN
open c;
for i in 1..5 loop
  fetch c into r;
  INSERT INTO mesaje VALUES(r.id_angajat, r.nume);
end loop;
END;
/


DECLARE
cursor nr is SELECT nr_comanda FROM comenzi;
cursor c(comanda rand_comenzi.nr_comanda%type) IS 
        SELECT rc.id_produs, p.denumire_produs FROM produse p , rand_comenzi rc WHERE comanda = rc.nr_comanda AND rc.id_produs = p.id_produs;
BEGIN

for r in nr loop
  write('In comanda numarul ' || r.nr_comanda || ' au fost comandate urmatoarele produse: ');
  for r1 in c(r.nr_comanda) loop
    write(r1.id_produs || ' ' || r1.denumire_produs);
  end loop;
end loop;

END;
/


DECLARE
cursor c IS SELECT id_angajat FROM angajati;
cursor c1(v_id_angajat angajati.id_angajat%type) IS SELECT nr_comanda FROM comenzi WHERE id_angajat = v_id_angajat;
BEGIN

for r in c loop
  for r1 in c1(r.id_angajat) loop
    write(r.id_angajat || ' ' || r1.nr_comanda);
  end loop;
end loop;

END;
/

DECLARE
cursor c is SELECT rc.pret*rc.cantitate Valoare FROM comenzi c, rand_comenzi rc WHERE c.nr_comanda = rc.nr_comanda order by valoare desc;
i NUMBER :=0;
BEGIN
for r in c loop
  if i<3 then write(r.Valoare);
  end if;
  i:=i+1;
end loop;
END;
/

SELECT rc.pret*rc.cantitate Valoare FROM comenzi c, rand_comenzi rc WHERE c.nr_comanda = rc.nr_comanda order by valoare desc;

SELECT id_angajat FROM angajati;


DECLARE
v_nume VARCHAR2(20);

BEGIN
SELECT nume INTO v_nume 
FROM angajati
WHERE id_angajat=10;
dbms_output.put_line(v_nume);

EXCEPTION
WHEN  NO_DATA_FOUND THEN
dbms_output.put_line('Nu exista angajatul cu acest ID!');

END;
/


DECLARE
-- se asociaz? un nume codului de eroare ap?rut
INSERT_EXCEPT EXCEPTION;
PRAGMA EXCEPTION_INIT(INSERT_EXCEPT, -01400);
BEGIN
insert into departments (department_id, department_name) values (200, NULL);
EXCEPTION
--se trateaz? eroarea prin numele s?u
WHEN insert_except THEN
DBMS_OUTPUT.PUT_LINE('Nu ati precizat informatii suficiente pentru departament');
--se afi?eaz? mesajul erorii
DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/


CREATE TABLE erori 
(utilizator VARCHAR2(40), 
data DATE, 
cod_eroare NUMBER(10), 
mesaj_eroare VARCHAR2(255)
);

DECLARE
cod NUMBER;
mesaj VARCHAR2(255);
del_exception   EXCEPTION;
PRAGMA EXCEPTION_INIT(del_exception, -2292);

BEGIN
DELETE FROM produse;

EXCEPTION
WHEN del_exception THEN
dbms_output.put_line('Nu puteti sterge produsul');
dbms_output.put_line('Exista comenzi asignate lui');
cod:=SQLCODE;
mesaj:=SQLERRM;
INSERT INTO erori VALUES(USER, SYSDATE, cod, mesaj);

END;
/
SELECT * FROM erori;



DECLARE
e_exc1 EXCEPTION;

BEGIN
IF TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'))>=17 THEN
RAISE e_exc1;
END IF;

EXCEPTION
WHEN e_exc1 THEN
dbms_output.put_line('Este ora '||TO_CHAR(SYSDATE, 'HH24'));
dbms_output.put_line('Operatiune permisa doar '||' in timpul programului');
END;
/

DECLARE
exceptia_mea EXCEPTION;
BEGIN
if TO_NUMBER(&d) >50 THEN RAISE exceptia_mea;
end if;

EXCEPTION
WHEN exceptia_mea THEN write('Of doamne, ai scris un numar mai mare decat 50! Ce pacat!');
END;
/

DECLARE
invalid_prod EXCEPTION;

BEGIN
UPDATE produse 
SET denumire_produs='Laptop ABC'
WHERE id_produs=3;

IF SQL%NOTFOUND THEN
RAISE invalid_prod;
END IF;

EXCEPTION
WHEN invalid_prod THEN
DBMS_OUTPUT.PUT_LINE('Nu exista produsul cu acest ID');
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('A aparut o eroare! Nu se poate actualiza denumirea produsului!');
END;
/


DECLARE
numarPreaMare EXCEPTION;
a VARCHAR2(200);
PRAGMA EXCEPTION_INIT(numarPreaMare, -20100);
BEGIN

IF TO_NUMBER(&d) > 50 THEN RAISE_APPLICATION_ERROR(-20100, 'Numarul introdus este prea mare'); 
end if;

EXCEPTION
WHEN numarPreaMare THEN 
a:= SQLERRM;
write(a);

END;
/


CREATE OR REPLACE PROCEDURE modifica_salariul(
v_salariu_nou IN OUT angajati.salariul%type)
IS
a NUMBER:=5;
BEGIN
v_salariu_nou := v_salariu_nou + 100;
write(a);
END;
/

DECLARE
a angajati.salariul%type;
BEGIN
a:=10;
modifica_salariul(a);
write (a);
END;
/

CREATE OR REPLACE FUNCTION cauta_angajat(
v_id_angajat IN angajati.id_angajat%type)
RETURN BOOLEAN
IS
v_salariul angajati.salariul%type;
v_salariul_mediu angajati.salariul%type;
BEGIN
SELECT salariul INTO v_salariul FROM angajati WHERE id_angajat = v_id_angajat;
SELECT avg(salariul) into v_salariul_mediu FROM angajati;

IF (v_salariul > v_salariul_mediu) THEN RETURN TRUE;
ELSIF (v_salariul <= v_salariul_mediu) THEN RETURN FALSE;
ELSE RETURN NULL;
END IF;
END;
/

DECLARE

BEGIN
IF( cauta_angajat(100) ) IS NULL THEN write('E NULL BA');
elsif cauta_angajat(100) THEN write ('DA');
else write ('NU');
end if;
END;
/

CREATE OR REPLACE PACKAGE pachetul_meu IS
FUNCTION cauta_angajat(
v_id_angajat IN angajati.id_angajat%type)
RETURN BOOLEAN
END pachetul_meu;
/

CREATE OR REPLACE PACKAGE BODY pachetul_meu IS
FUNCTION cauta_angajat(
v_id_angajat IN angajati.id_angajat%type)
RETURN BOOLEAN
IS
v_salariul angajati.salariul%type;
v_salariul_mediu angajati.salariul%type;
BEGIN
SELECT salariul INTO v_salariul FROM angajati WHERE id_angajat = v_id_angajat;
SELECT avg(salariul) into v_salariul_mediu FROM angajati;

IF (v_salariul > v_salariul_mediu) THEN RETURN TRUE;
ELSIF (v_salariul <= v_salariul_mediu) THEN RETURN FALSE;
ELSE RETURN NULL;
END IF;
END;
END pachetul_meu;
/

CREATE OR REPLACE PACKAGE cepachet IS
PROCEDURE procedura_mea(numar NUMBER);

END;
/

CREATE OR REPLACE PACKAGE BODY cepachet IS
PROCEDURE procedura_mea(numar NUMBER) IS
BEGIN
write(TO_CHAR(numar));
END;

END;
/

call cepachet.procedura_mea(5);

CREATE OR REPLACE TRIGGER produse_trigger
BEFORE INSERT ON produse
BEGIN
write('Triggerul s-a executat');
END;
/

INSERT INTO produse VALUES(2333 , NULL,NULL,NULL,NULL,NULL);



CREATE OR REPLACE TRIGGER produse_trig_log 
BEFORE INSERT or UPDATE or DELETE on produse 
DECLARE 
BEGIN 
  case
  when INSERTING then WRITE('I');
  when UPDATING then WRITE('U');
  ELSE WRITE('D');
  END case;
  
END;
/
insert into produse (id_produs, denumire_produs) values (300, 'cafea');


CREATE OR REPLACE TRIGGER salariu_maxim 
BEFORE INSERT or UPDATE ON angajati
FOR EACH ROW
DECLARE
v_sal_max CONSTANT NUMBER(6) := 2000;
BEGIN
IF :new.salariul > v_sal_max THEN RAISE_APPLICATION_ERROR(-20200, 'Salariul este prea mare');
END IF;
END;
/

update angajati
set salariul =15000
where id_angajat=104;




CREATE OR REPLACE FUNCTION numarul_comenzilor(v_id_produs produse.id_produs%type) RETURN NUMBER
IS
cursor c is SELECT * from rand_comenzi where id_produs = v_id_produs;
suma NUMBER(10) :=0;
BEGIN
for r in c loop
  suma:= suma+r.cantitate;
end loop;
RETURN suma;
END;
/

SELECT numarul_comenzilor(1781) FROM DUAL;

CREATE OR REPLACE PROCEDURE procedura_test(v_categorie produse.categorie%type) IS
cursor c is SELECT * FROM produse WHERE categorie = v_categorie;
cursor c1 is SELECT * FROM produse WHERE categorie = v_categorie;
medie_categorie NUMBER(10):=0;
i NUMBER(2) :=0;
BEGIN

SELECT AVG(pret_lista) INTO medie_categorie FROM produse WHERE v_categorie = categorie;
for r in c loop
  if r.pret_lista > medie_categorie then 
  i:=i+1;
  end if;
end loop;


if i>5 THEN RAISE_APPLICATION_ERROR(-20200, 'Sunt mai mult decat 5 produse cu pretul lista peste media categioriei');
end if;

for r1 in c1 loop
  if r1.pret_lista > medie_categorie then write(r1.pret_lista);
  end if;
end loop;


END;
/

call procedura_test('software5');
call procedura_test('hardware3');

CREATE OR REPLACE TRIGGER trigger_test
BEFORE INSERT ON comenzi
BEGIN
IF TO_NUMBER(TO_CHAR(SYSDATE, 'HH')) =23  THEN RAISE_APPLICATION_ERROR(-20300, 'Nu este permis');
END IF;
END;
/



SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'HH'))FROM DUAL;
SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'MM'))FROM DUAL;

INSERT INTO comenzi VALUES (92382,SYSDATE,NULL,101,NULL,NULL);






CREATE OR REPLACE PACKAGE pachet_test IS

FUNCTION numarul_comenzilor(v_id_produs produse.id_produs%type) RETURN NUMBER;


END;

