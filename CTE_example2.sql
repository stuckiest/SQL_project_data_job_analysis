
/*Find the count of the number of remote jobs per skill.
DIsplay top 5 skills
include skill_id, skill name and count of postings that
mention that skill */

WITH remote_job_skills AS (
SELECT 
    skill_id,
    COUNT (skill_id) AS times_skill_mentioned
FROM skills_job_dim
INNER JOIN job_postings_fact
ON  skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_postings_fact.job_work_from_home = True AND job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skill_id
)
SELECT  remote_job_skills.times_skill_mentioned, remote_job_skills.skill_id, skills_dim.skills
FROM remote_job_skills
INNER JOIN skills_dim 
ON remote_job_skills.skill_id = skills_dim.skill_id
ORDER BY times_skill_mentioned DESC
LIMIT 5;