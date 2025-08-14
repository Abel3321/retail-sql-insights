-- 03_kpis.sql
-- Core insights for Retail SQL Insights

-- A) Total revenue from paid orders
SELECT ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
WHERE o.status = 'paid';

-- B) Revenue by month
SELECT strftime('%Y-%m', o.order_date) AS month,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
WHERE o.status = 'paid'
GROUP BY month
ORDER BY month;

-- C) Top 5 products by revenue
SELECT p.product_name,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id AND o.status = 'paid'
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- D) Low‑stock signal (sold vs restocked)
WITH sold AS (
  SELECT oi.product_id, SUM(oi.quantity) AS qty_sold
  FROM order_items oi
  JOIN orders o ON o.order_id = oi.order_id AND o.status='paid'
  GROUP BY oi.product_id
),
stocked AS (
  SELECT product_id, SUM(quantity) AS qty_in
  FROM restocks
  GROUP BY product_id
)
SELECT p.product_name,
       COALESCE(s.qty_sold,0) AS qty_sold,
       COALESCE(k.qty_in,0) AS qty_in,
       CASE WHEN COALESCE(k.qty_in,0) - COALESCE(s.qty_sold,0) < 20
            THEN 'LOW' ELSE 'OK' END AS stock_flag
FROM products p
LEFT JOIN sold s ON s.product_id = p.product_id
LEFT JOIN stocked k ON k.product_id = p.product_id
ORDER BY stock_flag DESC, qty_sold DESC;

-- E) Simple customer lifetime value (LTV)
SELECT c.customer_id,
       c.first_name || ' ' || c.last_name AS customer,
       ROUND(SUM(CASE WHEN o.status = 'paid'
                      THEN oi.quantity * oi.unit_price ELSE 0 END), 2) AS ltv
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
LEFT JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY c.customer_id, customer
ORDER BY ltv DESC;
