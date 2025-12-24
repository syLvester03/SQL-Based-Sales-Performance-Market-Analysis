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
-- 040 has generated over 2.35M 
-- Whereas the second best 159 did just over 1.76M 
-- Revenue is more dependant on top 12 product which have done over 1M Revenue
-- the bottom 11 products have generated less than 1k in revenue 

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

SELECT year, QUARTER(date.date) AS Quarter, SUM(sales_amount) AS Revenue
FROM transactions_clean AS tc
INNER JOIN date
	ON tc.order_date = date.date
GROUP BY year, Quarter
ORDER BY Revenue DESC;

-- Sales in 3rd Quarter have improved in 2018 and 2019 than 2nd Quarter.
-- 2020 had the worst 1st Quarter.  
-- Sales are declining in 2020. It can be expected that 3rd quarter will perform better. 
-- However, the whole of 2024 may not do as good as 2018 or 2019. 
-- 2020 data is partial; trend inferred from first 2 Quarter sales only