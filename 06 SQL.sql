-- Day 06/30 days sql challenge


-- SCHEMAS


-- Create viewership table
CREATE TABLE viewership (
    device_type VARCHAR(255),
    viewership_count INTEGER
);

-- Insert sample records
INSERT INTO viewership (device_type, viewership_count) VALUES
('laptop', 5000),
('tablet', 3000),
('phone', 7000),
('laptop', 6000),
('tablet', 4000),
('phone', 8000),
('laptop', 5500),
('tablet', 3500),
('phone', 7500);

-- Formulate the question


/*

Question:
Write a query that calculates the total viewership for laptops and mobile devices, 
where mobile is defined as the sum of tablet and phone viewership. Output the total 
viewership for laptops as laptop_views and the total viewership for mobile devices as mobile_views.

*/



-- ----------------------------------------------
-- My solution
-- ----------------------------------------------




select 
  sum(laptop_reviews) as laptop_reviews,
  sum(mobile_views) as mobile_views
from
(
  SELECT 
   case when device_type = 'laptop' then 1 end as laptop_reviews,
    case WHEN device_type = 'tablet' then 1
          when device_type = 'phone' then 1 
          else 0 
          end as mobile_views
  FROM viewership)x1
  



-- Question link https://datalemur.com/questions/laptop-mobile-viewership
