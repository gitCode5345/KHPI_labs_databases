-- task one
SELECT 
    (SELECT name
    FROM regions 
    WHERE uuid = cities.region) AS region_name,
    SUM(cities.population) AS total_population
FROM cities
GROUP BY cities.region;

-- task two
SELECT 
    (SELECT name FROM regions WHERE uuid = cities.region) AS region_name,
    SUM(cities.population) AS total_population,
    COUNT(cities.id) AS city_count
FROM cities
GROUP BY cities.region
HAVING city_count >= 10;

-- task three
SELECT name, population
FROM cities
WHERE region IN (
    SELECT uuid
    FROM regions
    WHERE area_quantity >= 5
)
ORDER BY population DESC
LIMIT 5 OFFSET 10;

-- task four
SELECT 
    (SELECT name FROM regions WHERE uuid = cities.region) AS region_name,
    SUM(cities.population) AS total_population
FROM cities
WHERE cities.population >= 300000
GROUP BY cities.region;

-- task five
SELECT name AS city_name, 
       population
FROM cities
WHERE region IN (
    SELECT uuid 
    FROM regions 
    WHERE area_quantity <= 5
) 
AND population NOT BETWEEN 150000 AND 500000;
