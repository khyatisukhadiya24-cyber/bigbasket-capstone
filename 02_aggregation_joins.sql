-- 02_aggregation_joins.sql

-- 1. Delivered revenue by category using INNER JOIN and HAVING
SELECT
    p.category,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS average_revenue
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category
HAVING total_revenue > 10000
ORDER BY total_revenue DESC;


-- 2. Product order counts using LEFT JOIN
-- COUNT(o.order_id) preserves products with zero orders.
SELECT
    p.product_id,
    p.product_name,
    p.category,
    COUNT(o.order_id) AS total_orders
FROM products p
LEFT JOIN orders o
    ON p.product_id = o.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY total_orders ASC, p.product_id ASC;
