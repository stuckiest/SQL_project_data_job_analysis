/* What are the top skills based on salary?
 -- What is the average salary associated with each skill for Data Analyst positions
 -- only look at 'Data Analyst' roles with specified salaries - regarless of location*/

 SELECT
ROUND (AVG (salary_year_avg), 0) AS average_salary,
COUNT (skills) AS skill_counts,
skills
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_postings_fact.job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    --AND job_work_from_home = TRUE
    GROUP BY skills
    --ORDER BY average_salary DESC; 
    ORDER BY skill_counts DESC;