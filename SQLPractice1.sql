/*CREATE TABLE job_applied (
    job_id INT,
    applilcation_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);*/

/*SELECT *
FROM job_applied
ORDER BY job_id;*/

--DROP TABLE job_applied;

--ALTER TABLE job_applied
--DROP COLUMN contact_name

--ALTER TABLE job_applied
--ALTER COLUMN contact_name TYPE TEXT;

--ALTER TABLE job_applied
--RENAME COLUMN contact TO contact_name;

/*UPDATE job_applied
SET contact = 'Prince Harry'
WHERE job_id = 3; */

--ALTER TABLE job_applied
--ADD contact VARCHAR(50);

/*INSERT INTO job_applied (
    job_id,
    applilcation_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
)
VALUES (
    1,
    '2025-06-26',
    true,
    '2025Resume.pdf',
    true,
    'coverLetter1.pdf',
    'sbumitted'
),
(
    2,
    '2025-06-26',
    TRUE,
    '2025Resume.pdf',
    true,
    'coverLetter1.pdf',
    'sbumitted'
),(
    3,
    '2025-06-26',
    TRUE,
    '2025Resume.pdf',
    true,
    'coverLetter1.pdf',
    'sbumitted'
),(
    4,
    '2025-06-26',
    TRUE,
    '2025Resume.pdf',
    true,
    'coverLetter1.pdf',
    'sbumitted'
),(
    5,
    '2025-06-26',
    TRUE,
    '2025Resume.pdf',
    true,
    'coverLetter1.pdf',
    'sbumitted'
),(
    6,
    '2025-06-26',
    TRUE,
    '2025Resume.pdf',
    true,
    'coverLetter1.pdf',
    'sbumitted'
); */