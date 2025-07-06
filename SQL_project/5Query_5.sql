/*Finds the skills counts for all skills and all job postings
orders them from most mentioned skills to least mentioned skills
shows skill name, skill counts and skill_id*/

WITH skill_mentions AS (
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
    ORDER BY skill_counts DESC;