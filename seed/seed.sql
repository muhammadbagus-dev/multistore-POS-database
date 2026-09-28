INSERT INTO stores (store_name, username, password)
VALUES ('Toko Sembada', 'sembada_store', 'Sembada#4721'),
       ('Toko Nusantara', 'nusantara_store', 'Nusa@8394'),
       ('Toko Arunika', 'arunika_store', 'Arunika!6158'),
       ('Toko Cakrawala', 'cakrawala_store', 'Cakra#2947'),
       ('Toko Lentera', 'lentera_store', 'Lentera@5832');

INSERT INTO products (store_id, product_name, category, sub_category, unit_price)
VALUES (1, 'Indomie Goreng', 'Food', 'Instant Noodles', 3500.00),
       (1, 'Aqua 600ml', 'Beverage', 'Mineral Water', 4000.00),
       (1, 'Chitato Original', 'Snack', 'Chips', 11000.00),
       (1, 'Sari Roti Tawar', 'Bakery', 'Bread', 15000.00),
       (1, 'Teh Pucuk Harum', 'Beverage', 'Tea', 5000.00),
       (2, 'Mie Sedaap Goreng', 'Food', 'Instant Noodles', 3500.00),
       (2, 'Le Minerale 600ml', 'Beverage', 'Mineral Water', 4000.00),
       (2, 'Taro Net', 'Snack', 'Chips', 9000.00),
       (2, 'Roti Tawar Sari Roti', 'Bakery', 'Bread', 15000.00),
       (2, 'Ultra Milk 250ml', 'Beverage', 'Milk', 7000.00),
       (3, 'Pop Mie Ayam', 'Food', 'Instant Noodles', 6500.00),
       (3, 'Coca Cola 390ml', 'Beverage', 'Soft Drink', 6000.00),
       (3, 'Oreo Original', 'Snack', 'Biscuits', 9500.00),
       (3, 'Roma Kelapa', 'Snack', 'Biscuits', 8000.00),
       (3, 'Good Day Cappuccino', 'Beverage', 'Coffee', 6500.00),
       (4, 'Sarimi Ayam Bawang', 'Food', 'Instant Noodles', 3000.00),
       (4, 'Teh Botol Sosro', 'Beverage', 'Tea', 5000.00),
       (4, 'SilverQueen Almond', 'Snack', 'Chocolate', 18000.00),
       (4, 'Biskuat Original', 'Snack', 'Biscuits', 8500.00),
       (4, 'Bear Brand 189ml', 'Beverage', 'Milk', 11000.00),
       (5, 'Indomie Soto', 'Food', 'Instant Noodles', 3500.00),
       (5, 'Sprite 390ml', 'Beverage', 'Soft Drink', 6000.00),
       (5, 'Qtela Tempe', 'Snack', 'Chips', 10000.00),
       (5, 'Pocky Chocolate', 'Snack', 'Biscuits', 12000.00),
       (5, 'Indomilk Chocolate 190ml', 'Beverage', 'Milk', 6000.00);

INSERT INTO cashiers (store_id, cashier_name)
VALUES (1, 'Andi Pratama'),
       (1, 'Siti Rahma'),
       (2, 'Budi Santoso'),
       (2, 'Dina Lestari'),
       (3, 'Rizky Maulana'),
       (3, 'Nadia Putri'),
       (4, 'Fajar Nugroho'),
       (4, 'Aulia Safitri'),
       (5, 'Dimas Saputra'),
       (5, 'Maya Permata');

INSERT INTO payment_methods (payment_method_name, payment_category, description)
VALUES ('Cash', 'cash', 'Pembayaran secara tunai'),
       ('BCA', 'transfer bank', 'Nomor Rekening: 000-000-000'),
       ('BRI', 'transfer bank', 'Nomor Rekening: 000-000-000'),
       ('QRIS', 'qris', 'Barcode Link'),
       ('GoPay', 'e-wallet', 'Nomor Gopay'),
       ('ShopeePay', 'e-wallet', 'Nomor ShopeePay'),
       ('OVO', 'e-wallet','Nomor OVO'),
       ('DANA', 'e-wallet', 'Nomor DANA');

