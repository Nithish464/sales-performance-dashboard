
-- Sales Performance Dashboard
-- BigQuery Analysis Queries

-- 1. Total Revenue
SELECT SUM(revenue_usd) AS total_revenue
FROM `QuantacusInterviewProject.interview_sql.orders`;


-- 2. Total Orders
SELECT COUNT(*) AS total_orders
FROM `QuantacusInterviewProject.interview_sql.orders`;


-- 3. Average Order Value
SELECT AVG(revenue_usd) AS average_order_value
FROM `QuantacusInterviewProject.interview_sql.orders`;


-- 4. Revenue by Platform
SELECT
  platform,
  SUM(revenue_usd) AS total_revenue
FROM `QuantacusInterviewProject.interview_sql.orders`
GROUP BY platform
ORDER BY total_revenue DESC;


-- 5. Orders by Platform
SELECT
  platform,
  COUNT(*) AS total_orders
FROM `QuantacusInterviewProject.interview_sql.orders`
GROUP BY platform
ORDER BY total_orders DESC;


-- 6. Revenue Trend by Date
SELECT
  date,
  SUM(revenue_usd) AS daily_revenue
FROM `QuantacusInterviewProject.interview_sql.orders`
GROUP BY date
ORDER BY date ASC;


-- 7. Top 5 Revenue Orders
SELECT
  order_id,
  platform,
  date,
  revenue_usd
FROM `QuantacusInterviewProject.interview_sql.orders`
ORDER BY revenue_usd DESC
LIMIT 5;


-- 8. Revenue Share by Platform
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
