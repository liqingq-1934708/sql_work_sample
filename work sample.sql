-- q1
SELECT DISTINCT flight_num
FROM FLIGHTS AS F,CARRIERS AS C,WEEKDAYS AS W 
WHERE F.carrier_id = C.cid AND F.day_of_week_id = W.did 
AND origin_city = 'Seattle WA' AND dest_city = 'Boston MA' 
AND C.name = 'Alaska Airlines Inc.' AND W.day_of_week = 'Monday';

-- q2
SELECT C.name, 
F1.flight_num AS f1_flight_num, 
F1.origin_city AS f1_origin_city,
F1.dest_city AS f1_dest_city, 
F1.actual_time AS f1_actual_time, 
F2.flight_num AS f2_flight_num,
F2.origin_city AS f2_origin_city, 
F2.dest_city AS f2_dest_city, 
F2.actual_time AS f2_actual_time,
(F1.actual_time + F2.actual_time) AS actual_time
FROM FLIGHTS AS F1, FLIGHTS AS F2, CARRIERS AS C, MONTHS AS M
WHERE F1.carrier_id = C.cid 
AND F2.carrier_id = C.cid 
AND F1.month_id = M.mid 
AND F2.month_id = M.mid
AND F1.day_of_month = 15 
AND F2.day_of_month = 15 
AND F1.origin_city = 'Seattle WA' 
AND F1.dest_city = F2.origin_city 
AND F2.dest_city = 'Boston MA' 
AND M.month = 'July' 
AND F1.carrier_id = F2.carrier_id 
AND (F1.actual_time+F2.actual_time) < 420;

-- q3
SELECT day_of_week, AVG(arrival_delay) AS delay 
FROM FLIGHTS AS F, WEEKDAYS AS W
WHERE F.day_of_week_id = W.did 
GROUP BY Weekday.did, day_of_week
ORDER BY delay DESC
LIMIT 1;

-- q4
SELECT DISTINCT C.name
FROM FLIGHTS AS F, CARRIERS AS C 
WHERE F.carrier_id = C.cid 
GROUP BY C.cid, C.name, F.month_id, F.day_of_month
HAVING count(*) > 1000;

-- q5
SELECT C.name, sum(canceled)*1.0/count(*) * 100 AS percentage
FROM FLIGHTS AS F, CARRIERS AS C 
WHERE F.carrier_id = C.cid AND origin_city = 'Seattle WA'
GROUP BY C.name
HAVING sum(canceled) * 1.0 /count(*) > 0.005
ORDER BY percentage ASC;

-- q6
SELECT C.name AS carrier, MAX(price) AS max_price
FROM FLIGHTS AS F, CARRIERS AS C 
WHERE F.carrier_id = C.cid AND ((origin_city = 'Seattle WA' AND dest_city = 'New York NY') 
OR (origin_city = 'New York NY' AND dest_city = 'Seattle WA'))
GROUP BY C.name;

-- q7
SELECT SUM(capacity) AS capacity
FROM FLIGHTS AS F, MONTHS AS M 
WHERE F.month_id = M.mid AND M.month = 'July' AND F.day_of_month = 10
AND ((origin_city = 'Seattle WA' and dest_city = 'San Francisco CA') 
	OR (origin_city = 'San Francisco CA' AND dest_city = 'Seattle WA'));

-- q8
SELECT C.name, SUM(departure_delay) AS delay
FROM FLIGHTS AS F, CARRIERS AS C
WHERE F.carrier_id = C.cid 
GROUP BY C.name;

