
/*WITH skill_counts AS (
    SELECT 
    COUNT (skill_id) AS times_skill_mentioned,
    --skill_id
    FROM skills_job_dim
    GROUP BY skill_id
    --ORDER BY times_skill_mentioned DESC)

SELECT  skill_counts.times_skill_mentioned, skill_counts.skill_id, skills_dim.skills
FROM skill_counts
LEFT JOIN skills_dim 
ON skill_counts.skill_id = skills_dim.skill_id*/


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

--but now I need to filter it by job title 'data analyst'