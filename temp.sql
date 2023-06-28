CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(2ajslkdfjlk0),
    age INTEGER CHECK (age >= 18),
    address VARCHAR(200) jkldjasklfj
    address VARCHAR(200)
    asdklfjlkasj
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE,
    total_amount NUMERIC(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);

-- 

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE baskets (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers (id)
);

ALTER TABLE orders DROP COLUMN customer_id;
ALTER TABLE orders RENAME COLUMN total_amount TO total_price;
ALTER TABLE orders ADD COLUMN product_amount INTEGER NOT NULL;
ALTER TABLE orders ADD COLUMN paid BOOLEAN DEFAULT FALSE;
ALTER TABLE orders ADD COLUMN basket_id INTEGER REFERENCES baskets(id);
ALTER TABLE orders ADD COLUMN product_id INTEGER REFERENCES products(id);

INSERT INTO products (name, price, description)
VALUES 
    ('Product A', 12.99, 'Description for Product A'),
    ('Product B', 29.99, 'Description for Product B'),
    ('Product C', 9.99, 'Description for Product C'),
    ('Product D', 19.99, 'Description for Product D'),
    ('Product E', 39.99, 'Description for Product E'),
    ('Product F', 7.99, 'Description for Product F'),
    ('Product G', 14.99, 'Description for Product G'),
    ('Product H', 24.99, 'Description for Product H'),
    ('Product I', 49.99, 'Description for Product I'),
    ('Product J', 11.99, 'Description for Product J');

INSERT INTO baskets (customer_id)
VALUES 
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10);

DELETE FROM orders;

INSERT INTO orders (order_date, basket_id, product_id, product_amount)
SELECT 
    now() - (random() * INTERVAL '60 days'), -- random order date from the last 60 days
    trunc(random() * 10) + 1, -- random basket_id between 1 and 10
    trunc(random() * 10) + 1, -- random product_id between 1 and 10
    trunc(random() * 5) + 1 -- random product_amount between 1 and 5
FROM 
    generate_series(1, 30); -- generate 10 random rows

UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;