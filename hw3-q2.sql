-- hw3 q2
-- # of rows in the query result = 109
-- how long the query took = 23s
-- the first 20 rows of the result
-- city
-- Aberdeen SD
-- Abilene TX
-- Alpena MI
-- Ashland WV
-- Augusta GA
-- Barrow AK
-- Beaumont/Port Arthur TX
-- Bemidji MN
-- Bethel AK
-- Binghamton NY
-- Brainerd MN
-- Bristol/Johnson City/Kingsport TN
-- Butte MT
-- Carlsbad CA
-- Casper WY
-- Cedar City UT
-- Chico CA
-- College Station/Bryan TX
-- Columbia MO
-- Columbus GA

SELECT DISTINCT F.origin_city AS city
FROM FLIGHTS AS F
WHERE F.origin_city NOT IN (SELECT DISTINCT F1.origin_city
                            FROM FLIGHTS AS F1
                            WHERE F1.actual_time >= 180)
      AND F.canceled != 1
ORDER BY city;