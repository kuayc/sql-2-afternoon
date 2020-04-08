-- Ecommerce

-- Create 3 tables following the criteria
CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE products
(
    product_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE orders
(
    order_id SERIAL PRIMARY KEY NOT NULL,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Add data to fill each table
-- 3 users, 3 products, 3 orders.
INSERT INTO users
    (name, email)
VALUES
    ('Jacob', 'email1@mail.com');

INSERT INTO users
    (name, email)
VALUES
    ('Tramy', 'email2@mail.com');

INSERT INTO users
    (name, email)
VALUES
    ('Rob', 'email3@mail.com');

INSERT INTO products
    (name, price)
VALUES
    ('p1', 1);

INSERT INTO products
    (name, price)
VALUES
    ('p2', 2);

INSERT INTO products
    (name, price)
VALUES
    ('p3', 3);

INSERT INTO orders
    (product_id)
VALUES
    (1);

INSERT INTO orders
    (product_id)
VALUES
    (2);

INSERT INTO orders
    (product_id)
VALUES
    (3);

-- Run queries against your data.
-- Get all products for the first order.
SELECT *
FROM products p
    INNER JOIN orders o
    ON p.product_id = o.product_id
WHERE o.order_id = 1;

-- Get all orders.
SELECT *
FROM orders;

-- Get the total cost of an order ( sum the price of all products on an order ).
SELECT o.order_id, SUM(p.price)
FROM products p
    INNER JOIN orders o
    ON p.product_id = o.product_id
WHERE o.order_id = 2
GROUP BY o.order_id;

ALTER TABLE users
ADD COLUMN order_id INT
REFERENCES orders
(order_id);

-- Update orders table to link user to order

UPDATE users
SET order_id = 1
WHERE user_id = 1;

UPDATE users
SET order_id = 2
WHERE user_id = 2;

UPDATE users
SET order_id = 3
WHERE user_id = 3;

-- Run queries against your data.
-- Get all orders for a user.
SELECT *
FROM users u
    INNER JOIN orders o
    ON o.order_id = u.order_id
WHERE u.user_id = 1;

-- how many from each user
SELECT COUNT(*)
FROM users u
    INNER JOIN orders o
    ON o.order_id = u.order_id
WHERE u.user_id = 1;