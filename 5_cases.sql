/*SELECT *
FROM (--SubQuery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ) AS janurary_jobs;
    --SubQuery ends here
*/

/*
CTE
WITH janurary_jobs AS(-- CTE definition starts here
    
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ) --CTE ENDS HERE

SELECT *
FROM janurary_jobs;

*/

/*
SUBQUERIES
SELECT name AS company_name
FROM company_dim
WHERE company_id IN(
    SELECT
        company_id
   
    FROM job_postings_fact
    WHERE job_no_degree_mention = true

)

*/


WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS total_jobs
FROM 
    job_postings_fact
GROUP BY
    company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs 
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC