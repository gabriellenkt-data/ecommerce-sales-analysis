-- Churn Analysis
SELECT 
    customer_unique_id,
    COUNT(order_id) AS total_orders,
    MAX(order_purchase_timestamp) AS last_order_date
FROM vw_order_level_summary
GROUP BY customer_unique_id;

-- Orders Distribution
SELECT 
    total_orders,
    COUNT(*) AS number_of_customers
FROM (
    SELECT 
        customer_unique_id,
        COUNT(order_id) AS total_orders
    FROM vw_order_level_summary
    GROUP BY customer_unique_id
) t
GROUP BY total_orders
ORDER BY total_orders;