EXPLAIN PLAN
SET STATEMENT_ID = 'f1'
FOR SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='f1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run query 13;
set termout off;
set timing on query 13;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout on;
set timing off

/*prwto erwthma*/
DROP INDEX people_table;

EXPLAIN PLAN
SET STATEMENT_ID = 'f2'
FOR SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='f2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run query 14;
set termout off;
set timing on query 14;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout on;
set timing off

/*deutero erwthma*/
CREATE BITMAP INDEX bitmap_people ON people(birthYear);

EXPLAIN PLAN
SET STATEMENT_ID = 'f3'
FOR SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='f3' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run query 15;
set termout off;
set timing on query 15;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout on;
set timing off

