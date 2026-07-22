SELECT 
    p.brand AS nama_brand,
    SUM(oi.subtotal_idr) AS total_revenue
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id 
JOIN products p ON p.product_id = oi.product_id
WHERE o.order_status NOT IN ('cancelled', 'returned')
GROUP BY p.brand
ORDER BY total_revenue DESC
LIMIT 10;