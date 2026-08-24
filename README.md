# Gayanara: Best-Selling Products, Dead Stock, and Potential Lost Sales Analysis

SQL portfolio project focused on sales, inventory, and restocking analysis for a fictional retail business.

## Project Information

**Role:** Data Analyst, Independent Project  
**Tools:** MySQL  
**Completed:** July 2026  

This project was completed independently using a dataset and business case provided by Ngulik Data.

## Business Problem

Gayanara's buying team needs to restock products with a limited budget.

The team needs to know which products sell the most, which brands are the strongest revenue contributors, which popular products are currently out of stock, and which products are accumulating inventory without sales.

The goal is to prevent restocking budget from being allocated to the wrong products.

## Business Questions

1. Which products are included in the Top 10 best-selling products based on total units sold?
2. Which brands generate the highest revenue?
3. Which popular products have zero current stock and may create potential lost sales?
4. Which products have available stock but zero recorded sales and should be considered dead stock?

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
4. Combined `orders`, `order_items`, and `products` to identify the Top 10 best-selling products.
5. Calculated revenue by brand and compared it with total unit sales.
6. Used `LEFT JOIN` to identify dead stock, including products with stock but zero recorded sales.
7. Used `INNER JOIN` to identify popular products with historical sales but zero current stock.
8. Used pre-aggregation in subqueries to ensure only valid orders were included in revenue calculations.

## Key Findings

### Top 10 Products Are Concentrated in Two Brands

Riang Apparel contributed 4 out of 10 products in the Top 10 best-selling list, while Tropika Style contributed 3 products.

Together, these two brands represented 70% of the Top 10 products. This shows that demand is concentrated rather than evenly distributed across brands.

### Revenue and Unit Sales Tell Different Stories

Riang Apparel generated the highest revenue at **Rp67.939.000**, followed closely by NusaBrand at **Rp67.409.000**.

However, NusaBrand did not appear in the Top 10 best-selling products. This indicates that NusaBrand generated high revenue with fewer units sold, likely because of a higher average selling price compared with volume-driven brands such as Riang Apparel.

### One Product Is Classified as Dead Stock

Leather Belt from Kanvas Lokal had:

- **120 units in stock**
- **Zero recorded sales**

This product is a strong candidate for discount, bundling, or promotion rather than restocking.

### Eleven Products Indicate Potential Lost Sales

Eleven products had strong historical sales but currently had zero stock.

Dress Mini Casual from Riang Apparel had the highest sales volume among the out-of-stock products. This indicates potential lost sales and supports prioritizing the product for restocking.

## Recommendations

1. Prioritize restocking products in the potential lost-sales list, especially Dress Mini Casual from Riang Apparel.
2. Do not restock Leather Belt from Kanvas Lokal before reducing the existing inventory.
3. Use discounts, bundles, or promotions to move dead stock.
4. Prioritize product availability for Riang Apparel because of its strong demand in both the Top 10 list and potential lost-sales analysis.
5. Review NusaBrand's pricing and product strategy because it generates high revenue despite lower unit volume.

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
  Identifies the Top 10 best-selling products based on total units sold.

- `Gayanara_Brand_dengan_Revenue_Terbesar.sql`  
  Calculates and ranks total revenue by brand.

- `Gayanara_Lost_Sales.sql`  
  Identifies high-demand products with zero current stock, indicating potential lost sales.

- `Gayanara_Dead_Stock.sql`  
  Identifies products with available inventory but zero recorded sales.

## Full Case Study

For detailed business context, SQL query explanations, data validation notes, and learning reflections, read the complete case study on Notion:

[Read the full Gayanara Sales and Inventory Analysis case study](https://bit.ly/4fgJ6Zv)

## Author

**Sayed Furqan**

Data Analyst Portfolio: [sayedfurqan.lovable.app](https://sayedfurqan.lovable.app/)
