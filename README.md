# Amazon E-Commerce SQL & Power BI Analysis Project

<img width="960" height="540" alt="Amazon sql" src="https://github.com/user-attachments/assets/00377ef8-bc69-4225-a118-fe1691684ae6" />


## Project Background

This project simulates an **Amazon-style e-commerce business** operating in the online retail industry.  
The company sells multiple product categories (e.g., Electronics, Home & Kitchen, Sports & Outdoors) across different regions and serves thousands of customers.

From a data analyst’s perspective, the business wanted better visibility into:

- Sales performance  
- Customer value  
- Product profitability  
- Regional demand trends  

The primary business metrics analyzed in this project include:
- Total Revenue  
- Total Profit  
- Total Orders  
- Customer Lifetime Value (CLV)  
- Average Order Value (AOV)  
- Product Profit Margins  

Insights and recommendations are provided on the following key areas:

- Sales Performance  
- Product & Profitability  
- Customer Insights  
- Regional Performance  

The interactive Power BI dashboard used to report and explore sales trends can be found here:  

<img width="2816" height="1536" alt="Amazon Power BI Dashboard" src="https://github.com/user-attachments/assets/3503b41d-66fb-4baf-8e3a-a404f8c36b4e" />


---

## Data Structure & Initial Checks

The main database structure consists of the following tables:

- **customers** – customer details (name, email, city, country, signup date)  
- **products** – product information (name, category, price, cost)  
- **orders** – order-level transactions (order date, total amount, discount applied)  
- **order_details** – line-item order data (product, quantity, unit price)  
- **reviews** – product ratings and reviews  
- **wishlist** – customer wishlist behavior  

Each table is linked using primary and foreign keys to ensure referential integrity.

Entity Relationship Diagram (ERD):  

<img width="2816" height="1536" alt="(ER) Diagram – Amazon E-Commerce SQL Project" src="https://github.com/user-attachments/assets/6974acd0-b185-4a50-8ac0-177800e185ff" />


---
# 🛒 Amazon E-Commerce Data Analysis: Top 5 Strategic SQL Queries

This section highlights the most impactful SQL queries used to solve critical business problems such as profit analysis, customer retention, and sales trends.

---

### 1. Sales Impact Analysis: Before vs. After Discount
**Business Problem:** How did the discount campaign starting on Dec 1st affect sales volume for lower-priced products?
**Technique:** `CASE WHEN` statement for conditional aggregation.

```sql
SELECT 
    p.ProductName,
    SUM(CASE WHEN o.OrderDate < '2023-12-01' THEN od.Quantity * od.UnitPrice ELSE 0 END) AS SalesBeforeDiscount,
    SUM(CASE WHEN o.OrderDate >= '2023-12-01' THEN od.Quantity * od.UnitPrice ELSE 0 END) AS SalesAfterDiscount
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductID IN (SELECT ProductID FROM Products WHERE Price < 100)
GROUP BY p.ProductName;

## Executive Summary

### Overview of Findings

This analysis reveals that a small number of products and customers generate a large share of total revenue and profit.  
Discounts increase sales volume but negatively impact profit margins, while certain regions consistently outperform others.  
Products with higher ratings and wishlist activity show stronger demand and better sales performance.

Power BI Dashboard Snapshot:  

<img width="2816" height="1536" alt="Amazon Power BI Dashboard" src="https://github.com/user-attachments/assets/3503b41d-66fb-4baf-8e3a-a404f8c36b4e" />

---

## Insights Deep Dive

### 1️⃣ Sales Performance

**Insight 1:**  
Monthly sales show an overall upward trend, with noticeable seasonality during peak months.

**Insight 2:**  
The top 5 products account for a significant percentage of total sales volume.

**Insight 3:**  
Discounted orders generate higher sales volume but lower profit margins.

**Insight 4:**  
Low-selling products still contribute meaningful profit due to higher margins.

---

### 2️⃣ Product & Profitability

**Insight 1:**  
Electronics is the most profitable category overall.

**Insight 2:**  
A few products generate disproportionately high profit margins.

**Insight 3:**  
Some high-revenue products operate on thin margins.

**Insight 4:**  
Profitability varies significantly across categories.

---

### 3️⃣ Customer Insights

**Insight 1:**  
A small group of high-value customers contributes a large share of total revenue.

**Insight 2:**  
Customer Lifetime Value (CLV) varies widely across segments.

**Insight 3:**  
Repeat customers show higher average order values.

**Insight 4:**  
Customers with wishlist activity tend to convert at higher rates.

---

### 4️⃣ Regional Performance

**Insight 1:**  
North America is the dominant market in total sales.

**Insight 2:**  
Certain regions show strong growth potential but low current penetration.

**Insight 3:**  
Regional sales vary significantly by product category.

**Insight 4:**  
Localized marketing could improve underperforming regions.

---

## Recommendations

Based on the insights above, the business should consider:

- Focusing marketing and inventory investment on **top-selling and high-margin products**  
- Launching loyalty programs for **high-value customers**  
- Optimizing discount strategies to balance **volume growth and profitability**  
- Increasing marketing spend in **high-growth regions**  
- Reducing or repositioning consistently **low-performing products**  

---

## Assumptions and Caveats

- Missing regional records were excluded from regional performance analysis  
- Incomplete review records were filtered out of rating calculations  
- Profit calculations assume static product costs  
- Discounts were treated as binary (applied vs not applied)  
- Data quality checks were performed to remove duplicate and invalid records  

---

## Tools & Technologies Used

- SQL (Joins, CTEs, Aggregations, Window Functions)  
- Power BI (DAX, What-If Parameters, Interactive Dashboards)  
- Relational Database Design  
- Business-Focused Data Analysis  

---

## Project Type

**SQL + Power BI Portfolio Project | E-Commerce Analytics**

---

## Author

**Khurram Naveed**  
Data Analyst | SQL • Power BI • Data Visualization  
Instagram: https://www.instagram.com/khurram_insights/
