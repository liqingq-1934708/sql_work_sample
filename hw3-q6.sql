-- hw3 q6
-- # of rows in the query result = 4
-- how long the query took = 5s
-- the first 20 rows of the result
-- carrier
-- Alaska Airlines Inc.
-- SkyWest Airlines Inc.
-- United Air Lines Inc.
-- Virgin America


SELECT DISTINCT C.name AS carrier 
FROM CARRIERS AS C 
WHERE C.cid IN (SELECT F.carrier_id
                FROM FLIGHTS AS F 
                WHERE F.origin_city = 'Seattle WA'
                      AND F.dest_city = 'San Francisco CA')
ORDER BY carrier;