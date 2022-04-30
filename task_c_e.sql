drop table people;

CREATE CLUSTER birth_year_clust (birthYear NUMBER(4,0));
create index index_c on cluster birth_year_clust;
create table people
(
	personID char(50) not null,
	personName char(50) not null,
	birthYear numeric(4),
	deathYear numeric(4)
) cluster birth_year_clust(birthYear);


ALTER SESSION SET OPTIMIZER_MODE = RULE;

EXPLAIN PLAN
SET STATEMENT_ID = 'task_c4_a_rule'
FOR SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_c4_a_rule' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run task_c4_a_rule;
set termout off;
set timing on task_c4_a_rule;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout on;
set timing off
/

/*-------------------------------------------------------------------*/
ALTER SESSION SET OPTIMIZER_MODE = FIRST_ROWS;

EXPLAIN PLAN
SET STATEMENT_ID = 'ask3_task3e_first_rows'
FOR SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='ask3_task3e_first_rows' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run query_task3e_first_rows;
set termout off;
set timing on query_task3e_first_rows;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout on;
set timing off
/

/*-------------------------------------------------------------------*/
ALTER SESSION SET OPTIMIZER_MODE = FIRST_ROWS;

EXPLAIN PLAN
SET STATEMENT_ID = 'task_c4_a_first_rows'
FOR SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_c4_a_first_rows' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run task_c4_a_first_rows;
set termout off;
set timing on task_c4_a_first_rows;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout off;
set timing off
/

/*------------------------------------------------------------------*/
ALTER SESSION SET OPTIMIZER_MODE = ALL_ROWS;

EXPLAIN PLAN
SET STATEMENT_ID = 'task_c4_a_all_rows'
FOR SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_c4_a_all_rows' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run task_c4_a_all_rows;
set termout off;
set timing on task_c4_a_all_rows;
SELECT /*+ ORDERED USE_HASH(p,pl) */ pl.movieID
FROM people p, plays pl
WHERE p.personID = pl.personID and p.birthYear > 1990;
set termout on;
set timing off
/
