USE task3-1;
GO

SELECT * FROM Products WHERE list_price > 1000;

SELECT * FROM Customers WHERE state IN ('CA','NY');

SELECT * FROM Orders WHERE YEAR(order_date) = 2023;

SELECT * FROM Customers WHERE email LIKE '%@gmail.com';

SELECT * FROM Staffs;

SELECT * FROM Products ORDER BY list_price DESC;

SELECT TOP 10 * FROM Orders ORDER BY order_date DESC;

SELECT state, COUNT(*) FROM Customers GROUP BY state;

SELECT * FROM Customers WHERE phone IS NULL;

SELECT * FROM Staffs WHERE manager_id IS NULL;

SELECT category_id, COUNT(*) FROM Products GROUP BY category_id;

SELECT state, COUNT(*) FROM Customers GROUP BY state;

SELECT brand_id, AVG(list_price) FROM Products GROUP BY brand_id;

SELECT staff_id, COUNT(*) FROM Orders GROUP BY staff_id;

SELECT customer_id FROM Orders GROUP BY customer_id HAVING COUNT(*) > 1;

SELECT * FROM Products WHERE list_price BETWEEN 500 AND 1500;

SELECT * FROM Customers WHERE city LIKE 'S%';

SELECT * FROM Orders WHERE order_status = 1;

SELECT * FROM Products WHERE category_id IN (1,2,3);

SELECT * FROM Stores WHERE state IN ('CA','NY');