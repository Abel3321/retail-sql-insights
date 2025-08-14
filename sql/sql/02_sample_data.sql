-- 02_sample_data.sql
-- Sample data for Retail SQL Insights project

-- Insert products
INSERT INTO products VALUES
(1, 'Widget A', 'Gadgets', 25.00),
(2, 'Widget B', 'Gadgets', 35.00),
(3, 'Widget C', 'Tools', 45.00),
(4, 'Widget D', 'Tools', 55.00);

-- Insert customers
INSERT INTO customers VALUES
(1, 'Maya', 'Lee', '2025-01-05'),
(2, 'Jamal', 'K', '2025-02-12'),
(3, 'Rita', 'S', '2025-03-01');

-- Insert orders
INSERT INTO orders VALUES
(1001, 1, '2025-03-10', 'paid'),
(1002, 2, '2025-03-11', 'paid'),
(1003, 1, '2025-03-12', 'refunded');

-- Insert order items
INSERT INTO order_items VALUES
(1, 1001, 1, 2, 25.00),
(2, 1001, 2, 1, 35.00),
(3, 1002, 3, 1, 45.00),
(4, 1003, 4, 1, 55.00);

-- Insert restocks
INSERT INTO restocks VALUES
(1, 1, '2025-02-15', 100),
(2, 2, '2025-02-20', 50),
(3, 3, '2025-02-25', 30),
(4, 4, '2025-03-05', 80);

-- Insert suppliers
INSERT INTO suppliers VALUES
(1, 'Nova Supply', 'ops@nova.example');
