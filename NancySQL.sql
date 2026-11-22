SELECT * FROM Top200RichestPersonintheWorld LIMIT 5;
DROP TABLE IF EXISTS billionaires;
CREATE TABLE billionaires AS
SELECT
    CAST(Rank AS INTEGER) AS rank,
    TRIM(Name) AS name,
    CAST(Age AS INTEGER) AS age,
    TRIM(Country) AS country,
    CAST(REPLACE(REPLACE(TRIM(Networth), '$', ''), ' B', '') AS REAL) AS networth,
    TRIM(Industry) AS industry
FROM Top200RichestPersonintheWorld;
SELECT typeof(networth) AS type, COUNT(*) AS rows_, MAX(networth) AS max_networth
FROM billionaires;
--1. Retrieve the 20 richest billionaires.
SELECT rank, name, age, country, networth, industry
FROM billionaires
ORDER BY networth DESC
LIMIT 20;
--2. Identify the five youngest billionaires.
SELECT rank, name, age, country, networth, industry
FROM billionaires
ORDER BY age ASC, networth DESC
LIMIT 5;
--3. Calculate the average age and average net worth.
SELECT
    ROUND(AVG(age), 2) AS average_age,
    ROUND(AVG(networth), 2) AS average_networth_billion
FROM billionaires;
--4. Identify the five most represented countries.
SELECT country, COUNT(*) AS billionaire_count
FROM billionaires
GROUP BY country
ORDER BY billionaire_count DESC
LIMIT 5;
--5. Calculate the combined net worth of billionaires from each country.
SELECT
    country,
    COUNT(*) AS billionaire_count,
    ROUND(SUM(networth), 1) AS total_networth_billion
FROM billionaires
GROUP BY country
ORDER BY total_networth_billion DESC;
--6. Identify the five industries with the highest number of billionaires.
SELECT industry, COUNT(*) AS billionaire_count
FROM billionaires
GROUP BY industry
ORDER BY billionaire_count DESC
LIMIT 5;
--7. Find countries with at least five billionaires.
SELECT country, COUNT(*) AS billionaire_count
FROM billionaires
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY billionaire_count DESC;
--8. Calculate the total wealth of billionaires younger than 50.
SELECT
    COUNT(*) AS under_50_count,
    ROUND(SUM(networth), 1) AS total_wealth_billion
FROM billionaires
WHERE age < 50;
--9. Identify billionaires whose net worth exceeds the overall average net worth.
SELECT rank, name, country, industry, networth
FROM billionaires
WHERE networth > (SELECT AVG(networth) FROM billionaires)
ORDER BY networth DESC;
--10.Identify the industry with the highest average net worth.
SELECT
    industry,
    COUNT(*) AS billionaire_count,
    ROUND(AVG(networth), 2) AS avg_networth_billion
FROM billionaires
GROUP BY industry
ORDER BY avg_networth_billion DESC
LIMIT 1;
--11.Identify the industry with the highest average net worth.with at least 5 billionaires per industry
SELECT
    industry,
    COUNT(*) AS billionaire_count,
    ROUND(AVG(networth), 2) AS avg_networth_billion
FROM billionaires
GROUP BY industry
HAVING COUNT(*) >= 5
ORDER BY avg_networth_billion DESC
LIMIT 1;