SELECT P.value as PHYSICAL_READS
FROM v$mystat P, v$statname N
WHERE N.name = 'physical reads'
AND P.statistic# = N.statistic#;

SELECT year, count(*)
FROM movie
GROUP BY year
ORDER BY year desc;

SELECT P.value as PHYSICAL_READS
FROM v$mystat P, v$statname N
WHERE N.name = 'physical reads'
AND P.statistic# = N.statistic#;

SELECT companyID, count(*)
FROM distributedBy
GROUP BY companyID;

SELECT P.value as PHYSICAL_READS
FROM v$mystat P, v$statname N
WHERE N.name = 'physical reads'
AND P.statistic# = N.statistic#;