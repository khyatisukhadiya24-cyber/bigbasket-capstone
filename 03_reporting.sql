-- BigBasket Capstone — Part 1 Reporting

-- 1. CASE WHEN tiering: every product by delivered revenue
WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        COALESCE(SUM(CASE WHEN o.status = 'Delivered' THEN o.amount_inr ELSE 0 END), 0) AS total_revenue
    FROM products p
    LEFT JOIN orders o
        ON p.product_id = o.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_id,
    product_name,
    total_revenue,
    CASE
        WHEN total_revenue >= 3000 THEN 'High'
        WHEN total_revenue >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_tier
FROM product_revenue
ORDER BY total_revenue DESC;

-- 2. Monthly-by-category business report: fixed CSV export query
SELECT
    p.category AS category,
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category, strftime('%Y-%m', o.order_date)
ORDER BY p.category, month;

-- 3. Category target variance and percentage variance
WITH category_revenue AS (
    SELECT
        p.category,
        SUM(o.amount_inr) AS total_revenue
    FROM orders o
    INNER JOIN products p
        ON o.product_id = p.product_id
    WHERE o.status = 'Delivered'
    GROUP BY p.category
)
SELECT
    ct.category,
    COALESCE(cr.total_revenue, 0) AS total_revenue,
    ct.target_revenue_inr,
    ct.target_revenue_inr - COALESCE(cr.total_revenue, 0) AS variance,
    ((COALESCE(cr.total_revenue, 0) - ct.target_revenue_inr) * 100.0)
        / ct.target_revenue_inr AS percentage_variance,
    CASE
        WHEN COALESCE(cr.total_revenue, 0) >= ct.target_revenue_inr
            THEN 'Above Target'
        WHEN ((COALESCE(cr.total_revenue, 0) - ct.target_revenue_inr) * 100.0)
             / ct.target_revenue_inr >= -15
            THEN 'Below Target - Watch'
        ELSE 'Below Target - Critical'
    END AS tag
FROM category_targets ct
LEFT JOIN category_revenue cr
    ON ct.category = cr.category
ORDER BY total_revenue DESC;
