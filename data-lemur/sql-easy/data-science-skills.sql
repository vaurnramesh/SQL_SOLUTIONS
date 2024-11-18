SELECT candidate_id
FROM candidates
WHERE skill IN ('Python' , 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) > 2
ORDER BY candidate_id

/**
Output
candidate_id
123
**/