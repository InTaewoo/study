--SUM and COUNT

--1
SELECT SUM(population)
FROM world

--2
SELECT distinct continent
FROM world

--3
SELECT sum(gdp)
FROM world
WHERE continent = 'Africa'

--4
SELECT count(name)
FROM world
WHERE area > 1000000

--5
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

--6
SELECT continent,count(name)
FROM world
GROUP BY continent

--7
SELECT continent, count(name)
FROM world
WHERE population > 10000000
GROUP BY continent

--8
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000
