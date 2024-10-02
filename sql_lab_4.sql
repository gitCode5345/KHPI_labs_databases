-- task one
SELECT id, UPPER(name) AS city_name_upper
FROM cities
ORDER BY name ASC
LIMIT 5 OFFSET 5;

-- task two
SELECT id, name, CHAR_LENGTH(name) AS city_name_length
FROM cities
WHERE CHAR_LENGTH(name) <= 7 OR CHAR_LENGTH(name) >= 11;

-- task three
SELECT region, SUM(population) AS sum_population
FROM cities
WHERE region = 'C' OR region = 'S'
GROUP BY region;

-- task four
SELECT region, AVG(population) AS average_value_population
FROM cities
WHERE region = 'W'
GROUP BY region;

-- task five
SELECT region, COUNT(name) AS count_city
FROM cities
WHERE region = 'E'
GROUP BY region;