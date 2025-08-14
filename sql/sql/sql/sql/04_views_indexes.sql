-- 04_views_indexes.sql
-- Views (reusable queries) and indexes (speed)

-- View: revenue per order (only paid)
CREATE VIEW v_order_revenue AS
SELECT o.order_id,
       SUM(oi.quantity * oi.unit_price) AS order_revenue
FROM orders o
JOIN order_items oi USING (order_id)
WHERE o.status = 'paid'
GROUP BY o.order_id;

-- Quick check:
-- SELECT * FROM v_order_revenue ORDER BY order_revenue DESC;

-- Helpful indexes for common joins/filters
CREATE INDEX IF NOT EXISTS idx_orders_customer_date ON orders(customer_id, order_date);
CREATE INDEX IF NOT EXISTS idx_order_items_product ON order_items(product_id);
CREATE INDEX IF NOT EXISTS idx_order_items_order ON order_items(order_id);
