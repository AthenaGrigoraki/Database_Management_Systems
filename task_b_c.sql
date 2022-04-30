drop TABLE plays;

CREATE TABLE plays
(
	personID char(50) not null,
	movieID numeric(7) not null
)
CLUSTER movies_er_b(movieID)

EXPLAIN PLAN
SET STATEMENT_ID = 'z1'
FOR SELECT p.personID
FROM movie m, plays p
WHERE p.movieID = m.movieID and m.movieID = 0046790;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='z1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;


EXPLAIN PLAN
SET STATEMENT_ID = 'z2'
FOR SELECT DISTINCT p.personID
FROM movie m, plays p
WHERE p.movieID = m.movieID and m.movieID = 0046790;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='z2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run query 4;
set termout off;
timing start query 4;
select p.personID
from movie m, plays p
where p.movieID = m.movieID and m.movieID = 0046790;
set termout on;
timing stop;

prompt run query 5;
set termout off;
timing start query 5;
select distinct p.personID
from movie m, plays p
where p.movieID = m.movieID and m.movieID = 0046790;
set termout on;
timing stop;