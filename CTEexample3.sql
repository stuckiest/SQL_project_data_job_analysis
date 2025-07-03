WITH first_quarter AS (SELECT *
FROM january_jobs

 UNION ALL

SELECT *
FROM february_jobs

UNION ALL

SELECT    *
FROM march_jobs )

SELECT
job_id,
job_title,
job_location,
salary_year_avg
FROM first_quarter
WHERE salary_year_avg >= 70000
ORDER BY salary_year_avg DESC