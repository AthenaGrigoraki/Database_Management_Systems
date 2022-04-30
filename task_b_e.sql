EXPLAIN PLAN
SET STATEMENT_ID = 'd1'
FOR SELECT movieID, movieTitle
FROM movie
WHERE movieID != 0046778 and year > 1985;

EXPLAIN PLAN
SET STATEMENT_ID = 'd2'
FOR SELECT movieID, movieTitle
FROM movie
WHERE movieID = 0046778 and year > 1985;



set timing on;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='d1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='d2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

set timing off;


prompt run query 10;
set termout off;
timing start query 10;
select movieID, movieTitle
from movie
where movieID != 0046778 and year > 1985;
set termout on;
set timing off


prompt run query 11;
set termout off;
timing start query 11;
select movieID, movieTitle
from movie
where movieID = 0046778 and year > 1985;
set termout on;
set timing off

