# Gayanara: Best-Selling Products, Dead Stock, and Lost Sales Analysis

SQL portfolio project focused on sales and inventory analysis for a fictional retail business.

## Project Information

**Role:** Data Analyst, Independent Project  
**Tools:** MySQL  
**Date:** July 2026  

This project was completed independently using a dataset and business case provided by Ngulik Data.

## Business Problem

Gayanara's buying team has a limited restocking budget but lacks visibility into which products have strong demand, which brands generate the highest revenue, and which products should be restocked or cleared from inventory.

This analysis helps the team make better restocking, discount, and product-prioritization decisions.

## Business Questions

1. Which products are included in the Top 10 best-selling products?
2. Which brands generate the highest revenue, and does this align with unit sales?
3. Which products are dead stock and should be considered for discount or bundling?
4. Which products have strong sales history but currently have zero stock?

## Dataset

The analysis uses five tables:

- `customers`
- `orders`
- `order_items`
- `products`
- `reviews`

## Tools and SQL Concepts

- MySQL
- `INNER JOIN`
- `LEFT JOIN`
- Subqueries
- Pre-aggregation
- `GROUP BY`
- `ORDER BY`
- Aggregate functions
- `WHERE`
- `ALTER TABLE`

## Analysis Process

1. Imported five raw datasets into MySQL.
2. Fixed date data types using `ALTER TABLE`.
3. Excluded cancelled and returned orders before calculating sales and revenue.
4. Combined orders, order items, and products to identify best-selling products.
5. Calculated revenue by brand and compared it with unit sales.
6. Used `LEFT JOIN` to identify dead stock, including products with zero sales.
7. Used `INNER JOIN` to identify products with historical demand but zero current stock.

## Key Findings

### Top 10 Products Are Concentrated in Two Brands

Riang Apparel contributed 4 out of 10 products in the Top 10 list, while Tropika Style contributed 3 products.

Together, these two brands represented 70% of the Top 10 best-selling products. Demand is concentrated, not evenly distributed across brands.

### Revenue and Unit Sales Are Different

Riang Apparel generated the highest revenue at **Rp67.939.000**, followed by NusaBrand at **Rp67.409.000**.

NusaBrand did not appear in the Top 10 best-selling products. This indicates that it generated high revenue with fewer units sold, likely because of a higher average selling price.

### One Product Is Dead Stock

**Leather Belt** from Kanvas Lokal had:

- 120 units in stock
- Zero sales

The product should be considered for discount, bundling, or promotion rather than restocking.

### Eleven Products Have Stockout Risk

Eleven products had historical sales but zero current stock.

**Dress Mini Casual** from Riang Apparel had the highest lost-sales volume among out-of-stock products. This supports the finding that Riang Apparel has the strongest demand and should be prioritized in restocking decisions.

## Recommendations

1. Prioritize restocking products in the stockout-risk list, especially Dress Mini Casual from Riang Apparel.
2. Do not restock Leather Belt from Kanvas Lokal before reducing its existing inventory.
3. Use discounts, bundles, or promotions to move dead stock.
4. Treat Riang Apparel as a volume-driven brand and prioritize availability for its highest-demand products.
5. Evaluate NusaBrand with a higher-value product strategy because of its strong revenue contribution despite lower unit volume.

## Important Data Validation

During the project, I identified and fixed several analysis issues:

- The first revenue query used `unit_price_idr` instead of `subtotal_idr`, which underestimated total brand revenue.
- A filter for order status was initially placed in the `WHERE` clause, which broke the `LEFT JOIN` and excluded valid zero-sales products from dead stock analysis.
- Initial date conversion during CSV import failed because the original format was incompatible with `DATETIME`.
- An early narrative conclusion stated that demand was evenly distributed, but result validation showed that two brands accounted for 70% of the Top 10 products.

## Future Improvements

- Analyze monthly sales trends using `order_date`.
- Calculate repeat purchase behavior and average order value.
- Use `customers` and `reviews` tables for customer segmentation and satisfaction analysis.
- Add product-level profitability if cost data becomes available.

## SQL Files

- `Gayanara_top_10_produk_terlaris.sql`  
  Identifies the Top 10 best-selling products.

- `Gayanara_Brand_dengan_Revenue_Terbesar.sql`  
  Calculates and ranks total revenue by brand.

- `Gayanara_Lost_Sales.sql`  
  Identifies products with historical sales but zero current stock.

- `Gayanara_Dead_Stock.sql`  
  Identifies products with available inventory but zero sales.

## Full Case Study

Read the complete case study, including detailed business context, query explanations, and learning notes:

Notion: [https://bit.ly/4fgJ6Zv]

## Author

**Sayed Furqan**

Portfolio: [sayedfurqan.lovable.app](https://sayedfurqan.lovable.app/)
