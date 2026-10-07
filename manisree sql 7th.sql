 
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    country VARCHAR(50)
);
select * from  customers;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT, -- Note: Contains NULLs for guest checkouts
    product_id INT,
    order_date DATE
);

-- Insert Mock Data
INSERT INTO customers VALUES 
(1, 'Alice Smith', 'USA'),
(2, 'Bob Jones', 'Canada'),
(3, 'Charlie Brown', 'UK'),
(4, 'Diana Prince', 'USA'); -- Has never placed an order

INSERT INTO products VALUES 
(101, 'Laptop', 1200.00),
(102, 'Smartphone', 800.00),
(103, 'Wireless Headphones', 150.00),
(104, 'Tablet', 400.00); -- Has never been ordered

INSERT INTO orders VALUES 
(5001, 1, 101, '2026-06-01'), -- Alice bought Laptop
(5002, 2, 102, '2026-06-02'), -- Bob bought Smartphone
(5003, 1, 103, '2026-06-03'), -- Alice bought Headphones
(5004, NULL, 101, '2026-06-04'); -- Guest checkout bought Laptop

select o.order_id ,c.customer_name,p.product_name
from orders o
inner join customers c
on o.customer_id=c.customer_id
inner join products p
on o.product_id = p.product_id;

select c.customer_name,o.order_id
from customers c
left join orders o
on c.customer_id=o.customer_id;

select p.product_name,o.order_id
from orders o
right join products p
on o.product_id=p.product_id;

select c.customer_id,o.order_id
from customers c
full outer join orders o
on c.customer_id=o.customer_id;

select c.customer_name,product_name
from customers c
cross join products;

select * from customers;
select * from products;
select * from orders;
-