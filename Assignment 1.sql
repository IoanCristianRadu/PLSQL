create table ang(id NUMBER(2));
INSERT INTO ang VALUES(1);
INSERT INTO ang VALUES(1);
INSERT INTO ang VALUES(2);
INSERT INTO ang VALUES(1);
INSERT INTO ang VALUES(3);
INSERT INTO ang VALUES(1);

SELECT * FROM ang;

rollback ang;
select id , max(rowid) from ang group by id;

SELECT id , rowid FROM ang;

SELECT COUNT(id) FROM ang WHERE id=1;


--Solutia corecta
declare
cursor c is select id, rowid from ang;
r c%rowtype;
begin
open c;
loop
fetch c into r;
exit when c%notfound;
DELETE ang WHERE ang.id = r.id AND rowid>any(select rowid from ang where ang.id = r.id);
end loop;

close c;

end;
/