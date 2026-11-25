# 🛍️ Retail Sales Analysis using SQL

## 📌 Project Overview

**Project Title:** Retail Sales Analysis  
**Level:** Beginner  
**Database:** PostgreSQL  
**Tool:** pgAdmin 4  
**Language:** SQL  

This project focuses on analyzing retail sales data using SQL to explore customer purchasing behavior, sales performance, product categories, and transaction trends.

The main objective of this project is to perform data cleaning, exploratory data analysis (EDA), and solve business-related questions using SQL queries. It demonstrates practical SQL skills commonly used by Data Analysts to extract meaningful insights from retail transaction data.

## 🎯 Objectives

1. **Database Setup:** Create a retail sales database and a structured table to store transaction records.
2. **Data Cleaning:** Identify and handle missing or NULL values in the dataset.
3. **Exploratory Data Analysis (EDA):** Explore the dataset to understand sales records, customers, and product categories.
4. **Customer Analysis:** Analyze customer demographics and purchasing behavior.
5. **Sales Analysis:** Calculate revenue, identify top customers, and evaluate category-wise sales performance.
6. **Time-Based Analysis:** Explore monthly sales trends and transaction patterns across different time shifts.
7. **Business Insights:** Answer real-world business questions using SQL queries.

## 🛠️ Tools & Technologies

- PostgreSQL
- pgAdmin 4
- SQL
- Microsoft Excel (Dataset Handling)

## 📂 Dataset Description

The dataset contains retail transaction records with the following attributes:

| Column Name | Description |
|---|---|
| transactions_id | Unique transaction ID |
| sale_date | Date of transaction |
| sale_time | Time of transaction |
| customer_id | Unique customer ID |
| gender | Gender of the customer |
| age | Age of the customer |
| category | Product category |
| quantity | Number of items purchased |
| price_per_unit | Price of each unit |
| cogs | Cost of goods sold |
| total_sale | Total transaction amount |

## 📊 Project Workflow

### 1. Database Setup

The project starts by creating a database in PostgreSQL and a table named `retail_sales` to store the transaction data.

```sql
DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(20),
    age INT,
    category VARCHAR(20),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```

### 2. Data Exploration & Cleaning

Performed initial data exploration to understand the dataset and check its quality.

**Exploratory Analysis:**

- Retrieved the first 10 records from the dataset.
- Counted the total number of transactions.
- Identified the number of unique customers.
- Retrieved all distinct product categories.
- Checked individual transactions using specific dates.

**Data Cleaning:**

- Checked for missing and NULL values.
- Identified incomplete transaction records.
- Removed records containing NULL values in the selected columns.

```sql
SELECT COUNT(*) FROM retail_sales;

SELECT COUNT(DISTINCT customer_id)
FROM retail_sales;

SELECT DISTINCT category
FROM retail_sales;

SELECT *
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
```

### 3. Business Analysis & SQL Queries

The following business questions were solved using SQL:

**1. Retrieve all transactions made on November 5, 2022.**

```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

**2. Retrieve all Clothing transactions where the quantity sold is greater than 1 during November 2022.**

```sql
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
AND quantity > 1
AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';
```

**3. Calculate total sales for each product category.**

```sql
SELECT
    category,
    SUM(total_sale) AS total,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;
```

**4. Find the average age of customers who purchased products from the Beauty category.**

```sql
SELECT
    ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';
```

**5. Retrieve all transactions where the total sale amount is greater than 1000.**

```sql
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
```

**6. Calculate the total number of transactions made by each gender in each product category.**

```sql
SELECT
    category,
    gender,
    COUNT(transactions_id) AS transaction_count
FROM retail_sales
GROUP BY category, gender
ORDER BY category;
```

**7. Identify the month with the highest average sales in each year.**

```sql
SELECT *
FROM (
    SELECT
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY EXTRACT(YEAR FROM sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS rank
    FROM retail_sales
    GROUP BY 1, 2
) AS t1
WHERE rank = 1;
```

**8. Identify the top 5 customers based on total spending.**

```sql
SELECT
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```

**9. Find the number of unique customers in each product category.**

```sql
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;
```

**10. Categorize orders into Morning, Afternoon, and Evening shifts and calculate the total orders in each shift.**

```sql
WITH hourly_sale AS (
    SELECT *,
        CASE
            WHEN EXTRACT(HOUR FROM sale_time) < 12
                THEN 'MORNING'
            WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17
                THEN 'AFTERNOON'
            ELSE 'EVENING'
        END AS shift
    FROM retail_sales
)

SELECT
    shift,
    COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;
```

## 💡 Key SQL Concepts Used

This project demonstrates practical implementation of the following SQL concepts:

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

## 📈 Key Findings & Insights

The analysis explores several important aspects of retail business performance:

- **Customer Demographics:** Examined customer age and gender across different product categories.
- **Category Performance:** Analyzed total sales and transaction counts for individual product categories.
- **High-Value Transactions:** Identified transactions with a total sale amount greater than 1000.
- **Customer Spending:** Identified the top 5 customers based on their total purchase amount.
- **Monthly Sales Trends:** Analyzed monthly average sales to identify the highest-performing month in each year.
- **Shopping Patterns:** Examined order distribution across Morning, Afternoon, and Evening shifts.
- **Customer Insights:** Calculated the number of unique customers purchasing from each category.

## 🎓 Learning Outcomes

Through this project, I gained practical experience in:

- Writing SQL queries for real-world data analysis.
- Cleaning and exploring structured datasets.
- Applying aggregate functions and grouping techniques.
- Working with SQL date and time functions.
- Using subqueries and CTEs to organize complex queries.
- Applying window functions for ranking and analytical operations.
- Solving business-oriented problems using PostgreSQL.

## 🚀 How to Run This Project

1. Clone or download this repository from GitHub.
2. Open pgAdmin 4 and connect to PostgreSQL.
3. Create a new database.
4. Open the Query Tool.
5. Execute the `sql.sql` script to create the `retail_sales` table.
6. Import the retail sales dataset into the table.
7. Execute the SQL queries to explore the data and perform analysis.

**Note:** The SQL script contains a `DROP TABLE IF EXISTS` statement. Execute it carefully because it deletes an existing table with the same name.

## 📁 Project Structure

```text
Retail-Sales-Analysis/
│
├── sql.sql
└── README.md
```

## 👩‍💻 Author

**Vanshita Choudhary**

B.Tech Computer Science Engineering

**Technical Skills:** SQL | PostgreSQL | Microsoft Excel | Power BI

This project is part of my Data Analytics learning journey, showcasing my ability to work with SQL, explore datasets, and solve business-related analytical problems.

