# Gayanara: Best-Selling Products vs Dead Stock Analysis

**Role:** Data Analyst (Independent Project) | **Tools:** MySQL | **Date:** Jul 2026

## Business Understanding

**Problem:** Gayanara's buying team has a limited restock budget but lacks clear data on
which products actually sell best, which brands drive the most value, and which
products are at risk of stockouts or sitting unsold in the warehouse.

**Objective:** Analyze Gayanara's sales and inventory data to help the buying team
allocate the restock budget more precisely.

**Business Questions:**
1. Which products make up the Top 10 best-selling products?
2. Which brand generates the highest revenue, and does it align with the brand whose products sell the most units?
3. Which products qualify as *dead stock* (high inventory, zero sales) and should be considered for discounting?
4. Which products qualify as *lost sales* (strong sales history but currently out of stock) and should be prioritized for restocking?

## Process
- Imported 5 raw datasets (customers, orders, order_items, products, reviews) into MySQL
- Fixed date column data types using `ALTER TABLE` after the initial import failed
- Identified and excluded invalid order statuses (cancelled, returned) before analysis
- Joined `order_items`, `orders`, and `products` to rank the Top 10 best-selling products
- Aggregated revenue by brand to compare against units sold
- Used a subquery with `LEFT JOIN` to identify dead stock (unsold inventory)
- Used `INNER JOIN` with `HAVING` to identify lost sales (out-of-stock, high demand)

## Key Findings

**Top 10 Best-Selling Products** dominated by casual fashion items (dresses, shirts, pants) spread across several brands; no single brand dominates all Top 10 slots.

**Brand with the Highest Revenue** Riang Apparel and NusaBrand are the top two brands, with nearly equal revenue. Interestingly, the brand with the highest revenue isn't always the brand with the most units sold, suggesting some brands sell fewer items but at a higher price point.

**Dead Stock (Discount Recommendation)** One product was found with 120 units of unsold inventory, a strong candidate for discounting or bundling.

**Lost Sales (Priority Restock Recommendation)** 11 products with strong sales history are currently at zero stock. The "Casual Mini Dress" (Riang Apparel) appears in 3 out-of-stock variants — the #1 restock priority.

## Recommendations
- **Priority restock:** allocate budget first to products on the Lost Sales list, especially the Casual Mini Dress variant
- **Discount/bundling:** the dead stock "Leather Belt" (Kanvas Lokal) with 120 unsold units should be pushed through promotions rather than restocked
- **Brand-level evaluation:** brands with high revenue but moderate units sold may suit a premium/high-margin strategy, different from high-volume, lower-price brands

## What I Learned
- `LEFT JOIN` was needed to keep unsold products visible (dead stock), while `INNER JOIN` was enough for lost sales since it only needed products with sales history
- Pre-aggregating data in a subquery before joining helped correctly separate valid orders from cancelled/returned ones
- Revenue and units sold don't always align a brand can earn the highest revenue without selling the most units
- "Low stock" isn't one problem: dead stock needs discounting, lost sales needs urgent restocking

## Files
- `Gayanara_top_10_produk_terlaris.sql` — Top 10 best-selling products
- `Gayanara_Brand_dengan_Revenue_Terbesar.sql` — Revenue by brand
- `Gayanara_Lost_Sales.sql` — Products with strong sales history but zero stock
- `Gayanara_Dead_Stock.sql` — Unsold inventory (zero sales, stock > 0)

## Full Project Write-up
[Notion Portfolio](https://bit.ly/4fgJ6Zv)
