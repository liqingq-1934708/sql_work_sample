-- hw3 q1
-- # of rows of the query result = 334 
-- how long the query took = 20s
-- first 20 rows of the result
-- origin_city
-- dest_city
-- time
-- Aberdeen SD
-- Minneapolis MN
-- 106
-- Abilene TX
-- Dallas/Fort Worth TX
-- 111
-- Adak Island AK
-- Anchorage AK
-- 471
-- Aguadilla PR
-- New York NY
-- 368
-- Akron OH
-- Atlanta GA
-- 408
-- Albany GA
-- Atlanta GA
-- 243
-- Albany NY
-- Atlanta GA
-- 390
-- Albuquerque NM
-- Houston TX
-- 492
-- Alexandria LA
-- Atlanta GA
-- 391
-- Allentown/Bethlehem/Easton PA
-- Atlanta GA
-- 456
-- Alpena MI
-- Detroit MI
-- 80
-- Amarillo TX
-- Houston TX
-- 390
-- Anchorage AK
-- Barrow AK
-- 490
-- Appleton WI
-- Atlanta GA
-- 405
-- Arcata/Eureka CA
-- San Francisco CA
-- 476
-- Asheville NC
-- Chicago IL
-- 279
-- Ashland WV
-- Cincinnati OH
-- 84
-- Aspen CO
-- Los Angeles CA
-- 304
-- Atlanta GA
-- Honolulu HI
-- 649
-- Atlantic City NJ
-- Fort Lauderdale FL
-- 212

SELECT DISTINCT F.origin_city, F.dest_city, LF.time
FROM FLIGHTS AS F,(SELECT F1.origin_city AS origin_city, MAX(F1.actual_time) AS time
                   FROM FLIGHTS AS F1
                   GROUP BY F1.origin_city) AS LF
WHERE F.origin_city = LF.origin_city AND F.actual_time = LF.time
ORDER BY F.origin_city, F.dest_city;

