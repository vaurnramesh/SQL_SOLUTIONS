-- Step 1: Identify companies with duplicate job posting
-- SELECT company_id,
--   title,
--   description,
--   COUNT(job_id) AS job_count
-- FROM job_listings
-- GROUP BY company_id, title, description
--Step 2: Use a CTE to filter the duplicate companies
WITH
    job_count_cte AS (
        SELECT
            company_id,
            title,
            description,
            COUNT(job_id) AS job_count
        FROM
            job_listings
        GROUP BY
            company_id,
            title,
            description
    )
SELECT
    COUNT(company_id) AS duplicate_companies
FROM
    job_count_cte
WHERE
    job_count > 1