/* This query finds the skills that are mentioned most often
in job postings and orders them by most mentioned to least mentioned.
Then it matches the skill_id with the skill name using a join. */ 

WITH skill_counts AS (SELECT COUNT (skill_id) AS times_skill_mentioned, skill_id
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY times_skill_mentioned DESC)

SELECT  skill_counts.times_skill_mentioned, skill_counts.skill_id, skills_dim.skills
FROM skill_counts
LEFT JOIN skills_dim 
ON skill_counts.skill_id = skills_dim.skill_id



/*(   SELECT COUNT (skill_id) AS molly, skill_id
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY molly DESC
    )*/