VARIABLE rezultat NUMBER
DECLARE
BEGIN
:rezultat := (&v_nr3 + &v_nr4) / 3;
END;
/
print rezultat

LOOP
Secventa comenzi;
EXIT [WHEN cond];
END LOOP;

WHILE cond LOOP
Secventa comenzi 1;
Secventa comenzi 2;
EXIT [WHEN cond];
END LOOP;


FOR var IN [REVERSE] valmin..valmax LOOP
Secventa comenzi;
EXIT [WHEN cond];
END LOOP;

vrec_prod produse%rowtype;

type ang_table is table of angajati%rowtype index by pls_integer;
v_tab ang_table;

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


exceptie EXCEPTION;
PRAGMA EXCEPTION_INIT(exceptie, -20999);

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

exceptie EXCEPTION;
PRAGMA EXCEPTION_INIT(exceptie, -01400);
RAISE_APPLICATION_ERROR(-20100, 'Numarul introdus este prea mare'); 
SQLERRM
SQLCODE


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

CREATE OR REPLACE TRIGGER produse_trig_log 
BEFORE INSERT or UPDATE or DELETE on produse 
[FOR EACH ROW]
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


