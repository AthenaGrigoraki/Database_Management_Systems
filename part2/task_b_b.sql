CREATE CLUSTER movies_er_b (movieID NUMBER(7,0)) HASHKEYS 1000;

CREATE TABLE movie
(
	movieID numeric(7) not null,
	movieTitle char(110) not null,                                                                    
	color char(45),
	language char(20),
	year numeric(4)
)
CLUSTER movies_er_b(movieID);

EXPLAIN PLAN
SET STATEMENT_ID = 'y1'
FOR SELECT p.personID
FROM movie m, plays p
WHERE p.movieID = m.movieID and m.movieID = 0046790;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='y1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;


EXPLAIN PLAN
SET STATEMENT_ID = 'y2'
FOR SELECT DISTINCT p.personID
FROM movie m, plays p
WHERE p.movieID = m.movieID and m.movieID = 0046790;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='y2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run query 3;
set termout off;
timing start query 3;
select p.personID
from movie m, plays p
where p.movieID = m.movieID and m.movieID = 0046790;
set termout on;
timing stop;

prompt run query 4;
set termout off;
timing start query 4;
select distinct p.personID
from movie m, plays p
where p.movieID = m.movieID and m.movieID = 0046790;
set termout on;
timing stop;