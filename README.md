# 📊 Sales Performance Dashboard

An interactive sales analytics dashboard built using **Google BigQuery and Looker Studio** to analyze revenue, order volume, platform performance, and top revenue-generating orders.

## 🚀 Live Dashboard

[View Sales Performance Dashboard](https://datastudio.google.com/s/krZs0-NGiGk)

## 🛠️ Tools & Technologies

* Google Cloud BigQuery
* SQL
* Looker Studio (Google Data Studio)
* GitHub

## 📁 Dataset Details

* **Project:** QuantacusInterviewProject
* **Dataset:** interview_sql
* **Table:** orders
* **Analysis Period:** February 10–16, 2026

## 📌 Dashboard Features

### Page 1: Sales Overview

* Total Revenue
* Total Orders
* Average Order Value
* Revenue by Platform
* Orders by Platform
* Revenue Trend by Date
* Date Range and Platform Filters

### Page 2: Detailed Analysis

* Detailed Order Analysis Table
* Top 5 Revenue Orders
* Revenue Share by Platform
* Conditional Formatting for High-Value Orders

## 🔍 SQL Analysis

### 1. Total Revenue

```sql
SELECT
  SUM(revenue_usd) AS total_revenue
FROM `QuantacusInterviewProject.interview_sql.orders`;
```

### 2. Total Orders

```sql
SELECT
  COUNT(*) AS total_orders
FROM `QuantacusInterviewProject.interview_sql.orders`;
```

### 3. Average Order Value

```sql
SELECT
  AVG(revenue_usd) AS average_order_value
FROM `QuantacusInterviewProject.interview_sql.orders`;
```

### 4. Revenue by Platform

```sql
SELECT
  platform,
  SUM(revenue_usd) AS total_revenue
FROM `QuantacusInterviewProject.interview_sql.orders`
GROUP BY platform
ORDER BY total_revenue DESC;
```

### 5. Orders by Platform

```sql
SELECT
  platform,
  COUNT(*) AS total_orders
FROM `QuantacusInterviewProject.interview_sql.orders`
GROUP BY platform
ORDER BY total_orders DESC;
```

### 6. Revenue Trend by Date

```sql
SELECT
  date,
  SUM(revenue_usd) AS daily_revenue
FROM `QuantacusInterviewProject.interview_sql.orders`
GROUP BY date
ORDER BY date ASC;
```

### 7. Top 5 Revenue Orders

```sql
SELECT
  order_id,
  platform,
  date,
  revenue_usd
FROM `QuantacusInterviewProject.interview_sql.orders`
ORDER BY revenue_usd DESC
LIMIT 5;
```

### 8. Revenue Share by Platform

```sql
SELECT
  platform,
  SUM(revenue_usd) AS platform_revenue,
  SAFE_DIVIDE(
    SUM(revenue_usd),
    SUM(SUM(revenue_usd)) OVER ()
  ) * 100 AS revenue_share_percentage
FROM `QuantacusInterviewProject.interview_sql.orders`
GROUP BY platform
ORDER BY platform_revenue DESC;
```

## 📈 Key Dashboard Metrics

| Metric              |  Value |
| ------------------- | -----: |
| Total Revenue       |  6,745 |
| Total Orders        |     20 |
| Average Order Value | 337.25 |

## 💡 Key Insights

* Google generated the highest revenue among the listed platforms.
* Google had the highest order volume.
* The dashboard provides a date-wise revenue trend.
* The Top 5 chart highlights the highest-value orders.
* Revenue share is visualized using a donut chart.

## 🎯 Project Objective

The objective of this project is to transform raw order-level data into an interactive dashboard that supports sales monitoring and platform performance analysis.

## 👨‍💻 Author

Nithishkumar K
