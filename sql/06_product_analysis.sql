-- Products Analysis
-- Top Categories
SELECT 
    product_category_name,
    COUNT(*) AS total_sales
FROM vw_product_analysis
GROUP BY product_category_name
ORDER BY total_sales DESC
LIMIT 10;  

-- Revenue per Categorie
SELECT 
    product_category_name,
    ROUND(SUM(price)::numeric, 2) AS revenue
FROM vw_product_analysis
GROUP BY product_category_name
ORDER BY revenue DESC
LIMIT 10;

-- Premium Products
SELECT 
    product_category_name,
    ROUND(AVG(price)::numeric, 2) AS avg_price
FROM vw_product_analysis
GROUP BY product_category_name
ORDER BY avg_price DESC
LIMIT 10; 