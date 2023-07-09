
USE SampleRetail;

-- Total Customer in each city

SELECT city, COUNT(customer_id) AS Total_Customer
FROM sale.customer
GROUP BY city;

-- the total product quantity of the orders.

SELECT order_id, SUM(quantity)AS Total_Quantity
FROM sale.order_item
GROUP BY order_id;

-- the first order date for each customer_id.

SELECT customer_id, MIN(order_date) as First_order
FROM sale.orders
GROUP BY customer_id;

-- the total amount of each order.

SELECT order_id, SUM(list_price*(1-discount)) AS Discounted_Price
FROM sale.order_item
GROUP BY order_id
ORDER BY Discounted_Price DESC;	

--  the order id that has the maximum average product price

SELECT *
FROM sale.order_item


SELECT TOP 1 order_id, AVG(list_price) AS avg_list 
FROM sale.order_item
GROUP BY order_id
ORDER BY avg_list DESC;

--  query that displays brand_id, product_id and list_price sorted first by brand_id (in ascending order)
-- and then by list_price (in descending order).

SELECT brand_id, product_id, list_price
FROM product.product
ORDER BY brand_id ASC, list_price DESC;

-- query that displays brand_id, product_id and list_price, 
-- but this time sorted first by list_price (in descending order), and then by brand_id (in ascending order).

SELECT brand_id, product_id, list_price
FROM product.product
ORDER BY list_price DESC, brand_id ASC;

-- Since the querly language starts reading from left to right, position of Order element have effect on output.

-- query to pull the first 10 rows and all columns from the product table 
-- that have a list_price greater than or equal to 3000.

SELECT TOP 10 *
FROM product.product
WHERE list_price>=3000

-- 5 Rows that have a list_price less than 3000.

SELECT TOP 10 *
FROM product.product
WHERE list_price<3000

-- all customer last names that start with 'B' and end with 's'.

SELECT *
FROM sale.customer
WHERE last_name LIKE 'B%s'  

-- all information regarding customers whose address is Allen or Buffalo or Boston or Berkeley.

SELECT *
FROM sale.customer
WHERE city in ('Allen', 'buffalo', 'boston', 'berkeley') 