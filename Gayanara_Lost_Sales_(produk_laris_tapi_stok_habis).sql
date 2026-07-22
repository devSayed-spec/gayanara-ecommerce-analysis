SELECT
    p.name AS nama_produk,
    p.brand AS nama_brand,
    p.stock AS stok,
    SUM(oi.quantity) AS total_terjual
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.order_status NOT IN ('cancelled', 'returned')
GROUP BY p.product_id, p.name, p.brand, p.stock
HAVING p.stock = 0
ORDER BY total_terjual DESC;