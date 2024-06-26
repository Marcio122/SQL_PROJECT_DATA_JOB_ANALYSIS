
SELECT

    quarter1_jobs_postings.job_title_short,
    quarter1_jobs_postings.job_location,
    quarter1_jobs_postings.job_via,
    quarter1_jobs_postings.job_posted_date::date,
    quarter1_jobs_postings.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs

    UNION ALL

    SELECT *
    FROM february_jobs

    UNION ALL
    SELECT *
    FROM march_jobs

) AS quarter1_jobs_postings

WHERE
    quarter1_jobs_postings.salary_year_avg > 70000 AND
    quarter1_jobs_postings.job_title_short = 'Data Analyst'
ORDER BY quarter1_jobs_postings.salary_year_avg DESC