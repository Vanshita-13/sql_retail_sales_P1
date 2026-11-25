--SQL Retail Sales Abalysis - P1
drop table if exists retail_sales;
create table retail_sales(
					transactions_id	INT PRIMARY KEY,
					sale_date DATE,
					sale_time TIME,
					customer_id	INT,
					gender VARCHAR(20),
					age	INT,
					category VARCHAR(20),
					quantity	INT,
					price_per_unit	FLOAT,
					cogs FLOAT,
					total_sale FLOAT
)

select *from retail_sales limit 10;

select count(*) from retail_sales; 

select *from retail_sales  where 
	 transactions_id is null or
     sale_date is null or
	 sale_time is null or 
	 customer_id is null or
	 gender is null or
	 category is null or
	 quantity is null or
	 price_per_unit is null or
	 cogs is null or
	 total_sale is null;


delete from retail_sales  where 
	 transactions_id is null or
     sale_date is null or
	 sale_time is null or 
	 gender is null or
	 category is null or
	 quantity is null or
	 cogs is null or
	 total_sale is null;

select count(distinct customer_id) as total_sale from retail_sales;

select distinct category from retail_sales;

select *from retail_sales where sale_date = '2022-11-05';

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
AND quantity > 1
AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';

select category , sum(total_sale) as total from retail_sales group by category;

select round(avg(age),2) as avg_age from retail_sales where category = 'Beauty';

select  * from retail_sales where total_sale >1000;

select category, gender, count(transactions_id) as transaction_count from retail_sales group by category, gender order by category;

select *from (
select 
extract(year from sale_date) as year, 
extract(month from sale_date) as month,
avg(total_sale) as avg_sale,
rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc) as rank
from retail_sales group by 1,2 ) as t1
where rank =1;

select customer_id , sum(total_sale) as tt_sale from retail_sales group by customer_id order by 2 desc limit 5;

select category,count(distinct customer_id)as unique_cnt from retail_sales group by category;

with hourly_sale
as (
select *,
	case
	when extract(hour from sale_time) <12 then 'MORNING'
	when extract(hour from sale_time) between 12 and 17 then 'AFTERNOON'
	ELSE 'EVENING'
	end as shift from retail_sales
	)
	select shift,
	count(*) as total_orders from hourly_sale group by shift;