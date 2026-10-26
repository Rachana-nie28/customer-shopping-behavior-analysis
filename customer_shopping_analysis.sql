CREATE DATABASE customer_shopping_db;
USE customer_shopping_db;
SHOW DATABASES;
USE customer_shopping_db;

SELECT COUNT(*) FROM customer_shopping;
SELECT *
FROM customer_shopping
LIMIT 10;
DESCRIBE customer_shopping;
SELECT
    category,
    COUNT(*) AS total_purchases
FROM customer_shopping
GROUP BY category
ORDER BY total_purchases DESC;
SELECT
    category,
    SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY category
ORDER BY total_revenue DESC;
SELECT
    category,
    AVG(purchase_amount) AS average_purchase
FROM customer_shopping
GROUP BY category
ORDER BY average_purchase DESC;
SELECT
    customer_id,
    purchase_amount,
    CASE
        WHEN purchase_amount >= 100 THEN 'High'
        WHEN purchase_amount >= 60 THEN 'Medium'
        ELSE 'Low'
    END AS spending_category
FROM customer_shopping
LIMIT 10;

SELECT
    subscription_status,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS average_purchase
FROM customer_shopping
GROUP BY subscription_status;

SELECT
    customer_id,
    COUNT(*) AS purchase_count
FROM customer_shopping
GROUP BY customer_id
ORDER BY purchase_count DESC
LIMIT 10;

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM customer_shopping;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM customer_shopping;

SELECT
    gender,
    COUNT(*) AS total_purchases,
    ROUND(AVG(purchase_amount), 2) AS average_purchase,
    SUM(purchase_amount) AS total_purchase_amount
FROM customer_shopping
GROUP BY gender
ORDER BY total_purchase_amount DESC;

SELECT
    age_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS average_purchase,
    SUM(purchase_amount) AS total_purchase_amount
FROM (
    SELECT
        CASE
            WHEN age < 25 THEN 'Under 25'
            WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 35 AND 44 THEN '35-44'
            WHEN age BETWEEN 45 AND 54 THEN '45-54'
            ELSE '55+'
        END AS age_group,
        purchase_amount
    FROM customer_shopping
) AS age_data
GROUP BY age_group
ORDER BY total_purchase_amount DESC;

SELECT
    payment_method,
    COUNT(*) AS total_purchases,
    ROUND(AVG(purchase_amount), 2) AS average_purchase,
    SUM(purchase_amount) AS total_purchase_amount
FROM customer_shopping
GROUP BY payment_method
ORDER BY total_purchases DESC;
