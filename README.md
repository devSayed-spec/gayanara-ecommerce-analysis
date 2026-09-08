# Gayanara: Best-Selling Products, Dead Stock, and Lost Sales Analysis

SQL portfolio project analyzing sales and inventory data for an online fashion store, identifying which products and brands to prioritize for restock, which stock to discount, and where lost sales are hiding.

## Project Information

Role: Data Analyst, Independent Project
Tools: MySQL
Completed: July 2026

This project uses the [Gayanara: Toko Fashion Online](https://ngulikdata.com/datasets/gayanara) simulated business dataset from NgulikData. The business case, questions, and analysis are my own, built on top of this dataset.

## Business Problem

Gayanara's buying team wanted to restock, but the available budget was limited. They needed to know which products were selling best, which brands were contributing the most revenue, which products had sold out despite a track record of sales, and which products were sitting in stock with no sales at all. Making restock decisions based on assumption alone risks re-buying products that don't sell, or leaving products with strong demand out of stock.

## Objective

Analyze sales and inventory data to help the buying team prioritize restocking, discounting, and stock management decisions.

## Business Questions

- Which products make the Top 10 by total units sold?
- Which brand contributes the most revenue?
- Does the highest-revenue brand also sell the most units?
- Which products count as dead stock, meaning stock is available but zero sales?
- Which products have a sales history but zero stock right now, indicating potential lost sales?

## Dataset

Five tables: `customers`, `orders`, `order_items`, `products`, `reviews`.

Worth flagging upfront: this is a simulated e-commerce dataset built for practice purposes, not a real store's transaction records. I'm treating the findings here as an analysis exercise, and the recommendations are based on current stock and sales snapshots rather than a full time-series view of demand.

## Tools and Concepts Used

MySQL, JOINs, LEFT JOIN, subqueries, pre-aggregation in subqueries, conditional filtering on order status.

## Analysis Process

- Imported five raw datasets (`customers`, `orders`, `order_items`, `products`, and `reviews`) into MySQL.
- Fixed date data types using `ALTER TABLE`.
- Joined `orders`, `order_items`, and `products` to build the Top 10 best-selling product ranking.
- Calculated revenue per brand and compared it against total units sold.
- Used a subquery and `LEFT JOIN` to identify dead stock.
- Validated the query results and corrected the revenue calculation and order-status filter along the way.

## Key Findings

**The Top 10 is dominated by two brands.** Riang Apparel accounts for 4 of the 10 products in the Top 10 list, and Tropika Style accounts for 3. Together, these two brands make up 70% of the Top 10 best-selling products list, so demand clearly isn't spread evenly. Casual fashion items like dresses, shirts, and pants dominate the best-sellers.

**Riang Apparel and NusaBrand show different patterns.** Riang Apparel generates the highest revenue at Rp67,939,000. NusaBrand sits right below it at Rp67,409,000, but it doesn't appear in the Top 10 by units sold at all. That means NusaBrand generates high revenue with fewer units, likely a higher average selling price per product, compared to Riang Apparel, which is stronger on volume.

**Leather Belt counts as dead stock.** The Leather Belt from Kanvas Lokal has 120 units in stock but no recorded sales at all. This product doesn't need to be prioritized for restock. A more sensible move is discounting, bundling, or promotion to get the existing stock moving.

**11 products show potential lost sales.** I found 11 products with a sales history but zero stock right now. Dress Mini Casual from Riang Apparel has the highest historical sales volume among the out-of-stock products. This product deserves restock priority, since customers may currently be unable to buy a product that's already proven to have demand.

## What I Learned

- Cancelled and returned orders need to be filtered out before calculating revenue or units sold.
- Pre-aggregating inside a subquery helps ensure the calculation only uses valid orders.
- `subtotal_idr` is the more accurate field for calculating revenue compared to `unit_price_idr`, since subtotal already accounts for the quantity purchased.
- Revenue and units sold don't always move together. A brand with fewer units sold can still have high revenue.
- Dead stock and out-of-stock products need different actions: dead stock needs to be pushed out, while products with potential lost sales need restock priority.
- Business conclusions need to be checked against the data. A conclusion that sounds reasonable isn't necessarily what the query actually shows.

## Mistakes I Found and Fixed

- In an early version of the query, I used `unit_price_idr` to calculate brand revenue. The result came out lower than it should have, since it didn't account for the quantity purchased.
- I initially put the order-status filter in the `WHERE` clause. This caused products with zero sales to disappear from the `LEFT JOIN` result, but those products were exactly what the dead-stock analysis needed to see.
- When importing the CSVs, I converted several columns to `DATETIME` right away without checking the original date format first. Three tables failed to import as a result.
- An early draft of the analysis stated that product demand was fairly evenly spread across brands. After double-checking, it turned out Riang Apparel and Tropika Style together account for 70% of the Top 10 products.

## What I'd Do Differently Next Time

- Analyze sales trends over time using `order_date`, instead of only looking at aggregate totals.
- Use the `customers` and `reviews` tables to look at customer segmentation and satisfaction.
- Check the date format before converting a column's type during import.
- Re-check every narrative conclusion against the query results before writing the final summary.

## Recommendations

Prioritize restock for products with potential lost sales. Restock budget should go first to products with a strong sales history but zero current stock. Dress Mini Casual from Riang Apparel is the top priority, given its high historical sales volume and current unavailability.

Don't restock Leather Belt until the existing stock moves. Leather Belt from Kanvas Lokal still has 120 units in stock and no recorded sales. It's better suited to a discount, bundle, or promotion push than a re-buy.

Use a different approach for Riang Apparel and NusaBrand. Riang Apparel is strong on volume and dominates both the best-seller list and the potential-lost-sales list, so its stock availability needs to be protected. NusaBrand generates high revenue despite not making the Top 10 by units, so it's worth evaluating from a pricing and product-positioning angle instead.

## SQL Files

- Gayanara_top_10_produk_terlaris.sql: Top 10 products by total units sold.
- Gayanara_Brand_dengan_Revenue_Terbesar.sql: total revenue by brand.
- Gayanara_Dead_Stock_(produk_numpuk_nggak_gerak).sql: products with stock available but zero sales.
- Gayanara_Lost_Sales_(produk_laris_tapi_stok_habis).sql: products with a sales history but currently zero stock.

## Data Source

Dataset: [Gayanara: Toko Fashion Online](https://ngulikdata.com/datasets/gayanara), NgulikData.

## Author

Data Analyst Portfolio: [sayedfurqan.lovable.app](https://sayedfurqan.lovable.app/)
