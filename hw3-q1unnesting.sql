SELECT DISTINCT F2.origin_city, F1.dest_city, MAX(F2.actual_time) AS time
FROM FLIGHTS AS F1, FLIGHTS AS F2
WHERE F1.origin_city = F2.origin_city
GROUP BY F1.dest_city,F1.actual_time,F2.origin_city
HAVING F1.actual_time = MAX(F2.actual_time);

