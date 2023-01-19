-- question 3
select count(*)
from green_taxi_trips
WHERE CAST(lpep_pickup_datetime AS DATE) = '2019-01-15' AND CAST(lpep_dropoff_datetime AS DATE) = '2019-01-15';

-- question 4
select lpep_pickup_datetime, max(trip_distance) as max_trip
from green_taxi_trips
group by lpep_pickup_datetime
order by max_trip desc;

-- question 5
select passenger_count, count(*) as trips
from green_taxi_trips
WHERE CAST(lpep_pickup_datetime AS DATE) = '2019-01-01' 
group by passenger_count;

-- question 6
select tip_amount, zpu."Zone" as pickup_zone, zdo."Zone" as dropoff_zone
from green_taxi_trips t
join zones zpu on t."PULocationID" = zpu."LocationID"
join zones zdo on t."DOLocationID" = zdo."LocationID"
where zpu."Zone" = 'Astoria'
order by tip_amount desc