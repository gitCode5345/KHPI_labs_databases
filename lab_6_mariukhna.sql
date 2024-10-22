-- task one
SELECT cities.name, regions.name
FROM cities, regions
WHERE cities.region = regions.uuid AND cities.population >= 350000;

-- task two
SELECT cities.name
FROM cities
INNER JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';
