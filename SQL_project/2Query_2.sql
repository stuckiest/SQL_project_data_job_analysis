/* What skills are required for top paying 'Data Analyst' jobs?
-Use the top 10 jobs found in query 1 and determine which
specific skills are required for these jobs.*/

WITH top_paying_jobs AS (
    SELECT 
    name AS company_name,
    job_id,
    job_title_short,
    job_title,
    salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id

    WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim 
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
 -- joining the tables this way produces a new row
 --for each skill - each row has all the info from
 -- the job repeated, but the skill is unique in that row
ORDER BY salary_year_avg DESC;