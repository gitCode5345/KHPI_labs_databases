-- task one
SELECT id, name, population
FROM cities
WHERE population >= 1000000;

-- task two
SELECT id, name, population, region
FROM cities
WHERE region = 'E' OR region = 'W'
ORDER BY population DESC;

-- task three
SELECT id, name, population, region
FROM cities
WHERE population > 50000 AND region IN('S', 'C', 'N');

-- task four
SELECT id, name, population, region
FROM cities
WHERE (population > 150000 AND population < 350000) AND region IN('E', 'W', 'N')
ORDER BY name ASC
LIMIT 20;

-- task five
SELECT id, name, population, region
FROM cities
WHERE region != 'E' AND region != 'W'
ORDER BY population DESC
LIMIT 10 OFFSET 10;