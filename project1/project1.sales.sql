SELECT * FROM practicesql.sales;

-- Create Sales table

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity_sold INT,
    sale_date DATE,
    total_price DECIMAL(10, 2)
);

-- Insert sample data into Sales table

INSERT INTO Sales (sale_id, product_id, quantity_sold, sale_date, total_price) VALUES
(1, 101, 5, '2024-01-01', 2500.00),
(2, 102, 3, '2024-01-02', 900.00),
(3, 103, 2, '2024-01-02', 60.00),
(4, 104, 4, '2024-01-03', 80.00),
(5, 105, 6, '2024-01-03', 90.00);

-- 1. Retrieve all columns from the Sales table.
select  * from Sales;

-- 2.  Retrieve the sale_id and sale_date from the Sales table.

SELECT sale_id, sale_date FROM Sales;

-- 3. Filter the Sales table to show only sales with a total_price greater than $100.alter

SELECT * FROM Sales
where total_price>100;

-- 4. Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.

SELECT sale_id , total_Price FROM Sales 
where sale_date = '2024-01-03'; 

-- 5. Calculate the total revenue generated from all sales in the Sales table.

SELECT sum(total_price) AS total_revenue FROM Sales;

-- 6. Calculate the total quantity_sold from the Sales table.
SELECT SUM(quantity_sold) as total_quantity_sold FROM Sales;

-- 7. Retrieve the sale_id, product_id, and total_price from the Sales table for sales with a quantity_sold greater than 4.

SELECT sale_id, product_id, total_price FROM Sales
where quantity_sold>4;

-- 8. Retrieve the total_price of all sales, rounding the values to two decimal places.

select round(SUM(total_price),2) AS total_Sales from Sales;

-- 9. Calculate the average total_price of sales in the Sales table.

SELECT avg(total_price) AS average_total_price FROM Sales;

-- 10. Retrieve the sale_id and sale_date from the Sales table, formatting the sale_date as ‘YYYY-MM-DD’.

select sale_id, date_format(sale_date, '%Y-%m-%d') as formatted_date from Sales; 

