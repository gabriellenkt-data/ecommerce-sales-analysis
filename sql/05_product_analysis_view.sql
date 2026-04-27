-- Products Analysis View
DROP VIEW IF EXISTS vw_product_analysis;

CREATE VIEW vw_product_analysis AS
SELECT
    oi.order_id,
    oi.product_id,
    p.product_category_name,
    oi.price,
    oi.freight_value,
    o.order_purchase_timestamp,
    c.customer_state
FROM order_items oi
JOIN products p 
    ON oi.product_id = p.product_id
JOIN orders o 
    ON oi.order_id = o.order_id
JOIN customers c 
    ON o.customer_id = c.customer_id;
