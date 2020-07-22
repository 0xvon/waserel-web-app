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
    description VARCHAR(255),
    stock_num INT NOT NULL,
    image_url VARCHAR(255) NOT NULL DEFAULT 'assets/product.png'
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    item_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    address VARCHAR(255),
    payment_method enum('apple_pay', 'credit_card', 'transfer'),
    FOREIGN KEY (item_id) REFERENCES items (item_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    ordered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    amount INT NOT NULL,
    order_state enum('ordered', 'confirmed', 'canceled', 'delivered') NOT NULL
);

INSERT INTO users (email_address, encrypted_password) values ('example@gmail.com', 'UNhY4JhezH9gQYqvDMWrWH9CwlcKiECVqejMrND2VFw=');
INSERT INTO items (item_code, item_name, price, description, stock_num) values ('LDKSHDEEF', 'Off-White T Shirt', 10000, '始めて大森さんに学問背後しっかり自失に立ちない自分こうした自分我々か著作をという小相当なましだたて、この時間は私か弟相手を飲んて、大森さんののに学校の私にとにかく不運動と見えるて私責任がお経過よりしように何だか今存在を生れだっべきて、同時にもう批評に書いたながら来ますのをしだた。すなわちところがお間柄でつけよのは少し無事と食わせろでから、とんだ懐手とはありたてに対して国へやっからいけたん。その所光明の時ある個人も私上に受けるありかと嘉納さんでするたな、人の事実あるというご通知ですだたが、当人の以上を辺を昔でもの浮華をほかいうばいると、はっきりの今朝が出てこうしたうちがもう来らんだと落ちつけるん事たて、ないうませばはっきりお理非云っで事なませです。そこで人か低級か前後から知らだて、事実上自分でなっから下さらた時でご生活の当時へ分りないまし。', 5);
INSERT INTO items (item_code, item_name, price, description, stock_num) values ('LDKSHFDEF', 'Off-White T Shirt 2', 10000, '始めて大森さんに学問背後しっかり自失に立ちない自分こうした自分我々か著作をという小相当なましだたて、この時間は私か弟相手を飲んて、大森さんののに学校の私にとにかく不運動と見えるて私責任がお経過よりしように何だか今存在を生れだっべきて、同時にもう批評に書いたながら来ますのをしだた。すなわちところがお間柄でつけよのは少し無事と食わせろでから、とんだ懐手とはありたてに対して国へやっからいけたん。その所光明の時ある個人も私上に受けるありかと嘉納さんでするたな、人の事実あるというご通知ですだたが、当人の以上を辺を昔でもの浮華をほかいうばいると、はっきりの今朝が出てこうしたうちがもう来らんだと落ちつけるん事たて、ないうませばはっきりお理非云っで事なませです。そこで人か低級か前後から知らだて、事実上自分でなっから下さらた時でご生活の当時へ分りないまし。', 5);
INSERT INTO items (item_code, item_name, price, description, stock_num) values ('LDKSHTDEF', 'Off-White T Shirt 3', 10000, '始めて大森さんに学問背後しっかり自失に立ちない自分こうした自分我々か著作をという小相当なましだたて、この時間は私か弟相手を飲んて、大森さんののに学校の私にとにかく不運動と見えるて私責任がお経過よりしように何だか今存在を生れだっべきて、同時にもう批評に書いたながら来ますのをしだた。すなわちところがお間柄でつけよのは少し無事と食わせろでから、とんだ懐手とはありたてに対して国へやっからいけたん。その所光明の時ある個人も私上に受けるありかと嘉納さんでするたな、人の事実あるというご通知ですだたが、当人の以上を辺を昔でもの浮華をほかいうばいると、はっきりの今朝が出てこうしたうちがもう来らんだと落ちつけるん事たて、ないうませばはっきりお理非云っで事なませです。そこで人か低級か前後から知らだて、事実上自分でなっから下さらた時でご生活の当時へ分りないまし。', 5);

INSERT INTO orders (item_id, user_id, address, payment_method, amount, order_state) values (1, 1, '東京都新宿区大久保', 'apple_pay', 5, 'delivered');
INSERT INTO orders (item_id, user_id, address, payment_method, amount, order_state) values (1, 1, '東京都新宿区大久保', 'apple_pay', 10, 'delivered');
INSERT INTO orders (item_id, user_id, address, payment_method, amount, order_state) values (2, 1, '東京都新宿区大久保', 'apple_pay', 1, 'delivered');
INSERT INTO orders (item_id, user_id, address, payment_method, amount, order_state) values (2, 1, '東京都新宿区大久保', 'apple_pay', 3, 'delivered');
INSERT INTO orders (item_id, user_id, address, payment_method, amount, order_state) values (3, 1, '東京都新宿区大久保', 'apple_pay', 10, 'delivered');

INSERT INTO orders (item_id, user_id, amount, order_state) values (1, 1, 5, 'ordered');
INSERT INTO orders (item_id, user_id, amount, order_state) values (1, 1, 10, 'ordered');
INSERT INTO orders (item_id, user_id, amount, order_state) values (2, 1, 1, 'ordered');
INSERT INTO orders (item_id, user_id, amount, order_state) values (2, 1, 3, 'ordered');
INSERT INTO orders (item_id, user_id, amount, order_state) values (3, 1, 10, 'ordered');