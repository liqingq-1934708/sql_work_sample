-- hw3 q7
-- # of rows in the query result = 4
-- how long the query took = 8s
-- the first 20 rows of the result
-- carrier
-- Alaska Airlines Inc.
-- SkyWest Airlines Inc.
-- United Air Lines Inc.
-- Virgin America

SELECT DISTINCT C.name AS carrier
FROM FLIGHTS AS F, CARRIERS AS C 
WHERE F.origin_city = 'Seattle WA' 
      AND F.dest_city = 'San Francisco CA'
      AND F.carrier_id = C.cid 
ORDER BY carrier;