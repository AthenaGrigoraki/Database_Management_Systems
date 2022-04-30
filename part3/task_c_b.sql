drop index birth_year_index;

ALTER SESSION SET OPTIMIZER_MODE = RULE;
EXPLAIN PLAN
SET STATEMENT_ID = 'task_c2_a_rule'
FOR SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_c2_a_rule' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run task_c2_a_rule;
set termout off;
set timing on task_c2_a_rule;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout off;
set timing off
/

/*-------------------------------------------------------------------*/
ALTER SESSION SET OPTIMIZER_MODE = FIRST_ROWS;

EXPLAIN PLAN
SET STATEMENT_ID = 'task_c2_a_first_rows'
FOR SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_c2_a_first_rows' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run task_c2_a_first_rows;
set termout off;
set timing on task_c2_a_first_rows;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout off;
set timing off
/

/*------------------------------------------------------------------*/
ALTER SESSION SET OPTIMIZER_MODE = ALL_ROWS;

EXPLAIN PLAN
SET STATEMENT_ID = 'task_c2_a_all_rows'
FOR SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_c2_a_all_rows' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run task_c2_a_all_rows;
set termout off;
set timing on task_c2_a_all_rows;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout on;
set timing off
/
