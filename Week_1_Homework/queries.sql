--Question 3

select count(*)
from yellow_taxi_trips
where tpep_pickup_datetime::date='2021-01-15';

--Question 4

select date_trunc('day',tpep_pickup_datetime) as pickup_day,
max(tip_amount) as max_tip

from yellow_taxi_trips
group by pickup_day
order by max_tip desc

--Questions 5

select coalesce(zb."Zone",'Unknown') as zone,
count(*) as cant_trips
from yellow_taxi_trips as t
inner join zones as z
on t."PULocationID" =z."LocationID"
left join zones as zb
on t."PULocationID" =zb."LocationID"
where z."Zone" ilike '%central park%' and
tpep_pickup_datetime::date='2021-01-14'
group by 1
order by cant_trips desc
limit 1;


--Question 6

select concat(coalesce(z."Zone",'Unknown'),'/',coalesce(zb."Zone",'Unknown')),
avg(total_amount) as avg_price_ride

from yellow_taxi_trips as t
left join zones as z
on t."PULocationID" =z."LocationID"
left join zones as zb
on t."PULocationID" =zb."LocationID"

group by 1
order by avg_price_ride desc
