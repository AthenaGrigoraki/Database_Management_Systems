drop table people;

CREATE CLUSTER people_c (birthYear numeric(4));
CREATE INDEX people_c_in on cluster people_c;

create table people
(
	personID char(50) not null,
	personName char(50) not null,
	birthYear numeric(4),
	deathYear numeric(4)
) cluster people_c(birthYear);

EXPLAIN PLAN
SET STATEMENT_ID = 'g1'
FOR SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='g1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run query 16;
set termout off;
set timing on query 16;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout on;
set timing off