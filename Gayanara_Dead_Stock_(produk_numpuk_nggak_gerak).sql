SELECT
    p.name AS nama_produk,
    p.brand AS nama_brand,
    p.stock AS stok,
    COALESCE(valid_sales.total_terjual, 0) AS total_terjual
FROM products p
LEFT JOIN (
    SELECT 
        oi.product_id,
        SUM(oi.quantity) AS total_terjual
    FROM order_items oi
    JOIN orders o ON o.order_id = oi.order_id
    WHERE o.order_status NOT IN ('cancelled', 'returned')
    GROUP BY oi.product_id
) valid_sales ON valid_sales.product_id = p.product_id
WHERE COALESCE(valid_sales.total_terjual, 0) = 0
  AND p.stock > 0
ORDER BY p.stock DESC;