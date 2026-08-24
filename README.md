# Gayanara: Best-Selling Products, Dead Stock, and Potential Lost Sales

SQL portfolio project focused on sales, inventory, and restocking decisions for a fictional retail business.

## Project Information

**Role:** Data Analyst, Independent Project  
**Tools:** MySQL  
**Completed:** July 2026  

This project was completed independently using a dataset and business case provided by Ngulik Data.

## Business Problem

Gayanara's buying team needs to restock products, but the available budget is limited.

They need to know which products sell the most, which brands contribute the most revenue, which popular products are out of stock, and which products are sitting in inventory without sales.

Without this information, the team may restock slow-moving products while leaving high-demand products unavailable.

## Objective

This project analyzes sales and inventory data to help the buying team decide which products should be restocked, discounted, or reviewed further.

## Business Questions

1. Which products are included in the Top 10 based on total units sold?
2. Which brands generate the highest revenue?
3. Does the brand with the highest revenue also sell the most units?
4. Which products are considered dead stock, meaning they have available inventory but zero recorded sales?
5. Which products have sales history but zero current stock, indicating potential lost sales?

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

1. Imported five raw datasets into MySQL: `customers`, `orders`, `order_items`, `products`, and `reviews`.
2. Fixed date data types using `ALTER TABLE`.
3. Excluded cancelled and returned orders before calculating revenue and units sold.
4. Joined `orders`, `order_items`, and `products` to rank the Top 10 best-selling products.
5. Calculated revenue by brand and compared it with total units sold.
6. Used subqueries and `LEFT JOIN` to identify dead stock.
7. Used `INNER JOIN` to identify products with sales history but zero current stock.
8. Validated the query results and corrected the revenue calculation and order-status filtering logic.

## Key Findings

### Top 10 Products Are Dominated by Two Brands

Riang Apparel contributed 4 out of 10 products in the Top 10 list, while Tropika Style contributed 3 products.

Together, the two brands accounted for 70% of the Top 10 best-selling products. Demand is not evenly distributed across brands. Casual fashion items such as dresses, shirts, and pants dominate the list.

### Riang Apparel and NusaBrand Show Different Sales Patterns

Riang Apparel generated the highest revenue at **Rp67.939.000**, followed closely by NusaBrand at **Rp67.409.000**.

However, NusaBrand did not appear in the Top 10 based on units sold. This suggests that NusaBrand generated high revenue with fewer units, likely because its products have a higher average selling price than Riang Apparel, which is stronger in sales volume.

### Leather Belt Is Dead Stock

Leather Belt from Kanvas Lokal had:

- **120 units in stock**
- **Zero recorded sales**

The product should not be prioritized for restocking. A discount, bundle, or promotion would be a more reasonable next step to move the existing inventory.

### Eleven Products Show Potential Lost Sales

I found 11 products with sales history but zero current stock.

Among the out-of-stock products, Dress Mini Casual from Riang Apparel had the strongest sales history. It should be prioritized for restocking because customers may not be able to purchase a product that has already shown demand.

## What I Learned

- Cancelled and returned orders need to be excluded before calculating revenue or units sold.
- Pre-aggregation in a subquery helps make sure that revenue calculations only include valid orders.
- `subtotal_idr` is more suitable than `unit_price_idr` for calculating revenue because it already reflects the quantity purchased.
- Revenue and unit sales do not always move together. A brand can generate high revenue even with lower unit sales.
- Dead stock and out-of-stock products need different actions. Dead stock should be cleared through discounts or bundles, while products with potential lost sales should be prioritized for restocking.
- Business conclusions need to be checked against the data. A conclusion that sounds reasonable is not always supported by the query results.

## Mistakes I Found and Fixed

### Using the Wrong Column for Brand Revenue

In the first version of the brand revenue query, I used `unit_price_idr`.

This caused total revenue to be lower than it should have been because the number of units purchased was not included. I corrected the calculation by using `subtotal_idr`.

### Filtering Order Status in the Wrong Place

I initially placed the order-status filter in the `WHERE` clause.

This caused products with no sales to disappear from the `LEFT JOIN` result, even though those products were important for dead stock analysis. I fixed this by filtering invalid orders in a subquery before the join.

### Date Import Failed

When importing the CSV files, I changed several columns directly to `DATETIME` without checking the original date format.

Three tables failed to import. I fixed this by importing the date columns as text first, then converting them with `ALTER TABLE`.

### My First Conclusion Was Incorrect

An early draft suggested that demand was fairly evenly distributed across brands.

After checking the results again, Riang Apparel and Tropika Style were found to account for 70% of the Top 10 best-selling products. I revised the conclusion to reflect that demand is actually concentrated.

## What I Would Do Differently Next Time

- Analyze sales trends over time using `order_date`, instead of relying only on total aggregate values.
- Use the `customers` and `reviews` tables to explore customer segments and customer satisfaction.
- Check date formats before changing column types during data import.
- Review every written conclusion against the actual query results before writing the final summary.

## Recommendations

### Prioritize Restocking Products with Potential Lost Sales

Restocking budget should first be allocated to products with strong sales history but zero current stock.

Dress Mini Casual from Riang Apparel is a priority because it has strong historical sales and is currently unavailable.

### Do Not Restock Leather Belt Before Clearing Existing Stock

Leather Belt from Kanvas Lokal still has 120 units in stock and no recorded sales.

Instead of buying more inventory, the business should try discounts, bundles, or promotions to move the existing stock.

### Use Different Approaches for Riang Apparel and NusaBrand

Riang Apparel is strong in sales volume and appears in both the Top 10 list and the potential lost-sales list.

NusaBrand generates high revenue despite not appearing in the Top 10 by unit sales. Riang Apparel should be kept in stock, while NusaBrand can be reviewed further from a pricing and product-positioning perspective.

## SQL Files

- `Gayanara_top_10_produk_terlaris.sql`  
  Identifies the Top 10 products based on total units sold.

- `Gayanara_Brand_dengan_Revenue_Terbesar.sql`  
  Calculates and ranks total revenue by brand.

- `Gayanara_Lost_Sales.sql`  
  Identifies products with sales history but zero current stock, indicating potential lost sales.

- `Gayanara_Dead_Stock.sql`  
  Identifies products with available inventory but zero recorded sales.

## Full Case Study

For the complete business context, detailed SQL explanations, and learning notes, read the full case study on Notion:

[Read the full Gayanara Sales and Inventory Analysis case study](https://bit.ly/4fgJ6Zv)

## Author

**Sayed Furqan**

Data Analyst Portfolio: [sayedfurqan.lovable.app](https://sayedfurqan.lovable.app/)
