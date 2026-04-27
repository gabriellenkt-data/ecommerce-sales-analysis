-- Business Analysis
-- Total Revenue
SELECT ROUND(SUM(total_payment_value)::numeric, 2) AS total_revenue
FROM vw_order_level_summary;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM vw_order_level_summary;

-- Average Order Value
SELECT ROUND(AVG(total_payment_value)::numeric, 2) AS avg_order_value
FROM vw_order_level_summary;

-- Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    ROUND(SUM(total_payment_value)::numeric, 2) AS revenue
FROM vw_order_level_summary
GROUP BY month
ORDER BY month;

-- Revenue by State
SELECT 
    customer_state,
    ROUND(SUM(total_payment_value)::numeric, 2) AS revenue
FROM vw_order_level_summary
GROUP BY customer_state
ORDER BY revenue DESC;

-- Average Review Score
SELECT ROUND(AVG(review_score)::numeric, 2) AS avg_review_score
FROM vw_order_level_summary;

-- Average Delivery Time (days)
SELECT 
    ROUND(AVG(EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp)) / 86400)::numeric, 2)
    AS avg_delivery_days
FROM vw_order_level_summary
WHERE order_delivered_customer_date IS NOT NULL;

