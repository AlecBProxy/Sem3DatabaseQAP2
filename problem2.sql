-- Problem #2, "create tables" 

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(90) NOT NULL,
    price DECIMAL (10,2) NOT NULL,
    stock_quantity INT NOT NULL
)

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(100) NOT NULL
)

CREATE TABLE orders (
    id SERIAL PRIMARY KEY
    customer_id INT NOT NULL,
    order_date DATE NOT NUL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
)

CREATE TABLE order_items (
    order_id INT NOT NULL
    FOREIGN KEY (order_id) REFERENCES order(id)
    product_id INT NOT NULL
    FOREIGN KEY (product_id) REFERENCES products(id)
    quantity INT NOT NULL
    PRIMARY KEY (order_id, product_id)
)

-- Problem #2 "insert data "

INSERT INTO products (product_name, price, stock_quantity)
VALUES
('Shorts', 59.99, 20),
('Jersey', 129.99, 15),
('Basketball', 49.99, 10),
('Sneakers', 119.99, 10),
('Headband', 14.99, 25);

INSERT INTO customers (first_name, last_name, email)
VALUES
('Jimmy', 'Butler', 'JB22@gmail.com'),
('Steph', 'Curry', 'SC30@gmail.com'),
('Tony', 'Parker', 'TP09@gmail.com'),
('Kyrie', 'Irving', 'KI11@gmail.com')

INSERT INTO orders (customer_id, order_date)
VALUES
(1, '2025-01-01'),
(2, '2025-01-02'),
(3, '2025-01-03'),
(4, '2025-01-04'),
(1, '2025-01-05')

INSERT INTO order_items (order_id, product_id, quantity)
(1, 3, 1),
(1, 1, 2),

(2, 5, 2),
(2, 4, 1),

(3, 2, 2),
(3, 1, 1),
(3, 5, 3),

(4, 4, 2),
(4, 2, 3),

(5, 3, 1), 
(5, 4, 1)

-- Problem #2 "Write SQL Queries"

SELECT product_name, stock_quantity FROM products;

SELECT product_id, quantity FROM order_items WHERE order_id = 1;
SELECT product_name FROM products WHERE id IN (1, 3);

SELECT id FROM orders WHERE customer_id = 1;
SELECT product_id, quantity FROM order_items WHERE order_id IN (1, 5);

-- This is simulating the reduction for order 1
UPDATE products
SET stock_quantity = stock_quantity - 1 (
    SELECT quantity FROM order_items WHERE product_id = products.id AND order_id = 1
)
WHERE id IN (SELECT product_id FROM order_items WHERE order_id = 1);

DELETE FROM order_items WHERE order_id = 1;
DELETE FROM orders WHERE id = 1;