INSERT INTO vouchers (voucher_code, voucher_type, discount, description)
VALUES ('HEMAT10', 'percentage', 10.00, 'Diskon 10% untuk seluruh produk'),
       ('HEMAT20', 'percentage', 20.00, 'Diskon 20% untuk transaksi tertentu'),
       ('POTONG5K', 'fixed amount', 5000.00, 'Potongan harga Rp5.000'),
       ('POTONG10K', 'fixed amount', 10000.00, 'Potongan harga Rp10.000'),
       ('NEWUSER15', 'percentage', 15.00, 'Diskon 15% untuk pelanggan baru'),
       ('BELANJA25', 'percentage', 25.00, 'Diskon 25% untuk pembelian tertentu'),
       ('PROMO20K', 'fixed amount', 20000.00, 'Potongan harga Rp20.000'),
       ('WEEKEND10', 'percentage', 10.00, 'Diskon 10% khusus akhir pekan'),
       ('FLASH15K', 'fixed amount', 15000.00, 'Potongan harga Rp15.000'),
       ('SPECIAL30', 'percentage', 30.00, 'Diskon 30% untuk promo spesial');

INSERT INTO orders (cashier_id, voucher_id, payment_method_id, original_price, discount, total)
VALUES (1, 1, 1, 42000.00, 4200.00, 37800.00),
       (3, 3, 2, 40000.00, 5000.00, 35000.00),
       (5, 2, 3, 38000.00, 7600.00, 30400.00),
       (7, 4, 4, 50000.00, 10000.00, 40000.00),
       (9, 5, 5, 48000.00, 7200.00, 40800.00),
       (4, 7, 6, 58000.00, 20000.00, 38000.00),
       (6, 6, 7, 57500.00, 14375.00, 43125.00),
       (8, 8, 8, 66500.00, 6650.00, 59850.00),
       (10, 9, 1, 54000.00, 15000.00, 39000.00),
       (2, 10, 2, 56000.00, 16800.00, 39200.00);

INSERT INTO order_items (order_id, product_id, quantity, total_amount)
VALUES (1, 1, 4, 14000.00),
       (1, 2, 2, 8000.00),
       (1, 5, 1, 5000.00),
       (1, 4, 1, 15000.00),

       (2, 6, 4, 14000.00),
       (2, 7, 2, 8000.00),
       (2, 8, 2, 18000.00),

       (3, 11, 2, 13000.00),
       (3, 12, 1, 6000.00),
       (3, 13, 2, 19000.00),

       (4, 16, 4, 12000.00),
       (4, 17, 2, 10000.00),
       (4, 19, 2, 17000.00),
       (4, 20, 1, 11000.00),

       (5, 21, 4, 14000.00),
       (5, 22, 2, 12000.00),
       (5, 23, 1, 10000.00),
       (5, 25, 2, 12000.00),

       (6, 6, 4, 14000.00),
       (6, 9, 2, 30000.00),
       (6, 10, 2, 14000.00),

       (7, 11, 2, 13000.00),
       (7, 14, 2, 16000.00),
       (7, 15, 2, 13000.00),
       (7, 12, 1, 6000.00),
       (7, 13, 1, 9500.00),

       (8, 16, 4, 12000.00),
       (8, 18, 2, 36000.00),
       (8, 17, 2, 10000.00),
       (8, 19, 1, 8500.00),

       (9, 21, 4, 14000.00),
       (9, 24, 2, 24000.00),
       (9, 23, 1, 10000.00),
       (9, 22, 1, 6000.00),

       (10, 1, 4, 14000.00),
       (10, 3, 2, 22000.00),
       (10, 4, 1, 15000.00),
       (10, 5, 1, 5000.00);