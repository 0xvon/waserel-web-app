CREATE TABLE IF NOT EXISTS users (
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email_address VARCHAR(255) NOT NULL,
    encrypted_password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS items (
    item_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    item_code VARCHAR(255) NOT NULL,
    item_name VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    stock_num INT NOT NULL,
    image_url VARCHAR(255) NOT NULL DEFAULT 'assets/product.png'
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    item_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    address VARCHAR(255) NOT NULL,
    payment_method enum('apple_pay', 'credit_card', 'transfer') NOT NULL,
    FOREIGN KEY (item_id) REFERENCES items (item_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    ordered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    amount INT NOT NULL,
    order_state enum('ordered', 'confirmed', 'canceled', 'delivered') NOT NULL
);

INSERT INTO users (email_address, encrypted_password) values ('example@gmail.com', 'UNhY4JhezH9gQYqvDMWrWH9CwlcKiECVqejMrND2VFw=');