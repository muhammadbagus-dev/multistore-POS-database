SHOW DATABASES;
SHOW TABLES;

CREATE DATABASE multistore_pos_db;

USE multistore_pos_db;

CREATE TABLE stores(
	store_id int UNIQUE NOT NULL AUTO_INCREMENT,
	store_name varchar(100) NOT NULL,
	username varchar(100) UNIQUE NOT NULL,
	password varchar(100) NOT NULL,

    PRIMARY KEY (store_id)
);

CREATE TABLE products(
	product_id int UNIQUE NOT NULL AUTO_INCREMENT,
	store_id int NOT NULL,
	product_name varchar(100) NOT NULL,
	category varchar(100) NOT NULL,
	sub_category varchar(100) NOT NULL,
	unit_price int NOT NULL,

	PRIMARY KEY (product_id),
	FOREIGN KEY products(store_id) REFERENCES stores(store_id)
);

CREATE TABLE cashiers(
	cashier_id int UNIQUE NOT NULL AUTO_INCREMENT,
	store_id int NOT NULL,
	cashier_name varchar(100) NOT NULL,

	PRIMARY KEY (cashier_id),
	FOREIGN KEY cashiers(store_id) REFERENCES stores(store_id)
);

CREATE TABLE payment_methods(
	payment_method_id int UNIQUE NOT NULL AUTO_INCREMENT,
	payment_method_name varchar(100) NOT NULL,
	payment_category enum('Cash', 'Transfer Bank', 'QRIS', 'E-Wallet') NOT NULL,
	description varchar(100) NOT NULL,

	PRIMARY KEY (payment_method_id)
);

CREATE TABLE vouchers(
	voucher_id int UNIQUE NOT NULL AUTO_INCREMENT,
	voucher_code varchar(100) UNIQUE NOT NULL,
	voucher_type enum('Percentage', 'Fixed Amount'),
	discount decimal(12,2) NOT NULL,
	description varchar(100) NOT NULL,

	PRIMARY KEY (voucher_id),

	CHECK (
		(voucher_type = 'Percentage' AND discount BETWEEN 0 AND 100)
		OR
		(voucher_type = 'Fixed Amount' AND discount >= 0)
		)
);

CREATE TABLE orders(
	order_id int UNIQUE NOT NULL AUTO_INCREMENT,
	cashier_id int NOT NULL,
	voucher_id int NOT NULL,
	payment_method_id int NOT NULL,
	original_price decimal(12,2) NOT NULL,
	discount decimal(12,2) NOT NULL,
	total decimal(12,2) NOT NULL,

	PRIMARY KEY (order_id),
	FOREIGN KEY (cashier_id) REFERENCES cashiers(cashier_id),
	FOREIGN KEY (voucher_id) REFERENCES vouchers(voucher_id),
	FOREIGN KEY (payment_method_id) REFERENCES payment_methods(payment_method_id)
);

CREATE TABLE order_items(
	order_item_id int UNIQUE NOT NULL AUTO_INCREMENT,
	order_id int NOT NULL,
	product_id int NOT NULL,
	quantity int NOT NULL,
	total_amount decimal(12,2) NOT NULL,

	PRIMARY KEY (order_item_id),
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);