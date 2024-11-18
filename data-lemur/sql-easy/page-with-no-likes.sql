SELECT pages.page_id
FROM pages
LEFT OUTER JOIN page_likes AS likes
  ON pages.page_id = likes.page_id
WHERE likes.page_id IS NULL;

/**
Using the EXCEPT operator, we subtract the page IDs with likes from the initial set of all page IDs. The resulting query will give us the IDs of the Facebook pages that do not possess any likes.

SELECT page_id
FROM pages
EXCEPT
SELECT page_id
FROM page_likes;
**/

/**

SELECT page_id
FROM pages
WHERE NOT EXISTS (
  SELECT page_id
  FROM page_likes AS likes
  WHERE likes.page_id = pages.page_id
;)

**/

