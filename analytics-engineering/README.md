SQL Queries for Question 4 of hw:
SELECT COUNT(*) as total_fhv_trips_july_2019
FROM `prod.fhv_fact_trips`
WHERE EXTRACT(YEAR FROM pickup_datetime) = 2019
AND EXTRACT(MONTH FROM pickup_datetime) = 7;
-- 290680

SELECT COUNT(*) as total_green_trips_july_2019
FROM `prod.fact_trips`
WHERE service_type = 'Green'
AND EXTRACT(YEAR FROM pickup_datetime) = 2019
AND EXTRACT(MONTH FROM pickup_datetime) = 7;
-- 397695

SELECT COUNT(*) as total_yellow_trips_july_2019
FROM `prod.fact_trips`
WHERE service_type = 'Yellow'
AND EXTRACT(YEAR FROM pickup_datetime) = 2019
AND EXTRACT(MONTH FROM pickup_datetime) = 7;
-- 3232249