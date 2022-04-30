set timing on;

EXPLAIN PLAN
SET STATEMENT_ID = 'b1'
FOR SELECT movieTitle
FROM movie
WHERE year > 1990;

EXPLAIN PLAN
SET STATEMENT_ID = 'b2'
FOR SELECT personName
FROM people
WHERE birthYear > 1945;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='b1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='b2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

set timing off;

prompt run query 6;
set termout off;
timing start query 6;
select movieTitle
from movie
where year > 1990;
set termout on;
timing stop;

prompt run query 7;
set termout off;
timing start query 7;
select personName
from people
where birthYear > 1945;
set termout on;
timing stop;

CREATE INDEX table_movie ON movie(year);
CREATE INDEX people_table ON people(birthYear);

set timing on;

EXPLAIN PLAN
SET STATEMENT_ID = 'c1'
FOR SELECT movieTitle
FROM movie
WHERE year > 1990;

EXPLAIN PLAN
SET STATEMENT_ID = 'c2'
FOR SELECT personName
FROM people
WHERE birthYear > 1945;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='c1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='c2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

set timing off;

prompt run query 8;
set termout off;
timing start query 8;
select movieTitle
from movie
where year > 1990;
set termout on;
timing stop;

prompt run query 9;
set termout off;
timing start query 9;
select personName
from people
where birthYear > 1945;
set termout on;
timing stop;




