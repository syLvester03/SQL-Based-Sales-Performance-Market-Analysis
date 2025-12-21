USE sales;

SELECT COUNT(*),SUM(sales_amount) FROM transactions_clean
WHERE market_code = "Mark001";

SELECT zone, SUM(sales_amount) AS Revenue 
FROM transactions_clean AS tc
INNER JOIN markets_clean AS mc
    ON tc.market_code = mc.markets_code
GROUP BY mc.zone
ORDER BY Revenue DESC;    

-- North generates the most revenue

SELECT pro.product_type, pro.product_code, SUM(sales_amount) AS Revenue
FROM transactions_clean AS tc
INNER JOIN products AS pro
	ON tc.product_code = pro.product_code
GROUP BY pro.product_code 
ORDER BY Revenue DESC;

-- TOP 3 Products =  1. Product 040 , 2. Product 159, 3. Product 065

SELECT pro.product_type, SUM(sales_amount) AS Revenue
FROM transactions_clean AS tc
INNER JOIN products AS pro
	ON tc.product_code = pro.product_code
GROUP BY pro.product_type
ORDER BY Revenue DESC;

-- Own Brand generates about 2.55x more revenue than Distribution
	
SELECT year, SUM(sales_amount) AS Revenue 
FROM transactions_clean AS tc
INNER JOIN date 
	ON tc.order_date = date.date
GROUP BY year
ORDER BY year;  	 

SELECT year, MONTH(date.date), COUNT(*) AS Records
FROM transactions_clean AS tc
INNER JOIN date
	ON tc.order_date = date.date
GROUP BY year, MONTH(date.date)
ORDER BY year, MONTH(date.date);

-- Last 3 months data avaible for 2017
-- First 6 months data available for 2020
-- 
SELECT year, MONTH(date.date), SUM(sales_amount) AS Revenue
FROM transactions_clean AS tc
INNER JOIN date
	ON tc.order_date = date.date
GROUP BY year, MONTH(date.date)
ORDER BY year, MONTH(date.date);

-- Sales in the second half of the years are higher than the first half 
-- It can be estimated that 2020 in the remaining six months can surpass 2019 sales
