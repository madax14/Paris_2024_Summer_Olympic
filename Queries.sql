# How many athletes participated of the olympics
SELECT
COUNT(DISTINCT code)
FROM
  `paris-2024-summer-olympic.2024_Olympic.Athletes`

# Medals per country
SELECT
country_code,
COUNT(CASE WHEN `medal_type` = "Gold Medal" THEN 1 END) AS `Gold`,
COUNT(CASE WHEN `medal_type` = "Silver Medal" THEN 1 END) AS `Silver`,
COUNT(CASE WHEN `medal_type` = "Bronze Medal" THEN 1 END) AS `Bronze`,
COUNT(medal_type) `Medals`
FROM
  `paris-2024-summer-olympic.2024_Olympic.Medals`
GROUP BY country_code
ORDER BY `Medals` DESC 

#Percentage gender winners
SELECT
gender,
ROUND((COUNT(medal_type) / (SELECT COUNT(*) FROM `2024_Olympic.Medals`)*100),2) AS `percentage`
FROM `2024_Olympic.Medals`
GROUP BY gender
ORDER BY percentage DESC+

#String to Integer
UPDATE
  `paris-2024-summer-olympic.2024_Olympic.Medals`
SET code = CAST(code AS INT64)
