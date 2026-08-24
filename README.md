# Gayanara: Best-Selling Products, Dead Stock, and Stockout Risk Analysis

SQL portfolio project focused on sales and inventory analysis for a fictional retail business.

## Project Information

**Role:** Data Analyst, Independent Project  
**Tools:** MySQL  
**Date:** July 2026  

This project was completed independently using a dataset and business case provided by Ngulik Data.

## Business Problem

Gayanara's buying team has a limited restocking budget but lacks visibility into which products have strong demand, which brands generate the highest revenue, and which products should be restocked or cleared from inventory.

This analysis helps the team make better decisions for restocking, discounting, and inventory allocation.

## Business Questions

1. Which products are included in the Top 10 best-selling products?
2. Which brands generate the highest revenue, and does this align with unit sales?
3. Which products have available inventory but zero recorded sales?
4. Which products have historical sales but currently have zero stock?

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
4. Combined `orders`, `order_items`, and `products` to identify best-selling products.
5. Calculated revenue by brand and compared it with unit sales.
6. Used `LEFT JOIN` to identify products with available inventory but zero recorded sales.
7. Used `INNER JOIN` to identify products with historical sales but zero current stock.
8. Used pre-aggregation in subqueries to ensure that only valid orders were included in revenue calculations.

## Key Findings

### Top 10 Products Are Concentrated in Two Brands

Riang Apparel contributed 4 out of 10 products in the Top 10 list, while Tropika Style contributed 3 products.

Together, these two brands represented 70% of the Top 10 best-selling products. Demand is concentrated rather than evenly distributed across brands.

### Revenue and Unit Sales Tell Different Stories

Riang Apparel generated the highest revenue at **Rp67.939.000**, followed closely by NusaBrand at **Rp67.409.000**.

However, NusaBrand did not appear in the Top 10 best-selling products. This indicates that NusaBrand generated high revenue with fewer units sold, likely because of a higher average selling price compared with volume-driven brands such as Riang Apparel.

### One Product Requires Dead Stock Review

Leather Belt from Kanvas Lokal had:

- **120 units in stock**
- **Zero recorded sales**

The product is a strong candidate for discount, bundling, or promotion rather than restocking.

### Eleven Products Have Stockout Risk

Eleven products had historical sales but currently had zero stock.

Dress Mini Casual from Riang Apparel showed the strongest historical sales among out-of-stock products. This supports the finding that Riang Apparel has strong demand and should be prioritized in restocking decisions.

## Recommendations

1. Prioritize restocking products in the stockout-risk list, especially Dress Mini Casual from Riang Apparel.
2. Do not restock Leather Belt from Kanvas Lokal before reducing existing inventory.
3. Use discounts, bundles, or promotions to move products with zero recorded sales.
4. Prioritize product availability for Riang Apparel because of its strong demand.
5. Evaluate NusaBrand with a higher-value product strategy because of its strong revenue contribution despite lower unit volume.

## Important Data Validation

### Revenue Aggregation Error

The first brand revenue query used `unit_price_idr` instead of `subtotal_idr`.

This underestimated total revenue because the calculation did not account for the number of units purchased. The query was corrected by using the transaction subtotal field.

### LEFT JOIN Filtering Issue

A filter for order status was initially placed in the `WHERE` clause.

This broke the `LEFT JOIN` logic and excluded products with zero sales from the dead stock analysis. The issue was corrected by filtering invalid order statuses before the join through a subquery.

### Date Conversion Issue

Initial date conversion during CSV import failed because the original date format was incompatible with `DATETIME`.

The issue was resolved by importing date columns as text first and converting them using `ALTER TABLE`.

### Narrative Validation

An early draft concluded that demand was evenly distributed across brands.

After validating the results, Riang Apparel and Tropika Style were found to account for 70% of the Top 10 best-selling products. The conclusion was revised to reflect demand concentration.

## Future Improvements

- Analyze monthly sales trends using `order_date`.
- Calculate repeat purchase behavior and average order value.
- Use `customers` and `reviews` tables for customer segmentation and satisfaction analysis.
- Add product-level profitability analysis if cost data becomes available.

## SQL Files

- `Gayanara_top_10_produk_terlaris.sql`  
  Identifies the Top 10 best-selling products.

- `Gayanara_Brand_dengan_Revenue_Terbesar.sql`  
  Calculates and ranks total revenue by brand.

- `Gayanara_Lost_Sales.sql`  
  Identifies products with historical sales but zero current stock.

- `Gayanara_Dead_Stock.sql`  
  Identifies products with available inventory but zero recorded sales.

## Full Case Study

For detailed business context, SQL query explanations, data validation notes, and learning reflections, read the complete case study on Notion:

[Read the full Gayanara Sales and Inventory Analysis case study](https://bit.ly/4fgJ6Zv)

## Author

**Sayed Furqan**

Data Analyst Portfolio: [sayedfurqan.lovable.app](https://sayedfurqan.lovable.app/)
