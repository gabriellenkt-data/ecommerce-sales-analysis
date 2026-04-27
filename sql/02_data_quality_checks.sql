-- Data Quality Checks
-- check for missing values
SELECT COUNT(*) FROM orders WHERE order_purchase_timestamp IS NULL;
SELECT COUNT(*) FROM customers WHERE customer_state IS NULL;
SELECT COUNT(*) FROM order_items WHERE product_id IS NULL;
-- Insight : no missing values were found in key fields such as customer state, product ID, and order purchase timestamp, indicating strong data completeness.

-- check for Duplicate Records
SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;
-- Insight : no duplicate order IDs were found in the orders table, confirming record uniqueness at the order level.

-- date Consistency Check
SELECT *
FROM orders
WHERE order_delivered_customer_date < order_purchase_timestamp;
-- Insight : No date inconsistencies were detected between purchase and delivery timestamps.

-- multiple Payments per Order Analysis
SELECT order_id, COUNT(*)
FROM order_payments
GROUP BY order_id
HAVING COUNT(*) > 1;
-- Insight: Several orders have multiple payment records, which likely reflects installment plans or split payment methods. This must be considered when calculating revenue to avoid double counting.
