/* Question 1 - What are the top-paying data analyst jobs?
1. Find the 10 highest paying, remote Data Analyst
jobs
hint - focus on postings w/specified salaries
 - remove nulls*/

SELECT 
company_dim.company_id,
name AS company_name,
job_id,
job_title_short,
job_title,
job_location,
salary_year_avg
FROM job_postings_fact
LEFT JOIN company_dim
ON job_postings_fact.company_id = company_dim.company_id

WHERE job_title_short = 'Data Analyst'
AND job_location = 'Anywhere'
AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;