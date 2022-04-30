CREATE UNIQUE INDEX new_index ON movie(movieTitle);

EXPLAIN PLAN
SET STATEMENT_ID = 'e1'
FOR SELECT m.movieID, m.movieTitle, p.companyID 
FROM movie m, producedBy p
WHERE m.movieID = p.movieID and m.movieID = 0046799 and
m.movieTitle = 'Boot Polish (1954)';

set timing on;

SELECT ID||' '||PARENT_ID||' '||LPAD(' ', 2*(LEVEL-1))||OPERATION||'
'||OPTIONS||' '||OBJECT_NAME "QUERY PLAN" FROM PLAN_TABLE WHERE
STATEMENT_ID='e1' START WITH ID = 0 CONNECT BY PRIOR
ID=PARENT_ID;

set timing off


prompt run query 12;
set termout off;
timing start query 12;
select m.movieID, m.movieTitle, p.companyID 
from movie m, producedBy p
where m.movieID = p.movieID and m.movieID = 0046799 and
m.movieTitle = 'Boot Polish (1954)';
set termout on;
set timing off