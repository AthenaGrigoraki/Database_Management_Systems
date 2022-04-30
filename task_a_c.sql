CREATE INDEX movie_year_index ON movie(year);
CREATE INDEX birth_year_index ON people(birthYear);

EXPLAIN PLAN
SET STATEMENT_ID = 'task_a_c1'
FOR SELECT movieTitle
FROM movie
WHERE year > 1990;

EXPLAIN PLAN
SET STATEMENT_ID = 'task_a_c2'
FOR SELECT personName
FROM people
WHERE birthYear > 1945;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_a_c1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;


SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_a_c2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;


prompt run task_a_c1;
set termout off;
set timing on task_a_c1;
SELECT movieTitle
FROM movie
WHERE year > 1990;
set termout on;
set timing off
/
prompt run task_a_c2;
set termout off;
set timing on task_a_c2;
SELECT personName
FROM people
WHERE birthYear > 1945;
set termout on;
set timing off
/