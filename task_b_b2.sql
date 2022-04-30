CREATE UNIQUE INDEX title_btree ON movie(movieTitle);

EXPLAIN PLAN
SET STATEMENT_ID = 'task_b_2'
FOR SELECT m.movieID, m.movieTitle, p.companyID
FROM movie m, producedBy p
WHERE m.movieID = p.movieID and m.movieID = 0046799 and m.movieTitle = 'Boot Polish
(1954)';

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='task_b_2' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

prompt run query_task_b_2;
set termout off;
set timing on;
SELECT m.movieID, m.movieTitle, p.companyID
FROM movie m, producedBy p
WHERE m.movieID = p.movieID and m.movieID = 0046799 and m.movieTitle = 'Boot Polish
(1954)';
set termout on;
set timing off

DROP INDEX title_btree;