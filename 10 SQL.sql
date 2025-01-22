-- Day 10/30 SQL Interview Question - Medium

CREATE TABLE Transactions (
    id INT PRIMARY KEY,
    country VARCHAR(255),
    state VARCHAR,
    amount INT,
    trans_date DATE
);

INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');


/*
Write an SQL query to find for each month and country, 
the number of transactions and their total amount, 
the number of approved transactions and their total amount.

Return the result table in in below order.RANGE


Output: 
+----------+---------+-------------+----------------+--------------------+-----------------------+
| month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
+----------+---------+-------------+----------------+--------------------+-----------------------+
| 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
+----------+---------+-------------+----------------+--------------------+-----------------------+
*/

-- -------------------------------------------------------------
-- My Solution
-- -------------------------------------------------------------

-- month, country	count of transaction of approved, 	amount Approved transaction 	amunt
select 
	date_format(trans_date, '%Y-%m') as month_num ,
    country,
    count(1) as transaction_count,
    sum(case when state = 'approved' then 1 else 0 end) as Approved_count,
    sum(case when state ='approved' then amount else 0 end ) as Approved_amount,
    sum(amount) as total_amount

from transactions_2
group by 1,2
order by 1,2 

