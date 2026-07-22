SELECT 
	p.product_id,
	p.name AS nama_produk,
    p.brand AS nama_brand,
    SUM(oi.quantity) AS total_unit_terjual
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id 
JOIN products p ON p.product_id = oi.product_id
WHERE o.order_status NOT IN ('cancelled', 'returned')
GROUP BY p.product_id, p.name, p.brand
ORDER BY total_unit_terjual DESC
LIMIT 10;