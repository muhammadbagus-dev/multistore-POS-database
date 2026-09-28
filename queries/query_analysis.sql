-- TOTAL PENJUALAN SETIAP TOKO
SELECT stores.store_name AS 'NAMA TOKO', orders.total AS 'TOTAL PENJUALAN'
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id
JOIN stores ON products.store_id = stores.store_id
GROUP BY stores.store_id;

-- PRODUK TERJUAL DENGAN TINGKAT PALING TINGGI
SELECT products.product_name AS 'NAMA PRODUK', SUM(order_items.quantity) AS 'JUMLAH TERJUAL'
FROM order_items
JOIN products ON order_items.product_id = products.product_id
GROUP BY products.product_id
ORDER BY SUM(order_items.quantity) DESC
LIMIT 1;

-- METODE PEMBAYARAN TERBANYAK DIGUNAKAN
SELECT payment_method_name AS 'METODE PEMBAYARAN', COUNT(orders.payment_method_id) AS 'JUMLAH DIGUNAKAN'
FROM orders
JOIN payment_methods ON orders.payment_method_id = payment_methods.payment_method_id
GROUP BY payment_methods.payment_method_id
ORDER BY payment_methods.payment_method_id
LIMIT 1;

-- RATA-RATA NILAI SELURUH TRANSAKSI
SELECT AVG(orders.total) AS 'RATA-RATA NILAI SELURUH TRANSAKSI'
FROM orders;

-- TOKO DENGAN PENJUALAN TERTINGGI
SELECT stores.store_name AS 'NAMA TOKO', orders.total AS 'TOTAL PENJUALAN'
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id
JOIN stores ON products.store_id = stores.store_id
GROUP BY stores.store_id
ORDER BY stores.store_id DESC
LIMIT 1;

-- PRODUK YANG BELUM PERNAH TERJUAL
SELECT product_id, product_name
FROM products
WHERE NOT EXISTS(SELECT 1
                 FROM order_items
                 WHERE order_items.product_id = products.product_id);