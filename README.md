# 🛍️ Retail Sales Analysis using SQL

## 📌 Project Overview

This project focuses on analyzing retail sales data using **PostgreSQL** to explore customer purchasing behavior, sales performance, product categories, and transaction trends.

The main objective is to extract meaningful business insights from retail transaction data using SQL queries and data analysis techniques.

## 🎯 Project Objectives

- Analyze overall retail sales performance.
- Identify customer purchasing patterns.
- Explore sales across different product categories.
- Analyze customer demographics such as age and gender.
- Identify top-spending customers.
- Understand sales trends based on dates and time periods.
- Extract useful business insights using SQL.

## 🛠️ Tools & Technologies

- **Database:** PostgreSQL
- **SQL Tool:** pgAdmin 4
- **Language:** SQL

## 📂 Dataset Description

The dataset contains retail transaction records with the following columns:

| Column Name | Description |
|---|---|
| transactions_id | Unique transaction ID |
| sale_date | Date of transaction |
| sale_time | Time of transaction |
| customer_id | Unique customer ID |
| gender | Customer gender |
| age | Customer age |
| category | Product category |
| quantity | Quantity purchased |
| price_per_unit | Price per unit |
| cogs | Cost of goods sold |
| total_sale | Total transaction amount |

## 🔍 Project Workflow

### 1. Database & Table Creation
- Created a retail_sales table.
- Defined appropriate data types and primary key constraints.

### 2. Data Exploration
- Retrieved sample records.
- Checked total transaction count.
- Identified unique customers and product categories.
- Examined individual transaction records.

### 3. Data Cleaning
- Checked for NULL values across important columns.
- Removed records containing missing values.

### 4. Data Analysis

Performed SQL analysis to answer business-related questions:

- Retrieved clothing transactions with specific quantity and date conditions.
- Calculated total sales for each product category.
- Found the average age of customers purchasing Beauty products.
- Identified transactions with sales greater than 1000.
- Analyzed transaction counts based on category and gender.
- Identified the month with the highest average sales in each year.
- Found the top 5 customers based on total spending.
- Calculated the number of unique customers in each category.
- Analyzed orders across Morning, Afternoon, and Evening shifts.

## 💡 SQL Concepts Used

This project demonstrates practical implementation of:

- SELECT, WHERE and DISTINCT
- ORDER BY and LIMIT
- Aggregate Functions (SUM, AVG, COUNT, ROUND)
- GROUP BY and HAVING
- Date and Time Functions (EXTRACT, TO_CHAR)
- CASE Statements
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions (RANK, PARTITION BY)
- NULL Value Handling

## 📁 Project Structure

```text
Retail-Sales-Analysis/
│
├── sql.sql
└── README.md
```

## 🚀 How to Run This Project

1. Install PostgreSQL and pgAdmin 4.
2. Create a new database in pgAdmin.
3. Open the Query Tool.
4. Execute the SQL script to create the retail_sales table.
5. Import the retail sales dataset into the table.
6. Execute the analysis queries to explore the data and generate insights.

**Note:** The SQL script contains a `DROP TABLE IF EXISTS` statement. Execute it carefully because it removes an existing table with the same name.

## 📈 Learning Outcomes

Through this project, I gained practical experience in:

- Writing SQL queries for real-world data analysis.
- Cleaning and exploring structured datasets.
- Using aggregate functions to summarize data.
- Applying CTEs and window functions.
- Analyzing customer behavior and sales trends.
- Solving business-oriented analytical problems.

---

## 👩‍💻 Author

**Vanshita Choudhary**

B.Tech | Computer Science Engineering

**Skills:** SQL | PostgreSQL | Data Analysis | Microsoft Excel | Power BI

