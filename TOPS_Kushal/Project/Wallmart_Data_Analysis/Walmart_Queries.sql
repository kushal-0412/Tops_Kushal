CREATE DATABASE wallmart;
USE wallmart;

-- Q1: Find different payment method and number of transaction and number of quantity sold
SELECT 
    payment_method,
    COUNT(payment_method) AS no_payment,
    SUM(quantity) AS no_qty_sold
FROM
    wallmart_t
GROUP BY payment_method;

-- Q2: identify the highest rated category in each branch, displaying the branch,category and average rating
SELECT *
FROM (
    SELECT 
        branch,
        category,
        ROUND(AVG(rating), 2) AS avg_rating,
        RANK() OVER (
            PARTITION BY branch 
            ORDER BY AVG(rating) DESC
        ) AS rank1
    FROM wallmart_t
    GROUP BY branch, category
) AS ranked_1
WHERE rank1 = 1;

-- Q3: identify the busiest day for each branch based on the number of transaction 
SELECT branch, day_name, no_transactions
FROM (
    SELECT 
        branch,
        DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS rank1
    FROM wallmart_t
    GROUP BY branch, day_name
) AS ranked
WHERE rank1 = 1;

-- Q4 Calculate the total quantity of items sold per payment method
SELECT 
    payment_method, SUM(quantity)
FROM
    wallmart_t
GROUP BY payment_method;

-- Q5 Determine the average, minimum, and maximum rating of categories for each city
SELECT 
    city,
    category,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(MIN(rating), 2) AS min_rating,
    ROUND(MAX(rating), 2) AS max_rating
FROM
    wallmart_t
GROUP BY city , category;

-- Q6: Calculate the total profit for each category
SELECT 
    category, ROUND(SUM(total), 2) AS total_profit
FROM
    wallmart_t
GROUP BY category
ORDER BY total_profit DESC;

-- Q7: Determine the most common payment method for each branch
WITH common_p AS (
    SELECT 
        branch,
        payment_method,
        COUNT(invoice_id) AS total_trans,
        RANK() OVER (
            PARTITION BY branch 
            ORDER BY COUNT(invoice_id)
        ) AS rank_order
    FROM wallmart_t
    GROUP BY branch, payment_method
)

SELECT 
    branch,
    payment_method AS most_common
FROM common_p
WHERE rank_order = 1;





