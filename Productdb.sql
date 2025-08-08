CREATE TABLE customers(
cust_id SERIAL PRIMARY KEY,
cust_name VARCHAR(100) NOT NULL
);

CREATE TABLE orders(
ord_id SERIAL PRIMARY KEY,
ord_date DATE NOT NULL,
cust_id INTEGER NOT NULL,
FOREIGN KEY (cust_id) REFERENCES customers (cust_id)
);

CREATE TABLE products(
p_id SERIAL PRIMARY KEY,
p_name VARCHAR(100) NOT NULL,
price NUMERIC NOT NULL
);

CREATE TABLE order_items(
item_id SERIAL PRIMARY KEY,
ord_id INTEGER NOT NULL,
p_id INTEGER NOT NULL,
quantity INTEGER NOT NULL,
FOREIGN KEY (ord_id) REFERENCES orders(ord_id),
FOREIGN KEY (p_id) REFERENCES products(p_id)
);

INSERT INTO customers(cust_name)
VALUES ('Raju'),
('Shyam'),('Paul'),('Alex');

INSERT INTO orders (ord_date,cust_id)
Values
('2024-01-01',1),('2024-02-01',2),('2024-03-01',3),('2024-04-04',2);

INSERT INTO products(p_name,price)
VALUES 
('Laptop',55000.00),
('Mouse',500),
('Keyboard',800.00),
('Cable',250.00);

Insert into order_items (ord_id,p_id,quantity)
Values (1,1,1),(1,4,2),(2,1,1),(3,2,1),(3,4,5),(4,3,1);


SELECT * FROM customers;

SELECT * FROM order_items;

SELECT * FROM orders;

SELECT * FROM products;

SELECT c.cust_name,o.ord_date,p.p_name,p.price,oi.quantity
,(oi.quantity*p.price) as total_price
FROM order_items oi
Join  
products p ON oi.p_id=p.p_id
JOIN
orders o ON o.ord_id =oi.ord_id
JOIN 
customers c ON o.cust_id = c.cust_id
;

-- views
CREATE VIEW billing_Info AS
SELECT c.cust_name,o.ord_date,p.p_name,p.price,oi.quantity
,(oi.quantity*p.price) as total_price
FROM order_items oi
Join  
products p ON oi.p_id=p.p_id
JOIN
orders o ON o.ord_id =oi.ord_id
JOIN 
customers c ON o.cust_id = c.cust_id
;

-- HAVING
SELECT p_name, sum(total_price) FROM billing_Info GROUP BY p_name 
HAVING sum(total_price)>1500;

-- rollup
SELECT coalesce(p_name,'Total'), sum(total_price) FROM billing_Info 
GROUP BY ROLLUP(p_name)
ORDER BY SUM(total_price)
;






