-- List All Products
SELECT * FROM products

--Find Products by Category
SELECT product_name 
FROM products 
WHERE category_id = 3;

--List of Customers
SELECT customer_id, company_name, contact_name, country
FROM customers;

--Total number of orders per customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

--Top 5 Best Selling Products
SELECT p.product_name, SUM(od.quantity) AS total_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

--Show order IDs
SELECT order_id
FROM orders

--Select Order Details for a Specific Order
SELECT o.order_id, o.order_date, c.company_name, p.product_name, od.quantity, od.unit_price 
FROM orders o 
JOIN order_details od ON o.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN customers c ON o.customer_id = c.customer_id 
WHERE o.order_id = 10250;

--Order Details for Order ID 10936
SELECT o.order_id, o.order_date, c.company_name, p.product_name, od.quantity, od.unit_price 
FROM orders o 
JOIN order_details od ON o.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
JOIN customers c ON o.customer_id = c.customer_id 
WHERE o.order_id = 10936;

--Monthly Sales Summary
SELECT DATE_TRUNC('month', order_date) AS month, SUM(od.quantity * od.unit_price) AS total_sales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY month
ORDER BY month;

--Yearly Sales Summary
SELECT DATE_TRUNC('year', order_date) AS year, SUM(od.quantity * od.unit_price) AS total_sales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY year
ORDER BY year;





