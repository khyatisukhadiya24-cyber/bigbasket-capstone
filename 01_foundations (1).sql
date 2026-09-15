-- 01_foundations.sql

-- 1. SELECT and WHERE:
-- Orders from Bengaluru
SELECT *
FROM orders o
JOIN customers c
  ON o.customer_id = c.customer_id
WHERE c.city = 'Bengaluru';


-- 2. DISTINCT:
-- Every distinct product category
SELECT DISTINCT category
FROM products
ORDER BY category;


-- 3. ORDER BY and LIMIT:
-- Five highest-value orders
SELECT *
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;


-- 4. Alias using AS:
-- Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;


-- 5. IN:
-- Orders paid using UPI or Credit Card
SELECT *
FROM orders
WHERE payment_mode IN ('UPI', 'Credit Card');


-- 6. BETWEEN:
-- Orders with amount between INR 100 and INR 500
SELECT *
FROM orders
WHERE amount_inr BETWEEN 100 AND 500;


-- 7. NOT BETWEEN:
-- Orders outside the INR 100 to INR 500 range
SELECT *
FROM orders
WHERE amount_inr NOT BETWEEN 100 AND 500;


-- 8. IS NULL:
-- Orders with no rating
SELECT *
FROM orders
WHERE rating IS NULL;
