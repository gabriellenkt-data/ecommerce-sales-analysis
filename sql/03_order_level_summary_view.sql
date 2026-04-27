-- View Creation
DROP VIEW IF EXISTS vw_order_level_summary;

CREATE VIEW vw_order_level_summary AS
SELECT
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    pay.total_payment_value,
    pay.payment_count,
    pay.max_installments,

    rev.review_score,
    rev.review_comment_title,
    rev.review_comment_message

FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id

LEFT JOIN (
    SELECT
        order_id,
        SUM(payment_value) AS total_payment_value,
        COUNT(*) AS payment_count,
        MAX(payment_installments) AS max_installments
    FROM order_payments
    GROUP BY order_id
) pay
    ON o.order_id = pay.order_id

LEFT JOIN (
    SELECT
        order_id,
        MAX(review_score) AS review_score,
        MAX(review_comment_title) AS review_comment_title,
        MAX(review_comment_message) AS review_comment_message
    FROM order_reviews
    GROUP BY order_id
) rev
    ON o.order_id = rev.order_id;
