-- task one
SELECT id, name
FROM cities
WHERE name LIKE '%ськ';

-- task two
SELECT id, name
FROM cities
WHERE name LIKE '%донець%';

-- task three
SELECT id, Concat(name, ' (', region, ')') AS city_info, population
FROM cities
WHERE population > 100000
ORDER BY name ASC;

-- task four
SELECT id, name, population, (population * 100) / 40000000 AS percent_population
FROM cities
ORDER BY population DESC
LIMIT 10;

-- task five
SELECT id, Concat(name, ' ', (population * 100) / 40000000, ' %') AS percent_population
FROM cities
WHERE (population * 100) / 40000000 >= 0.1
ORDER BY population DESC;