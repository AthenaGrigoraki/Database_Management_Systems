
EXPLAIN PLAN
SET STATEMENT_ID = 'x1'
FOR SELECT p.personID
FROM movie m, plays p
WHERE p.movieID = m.movieID and m.movieID = 0046790;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='x1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;


EXPLAIN PLAN
SET STATEMENT_ID = 'x2'
FOR SELECT DISTINCT p.personID
FROM movie m, plays p
WHERE p.movieID = m.movieID and m.movieID = 0046790;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='x2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run query 1;
set termout off;
timing start query1;
select p.personID
from movie m, plays p
where p.movieID = m.movieID and m.movieID = 0046790;
set termout on;
timing stop;

prompt run query 2;
set termout off;
timing start query1;
select distinct p.personID
from movie m, plays p
where p.movieID = m.movieID and m.movieID = 0046790;
set termout on;
timing stop;



