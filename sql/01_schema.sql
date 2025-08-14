-- 01_schema.sql
-- Table structure for Retail SQL Insights project

-- Products table: stores items sold
CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  product_name TEXT,
  category TEXT,
  price REAL
);

-- Customers table: stores customer info
CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  signup_date DATE
);

-- Orders table: tracks each order
CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  order_date DATE,
  status TEXT
);

-- Order items table: tracks products in each order
CREATE TABLE order_items (
  order_item_id INTEGER PRIMARY KEY,
  order_id INTEGER,
  product_id INTEGER,
  quantity INTEGER,
  unit_price REAL
);

-- Restocks table: inventory replenishment
CREATE TABLE restocks (
  restock_id INTEGER PRIMARY KEY,
  product_id INTEGER,
  restock_date DATE,
  quantity INTEGER
);

-- Suppliers table: supplier info
CREATE TABLE suppliers (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name TEXT,
  contact_email TEXT
);

