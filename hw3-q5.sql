-- hw3 q5
-- # of rows in the query result = 3
-- how long the query took = 47s
-- the first 20 rows of the result
-- city
-- Devils Lake ND
-- Hattiesburg/Laurel MS
-- St. Augustine FL

SELECT DISTINCT F1.dest_city AS city 
FROM FLIGHTS AS F1
WHERE F1.dest_city NOT IN ((SELECT DISTINCT F2.dest_city
                            FROM FLIGHTS AS F2
                            WHERE F2.origin_city = 'Seattle WA')
                           UNION
                           (SELECT DISTINCT F4.dest_city
  	                        FROM FLIGHTS AS F3,FLIGHTS AS F4
  	                        WHERE F3.dest_city = F4.origin_city
  	                          AND F3.origin_city = 'Seattle WA'))
ORDER BY city;

