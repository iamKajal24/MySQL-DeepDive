-- SQL Practice Exercises for Beginners
-- Basic Retrieval
-- Filtering
-- Arithmetic Operations and Comparisons:
-- Formatting
-- Aggregation Functions

-- SQL Practice Exercises for Intermediate
-- Group By and Having
-- Joins
-- Window Functions
-- Conditional Statements
-- DateTime Operations


-- SQL Practice Exercises for Intermediate
-- Group By and Having
-- Joins
-- Window Functions
-- Conditional Statements
-- DateTime Operations


-- Create Products table

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

SELECT * FROM practicesql.products;

-- Insert sample data into Products table

INSERT INTO Products (product_id, product_name, category, unit_price) VALUES
(101, 'Laptop', 'Electronics', 500.00),
(102, 'Smartphone', 'Electronics', 300.00),
(103, 'Headphones', 'Electronics', 30.00),
(104, 'Keyboard', 'Electronics', 20.00),
(105, 'Mouse', 'Electronics', 15.00);

-- --1. Retrieve all columns from the Sales table.

SELECT * FROM products;

-- 2. Retrieve the product_name and unit_price from the Products table.

SELECT product_name, unit_price FROM products;

-- 3. Filter the Products table to show only products in the ‘Electronics’ category.

SELECT * FROM products 
where category = 'Electronics'; 

-- 4. Retrieve the product_id and product_name from the Products table for products with a unit_price greater than $100.

SELECT product_id, product_name from products
where unit_price>100;

-- 6. Calculate the average unit_price of products in the Products table.

SELECT avg(unit_price) as average_unit_price FROM products;

-- 7. Retrieve the product_name and unit_price from the Products table, ordering the results by unit_price in descending order.

SELECT product_name, unit_price FROM products order by unit_price desc;

-- 8. Calculate the total revenue generated from sales of products in the ‘Electronics’ category.

SELECT sum(total_Price) as Total_revenue FROM Sales
join products on Sales.product_id = products.product_id
where products.category='Electronics'; 

-- 9. Retrieve the product_name and unit_price from the Products table, filtering the unit_price to show only values between $20 and $600.

SELECT product_name, unit_price from Products
where unit_price between 20 AND 600;

-- 10. 18. Retrieve the product_name and category from the Products table, ordering the results by category in ascending order.

SELECT product_name, category from products
order by category asc;

-- 11. Calculate the total quantity_sold of products in the ‘Electronics’ category.

SELECT sum(quantity_sold) AS total_quantity_sold FROM Sales
join products on Sales.product_id = products.product_id
where products.category='Electronics';

-- 12 . Retrieve the product_name and total_price from the Sales table, calculating the total_price as quantity_sold multiplied by unit_price.

SELECT product_name , quantity_sold * unit_price AS total_price from products
join Sales on products.product_id = Sales.product_id;

-- 14. Calculate the total revenue generated from sales for each product category.

SELECT products.category , sum(Sales.total_price) AS total_revenue
from products join Sales 
on products.product_id = Sales.product_id
group by products.category;

-- SELECT category, sum(Sales.total_price) as total_price from Sales 
-- join product on 
-- Sales.product_id=products.product_id
-- group by category;

-- 15.  Find the product category with the highest average unit price.

SELECT category from products
group by category 
order by avg(unit_price) DESC 
limit 1 ;

-- 16. Identify products with total sales exceeding 30.

SELECT products.product_name from Sales 
JOIN products ON
Sales.product_id=products.product_id
group by products.product_name
HAVING SUM(Sales.total_price)>30;

--  17. Count the number of sales made in each month.

SELECT date_format(sale_date, '%y-%m') AS month, count(*) as sales_count FROM Sales
group by month limit 1;

-- 18. Determine the average quantity sold for products with a unit price greater than $100.

SELECT avg(s.quantity_sold) AS  average_quantity_sold FROM Sales s
join products p
on s.product_id=p.product_id
where p.unit_price>100;

-- 19. Retrieve the product name and total sales revenue for each product.

SELECT p.product_name, sum(s.total_price) AS total_revenue
from Sales s
join products p
on s.product_id=p.product_id
group by p.product_name ;

-- order by product_name asc limit 3; 

-- 19. List all sales along with the corresponding product names.

SELECT s.sale_id,p.product_name 
from Sales s
Join products p
on s.product_id=p.product_id;

-- 20. Retrieve the product name and total sales revenue for each product.

-- SELECT p.category, 
--           sum(s.total_price) AS category_revenue,
--           (sum(s.total_price) / (select 
-- sum(total_price) from Sales )) * 100 AS
-- revenue_percentage
-- from Sales s
-- join product p
-- on s.product_id=p.product_id
-- group by p.category
-- order by revenue_percentage desc
-- limit 3;

SELECT p.category, 
       SUM(s.total_price) AS category_revenue,
       (SUM(s.total_price) / (SELECT SUM(total_price) FROM Sales)) * 100 AS revenue_percentage
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue_percentage DESC
LIMIT 3;

-- 20. Calculate the running total revenue for each product category.

-- SELECT p.category, p.product_name, s.sale_date, 
--            sum(s.total_price) OVER (partition by p.category order by s.sale_date) AS running_total_revenue 
-- from Sale s
-- Join products p on s.product_id=p.product_id;

SELECT p.category, p.product_name, s.sale_date, 
       SUM(s.total_price) OVER (PARTITION BY p.category ORDER BY s.sale_date) AS running_total_revenue
FROM Sales s
JOIN Products p ON s.product_id = p.product_id;


-- basic

SELECT s.* , p.product_name, p.unit_price FROM  Sales s 
left join products p on s.product_id = p.product_id;

