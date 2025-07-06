SELECT *
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_postings_fact.job_title_short = 'Data Analyst'
    LIMIT 50;

/*WITH skill_mentions AS (
    SELECT
    skill_id,
    COUNT (skill_id) AS skill_counts
    FROM skills_job_dim
    GROUP BY skill_id
)
SELECT
    skill_mentions.skill_counts,
    skills_dim.skill_id,
    skills
    FROM skill_mentions
    LEFT JOIN skills_dim
    ON skill_mentions.skill_id = skills_dim.skill_id
    ORDER BY skill_counts DESC;*/

/*but now I need to filter it by job title 'data analyst'

SELECT 
job_title_short,
job_title,
job_location,
salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst';*/