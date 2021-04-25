--SQL ZOO JOIN

--1
SELECT matchid, player
FROM goal
WHERE teamid = 'GER'

--2
SELECT id,stadium,team1,team2
FROM game
WHERE id = '1012'

--3
SELECT player,teamid, stadium, mdate 
FROM game 
LEFT JOIN goal 
ON (id=matchid)
WHERE teamid = 'GER'

--4
SELECT team1, team2, player
FROM game 
LEFT JOIN goal 
ON (id=matchid)
WHERE player LIKE 'Mario%'

--5
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal 
LEFT JOIN eteam
ON (teamid = id)
WHERE goal.gtime <= 10

--6
SELECT game.mdate, eteam.teamname
FROM game
LEFT JOIN eteam
ON (game.team1=eteam.id)
WHERE coach = 'Fernando Santos'

--7
SELECT player
FROM goal
LEFT JOIN game
ON (goal.matchid = game.id)
WHERE game.stadium = 'National Stadium, Warsaw'

--8
SELECT DISTINCT player
FROM game 
LEFT JOIN goal 
ON matchid = id 
WHERE (team1 = 'GER' OR team2 = 'GER') AND (teamid != 'GER')

--9
SELECT teamname, COUNT(*)
FROM eteam
LEFT JOIN goal
ON id=teamid
GROUP BY teamname

--10
SELECT stadium, COUNT(*)
FROM game
JOIN goal
ON id=matchid
GROUP BY stadium

--11
SELECT matchid,mdate, COUNT(*)
FROM game 
JOIN goal 
ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY mdate, matchid

--12
SELECT matchid,mdate, COUNT(*)
FROM game 
JOIN goal 
ON matchid = id 
WHERE teamid = 'GER'
GROUP BY mdate, matchid
