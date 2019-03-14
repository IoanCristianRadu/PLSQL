--Afisarea numelor angajatilor dintr-un anumit departament ales de noi, si suma salariilor subordonatilor fiecarui angajat din acel departament
declare
cursor c(p_id_departament angajati.id_departament%type) is select id_departament,nume,id_angajat from angajati where id_departament = p_id_departament;
cursor c1(p_id_angajat angajati.id_angajat%type) is SELECT id_angajat, nume, id_manager, salariul, LEVEL 
                                                    FROM angajati
                                                    CONNECT BY PRIOR id_angajat= id_manager
                                                    START WITH id_angajat = p_id_angajat;
suma_salariu angajati.salariul%type;
begin
for r in c(80) loop
  suma_salariu := 0;
  for r1 in c1(r.id_angajat) loop
    suma_salariu := suma_salariu + r1.salariul;
  end loop;
  dbms_output.put_line('Id:    ' || r.id_angajat || '    ' || ' Departament: ' || r.id_departament || '    ' || ' Nume: ' ||  r.nume || '    ' || ' Suma salariilor tuturor subordonatilor ' || suma_salariu);
end loop;
end;
/


--Demonstratie
SELECT id_angajat, nume, id_manager, salariul, LEVEL 
                                                    FROM angajati
                                                    CONNECT BY PRIOR id_angajat= id_manager
                                                    START WITH id_angajat = 159;