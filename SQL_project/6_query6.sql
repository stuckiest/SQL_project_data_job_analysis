/* what are most optmal skills to learn?  Focus on high demand and 
high salary.*/

--Query 3
WITH skills_demand AS (
    SELECT
    skills_job_dim.skill_id,
    --skills_dim.skills,
    COUNT (skills_job_dim.skill_id) AS skill_counts
    
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
        WHERE job_postings_fact.job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
        GROUP BY skills_job_dim.skill_id
        --ORDER BY skill_counts DESC
    ) , average_salary_set AS (
    SELECT
    skills_job_dim.skill_id,
    -- skills_dim.skills,
    ROUND (AVG (salary_year_avg), 0) AS average_salary,
    COUNT (skills) AS skill_counts

    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
        WHERE job_postings_fact.job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
        GROUP BY skills_job_dim.skill_id
        --ORDER BY average_salary DESC
    )
SELECT
    skills_demand.skill_id,
    skills_dim.skills,
    skills_demand.skill_counts,
    average_salary
    FROM skills_demand
    INNER JOIN average_salary_set
    ON  skills_demand.skill_id = average_salary_set.skill_id
    INNER JOIN skills_dim
        ON skills_dim.skill_id = skills_demand.skill_id
    WHERE skills_demand.skill_counts > 25
    ORDER BY 
    average_salary DESC,
    skill_counts DESC
    
    ;
    