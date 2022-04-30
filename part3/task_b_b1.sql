/* for task b*/

EXPLAIN PLAN
SET STATEMENT_ID = 'task_b_b1'
FOR SELECT movieTitle
FROM movie
WHERE year > 1990;

EXPLAIN PLAN
SET STATEMENT_ID = 'task_b_b2'
FOR SELECT personName
FROM people
WHERE birthYear > 1945;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_b_b1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;


SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_b_b2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;


prompt run task_b_b1;
set termout off;
set timing on task_b_b1;
SELECT movieTitle
FROM movie
WHERE year > 1990;
set termout on;
set timing off
/
prompt run task_b_b2;
set termout off;
set timing on task_b_b2;
SELECT personName
FROM people
WHERE birthYear > 1945;
set termout on;
set timing off
/

/*for task e*/

EXPLAIN PLAN
SET STATEMENT_ID = 'task_b_e1'
FOR SELECT movieID, movieTitle
FROM movie
WHERE movieID != 0046778 and year > 1985;

EXPLAIN PLAN
SET STATEMENT_ID = 'task_b_e2'
FOR SELECT movieID, movieTitle
FROM movie
WHERE movieID = 0046778 and year > 1985;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_b_e1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_b_e2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run task_b_e1;
set termout off;
set timing on task_b_e1;
SELECT movieID, movieTitle
FROM movie
WHERE movieID != 0046778 and year > 1985;
set termout on;
set timing off
/
prompt run task_b_e2;
set termout off;
set timing on task_b_e2;
SELECT movieID, movieTitle
FROM movie
WHERE movieID = 0046778 and year > 1985;
set termout on;
set timing off
/