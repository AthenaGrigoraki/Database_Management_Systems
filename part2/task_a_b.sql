SELECT P1.value AS DB_BLOCK_GETS, P2.value AS
CONSISTENT_GETS, P3.value AS PHYSICAL_READS
FROM v$mystat P1, v$statname N1, v$mystat P2,
v$statname N2, v$mystat P3, v$statname N3
WHERE N1.name = 'db block gets'
AND P1.statistic# = N1.statistic#
AND N2.name = 'consistent gets'
AND P2.statistic# = N2.statistic#
AND N3.name = 'physical reads'
AND P3.statistic# = N3.statistic#;

SELECT year, count(*)
FROM movie
GROUP BY year
ORDER BY year desc;

SELECT companyID, count(*)
FROM distributedBy
GROUP BY companyID;

SELECT P1.value AS DB_BLOCK_GETS, P2.value AS
CONSISTENT_GETS, P3.value AS PHYSICAL_READS
FROM v$mystat P1, v$statname N1, v$mystat P2,
v$statname N2, v$mystat P3, v$statname N3
WHERE N1.name = 'db block gets'
AND P1.statistic# = N1.statistic#
AND N2.name = 'consistent gets'
AND P2.statistic# = N2.statistic#
AND N3.name = 'physical reads'
AND P3.statistic# = N3.statistic#;