-- hw3 q3
-- # of rows in the query result = 327
-- how long the query took = 20s
-- the first 20 rows of the result
-- origin_city
-- percentage
-- Guam TT
-- 0.000000000000
-- Pago Pago TT
-- 0.000000000000
-- Aguadilla PR
-- 28.900000000000
-- Anchorage AK
-- 31.810000000000
-- San Juan PR
-- 33.660000000000
-- Charlotte Amalie VI
-- 39.560000000000
-- Ponce PR
-- 40.980000000000
-- Fairbanks AK
-- 50.120000000000
-- Kahului HI
-- 53.510000000000
-- Honolulu HI
-- 54.740000000000
-- San Francisco CA
-- 55.830000000000
-- Los Angeles CA
-- 56.080000000000
-- Seattle WA
-- 57.610000000000
-- Long Beach CA
-- 62.180000000000
-- New York NY
-- 62.370000000000
-- Kona HI
-- 63.160000000000
-- Las Vegas NV
-- 64.920000000000
-- Christiansted VI
-- 65.100000000000
-- Newark NJ
-- 65.850000000000
-- Plattsburgh NY
-- 66.670000000000


SELECT F1.origin_city, ROUND((SELECT count(F2.fid)
                        FROM FLIGHTS AS F2
                        WHERE F1.origin_city = F2.origin_city 
                        AND F2.canceled != 1 AND F2.actual_time < 180
                        ) * 1.0 / count(F1.fid) * 100, 2) AS percentage
FROM FLIGHTS AS F1
WHERE F1.canceled != 1
GROUP BY F1.origin_city
ORDER BY percentage, F1.origin_city;


