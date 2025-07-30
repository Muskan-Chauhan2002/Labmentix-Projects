-- created the database --
create database uber_supply_demand_gap;
use uber_supply_demand_gap;

-- Change the name to shorter one --
ALTER Table `uber request cleaned data - copy` 
RENAME to uber_cleaned_data;


select * from uber_cleaned_data;

-- Distribution of request points by pickup points --
SELECT `Pickup point`, count(`Request id`) as request_count
from uber_cleaned_data
group by `Pickup point`
order by request_count desc;

-- City - 3507
-- Airport - 3238

-- Highest Request Hour --
select `Request Hour`, count(*) as Total_requests
from uber_cleaned_data
group by `Request Hour`
ORDER BY `total_requests` desc
limit 8;

-- 18th Hour is highest hour with most requests followed by 20th and 19th hour --

-- Driver id with most requests --
select `Driver id`, count(*) as total_requests
from uber_cleaned_data
group by `Driver id`
order by `total_requests` desc
limit 8;

-- Driver's id with most requests is 27 followed by 84, 177, and 176. --

-- Request Hour vs Unfulfilled requests by Status (cancelled/no cars available) --
SELECT `Request Hour`, count(*) as unfulfilled_requests
from uber_cleaned_data
where Status = 'cancelled'
group by `Request Hour`
order by unfulfilled_requests desc;

-- Hour with most unfulfilled requests turned out to be 8th hour followed by 5,9, and 7. --

-- Distribution of cancelled requests by pickup point --
select `Pickup point`,count(*) as total_cancelled_requests
from uber_cleaned_data
where Status = 'Cancelled'
group by `Pickup point`;

-- Cancelled trips at City - 1066
-- Cancelled trips at Airport - 198

-- Busiest Week days --
SELECT Day, COUNT(*) AS total_requests
FROM uber_cleaned_data
GROUP BY Day
ORDER BY total_requests DESC;

-- Busiest days with most requests are Friday, Monday and Thursday. --



