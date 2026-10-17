-- ========================================================================
-- Supermart Grocery Sales Analytics Platform
-- Script 02: Core Analytical Queries, KPI Aggregations & Elasticity
-- ========================================================================

USE supermart_db;
GO

-- 1. Portfolio Overall Performance (Objective 1)
SELECT 
    COUNT(order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100.0, 2) AS profit_margin_pct,
    ROUND(AVG(sales), 2) AS avg_order_value,
    ROUND(AVG(discount) * 100.0, 2) AS avg_discount_pct
FROM dbo.supermart_sales;
GO

-- 2. Category Performance & Sales Contribution (Objective 1)
SELECT 
    category,
    COUNT(order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(sales) * 100.0 / SUM(SUM(sales)) OVER()), 2) AS sales_share_pct,
    ROUND((SUM(profit) / SUM(sales)) * 100.0, 2) AS profit_margin_pct
FROM dbo.supermart_sales
GROUP BY category
ORDER BY total_sales DESC;
GO

-- 3. Sub-Category Dense Ranking & Profit Efficiency (Objective 2)
WITH SubCategoryRanking AS (
    SELECT 
        category,
        sub_category,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit,
        ROUND((SUM(profit) / SUM(sales)) * 100.0, 2) AS profit_margin_pct,
        DENSE_RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank,
        DENSE_RANK() OVER (ORDER BY (SUM(profit) / SUM(sales)) ASC) AS lowest_margin_rank
    FROM dbo.supermart_sales
    GROUP BY category, sub_category
)
SELECT 
    sales_rank,
    lowest_margin_rank,
    category,
    sub_category,
    total_sales,
    total_profit,
    profit_margin_pct
FROM SubCategoryRanking
ORDER BY sales_rank ASC;
GO

-- 4. Discount Tier Margin Elasticity (Objective 3)
SELECT 
    CASE 
        WHEN discount < 0.15 THEN 'Low Discount (<15%)'
        WHEN discount BETWEEN 0.15 AND 0.25 THEN 'Medium Discount (15-25%)'
        ELSE 'High Discount (>25%)'
    END AS discount_tier,
    COUNT(order_id) AS order_count,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100.0, 2) AS margin_realization_pct
FROM dbo.supermart_sales
GROUP BY 
    CASE 
        WHEN discount < 0.15 THEN 'Low Discount (<15%)'
        WHEN discount BETWEEN 0.15 AND 0.25 THEN 'Medium Discount (15-25%)'
        ELSE 'High Discount (>25%)'
    END
ORDER BY total_sales DESC;
GO

-- 5. Regional & City Margin Diagnostics (Objective 4)
SELECT 
    city,
    region,
    COUNT(order_id) AS orders_count,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100.0, 2) AS city_margin_pct,
    DENSE_RANK() OVER (ORDER BY (SUM(profit) / SUM(sales)) ASC) AS margin_efficiency_rank
FROM dbo.supermart_sales
GROUP BY city, region
ORDER BY total_sales DESC;
GO
