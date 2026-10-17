-- ==============================================================================
-- Project: Supermart Grocery Sales Analytics & BI Platform
-- Script: 01_schema_setup.sql
-- Description: Database creation, table schema, and data validation constraints
-- ==============================================================================

-- 1. Create Dedicated Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'supermart_db')
BEGIN
    CREATE DATABASE supermart_db;
END;
GO

USE supermart_db;
GO

-- 2. Drop Table if Exists
IF OBJECT_ID('dbo.supermart_sales', 'U') IS NOT NULL
    DROP TABLE dbo.supermart_sales;
GO

-- 3. Create Table with Strict Constraints
CREATE TABLE dbo.supermart_sales (
    order_id         VARCHAR(20)     NOT NULL,
    customer_name    VARCHAR(100)    NOT NULL,
    category         VARCHAR(50)     NOT NULL,
    sub_category     VARCHAR(50)     NOT NULL,
    city             VARCHAR(50)     NOT NULL,
    order_date       DATE            NOT NULL,
    region           VARCHAR(20)     NOT NULL,
    sales            DECIMAL(12, 2)  NOT NULL,
    discount         DECIMAL(5, 2)   NOT NULL,
    profit           DECIMAL(12, 2)  NOT NULL,
    state            VARCHAR(50)     NOT NULL,
    CONSTRAINT PK_supermart_sales PRIMARY KEY (order_id)
);
GO

-- 4. Indexing for Query Performance
CREATE NONCLUSTERED INDEX IX_supermart_sales_date 
    ON dbo.supermart_sales (order_date);

CREATE NONCLUSTERED INDEX IX_supermart_sales_category 
    ON dbo.supermart_sales (category, sub_category);

CREATE NONCLUSTERED INDEX IX_supermart_sales_region_city 
    ON dbo.supermart_sales (region, city);
GO