SHOW DATABASES;
USE capstone_2;
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM stores;
SELECT * FROM exchangerates;
SELECT
  MONTHNAME(order_date) AS month,
  ROUND(SUM(unit_price_usd * quantity), 2) AS total_revenue_USD
FROM
  overall
GROUP BY
  MONTHNAME(order_date);
SELECT
  product_name,
  SUM(quantity) AS total_quantity
FROM
   overall
GROUP BY
  product_name
ORDER BY total_quantity DESC
LIMIT 10;
SELECT
  product_name,
  ROUND(SUM(unit_price_usd * quantity), 2) AS total_revenue_USD
FROM
  overall
GROUP BY
  product_name
ORDER BY total_revenue_USD DESC
LIMIT 10;
SELECT
  product_name,
  ROUND(SUM(unit_price_usd * quantity), 2) AS total_revenue_USD
FROM
  overall
GROUP BY
  product_name
ORDER BY total_revenue_USD DESC
LIMIT 10;
SELECT
  storekey,
  ROUND(SUM(unit_price_usd * quantity), 2) AS total_revenue_USD
FROM
  overall
GROUP BY
  storekey
ORDER BY total_revenue_USD DESC;
SELECT
    CASE
        WHEN square_meters < 250 THEN '<250'
        WHEN square_meters BETWEEN 250 AND 500 THEN '250 to 500'
        WHEN square_meters BETWEEN 501 AND 750 THEN '500 to 750'
        WHEN square_meters BETWEEN 751 AND 1000 THEN '750 to 1000'
        WHEN square_meters BETWEEN 1001 AND 1250 THEN '1000 to 1250'
        WHEN square_meters BETWEEN 1251 AND 1500 THEN '1250 to 1500'
        WHEN square_meters BETWEEN 1501 AND 1750 THEN '1500 to 1750'
        WHEN square_meters BETWEEN 1751 AND 2000 THEN '1750 to 2000'
        WHEN square_meters > 2000 THEN '> 2000'
    END AS size_bucket,
    ROUND(SUM(unit_price_usd * quantity), 2) AS total_sales
FROM overall
GROUP BY size_bucket
ORDER BY
    CASE
        WHEN size_bucket = '<250' THEN 1
        WHEN size_bucket = '250 to 500' THEN 2
        WHEN size_bucket = '500 to 750' THEN 3
        WHEN size_bucket = '750 to 1000' THEN 4
        WHEN size_bucket = '1000 to 1250' THEN 5
        WHEN size_bucket = '1250 to 1500' THEN 6
        WHEN size_bucket = '1500 to 1750' THEN 7
        WHEN size_bucket = '1750 to 2000' THEN 8
        WHEN size_bucket = '> 2000' THEN 9
    END;
SELECT
    CASE
        WHEN YEAR(CURDATE()) - YEAR(open_date) <= 5 THEN '<=5'
        WHEN YEAR(CURDATE()) - YEAR(open_date) BETWEEN 6 AND  10 THEN '5 to 10'
        WHEN YEAR(CURDATE()) - YEAR(open_date) BETWEEN 11 AND 15 THEN '10 to 15'
        WHEN YEAR(CURDATE()) - YEAR(open_date) BETWEEN 16 AND 20 THEN '15 to 20'
    END AS store_age_bucket,
    ROUND(SUM(unit_price_usd * quantity), 2) AS total_sales
FROM overall
GROUP BY store_age_bucket
ORDER BY store_age_bucket;
SELECT
  storekey, Country, Continent, State,
  ROUND(SUM(unit_price_usd * quantity), 2) AS total_revenue_USD
FROM
  overall
GROUP BY
  storekey, Country, Continent, State
ORDER BY total_revenue_USD DESC;
SELECT
    category, subcategory,
    ROUND(SUM(unit_price_usd * quantity), 2) AS total_sales
FROM overall
GROUP BY category, subcategory
ORDER BY total_sales DESC;
SELECT DISTINCT(product_name), SUM(quantity) AS Quantity
FROM overall
GROUP BY product_name
ORDER BY Quantity DESC
LIMIT 10;
SELECT DISTINCT(product_name), SUM(quantity) AS Quantity
FROM overall
GROUP BY product_name
ORDER BY Quantity
LIMIT 10;
SELECT
    product_name,
    ROUND(SUM((unit_price_usd - unit_cost_usd) * quantity), 2) AS Profit_Margin
FROM overall
GROUP BY product_name
ORDER BY Profit_Margin DESC
LIMIT 10;
SELECT gender, COUNT(*) AS Count_gender
FROM customers
GROUP BY gender;
SELECT
    age_bucket,
    COUNT(*) AS count
FROM (
    SELECT
        *,
        CASE
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) <= 18 THEN '<=18'
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) BETWEEN 18 AND 25 THEN '18-25'
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) BETWEEN 25 AND 35 THEN '25-35'
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) BETWEEN 35 AND 45 THEN '35-45'
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) BETWEEN 45 AND 55 THEN '45-55'
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) BETWEEN 55 AND 65 THEN '55-65'
            ELSE '>65'
        END AS age_bucket
    FROM overall
) AS age_groups
GROUP BY age_bucket;
-- countery wise customer count
SELECT 
    continent,country,state,city, 
    COUNT(CustomerKey) AS customer_count
FROM 
    CUSTOMERS
GROUP BY 
    continent,country,state,city
ORDER BY 
    customer_count DESC



