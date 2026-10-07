-- ============================================================
-- E-Commerce Sales & Customer Analytics
-- SQL Business Analysis
-- ============================================================


-- ============================================================
-- 1. TOTAL REVENUE
-- ============================================================

SELECT
    SUM("Revenue") AS total_revenue
FROM sales_clean
WHERE "IsProductSale" = TRUE;


-- ============================================================
-- 2. TOTAL QUANTITY SOLD
-- ============================================================

SELECT
    SUM("Quantity") AS total_quantity
FROM sales_clean
WHERE "IsProductSale" = TRUE;


-- ============================================================
-- 3. TOTAL ORDERS / INVOICES
-- ============================================================

SELECT
    COUNT(DISTINCT "InvoiceNo") AS total_orders
FROM sales_clean
WHERE "IsProductSale" = TRUE;


-- ============================================================
-- 4. AVERAGE ORDER VALUE
-- ============================================================

SELECT
    ROUND(
        SUM("Revenue") / COUNT(DISTINCT "InvoiceNo"),
        2
    ) AS average_order_value
FROM sales_clean
WHERE "IsProductSale" = TRUE;


-- ============================================================
-- 5. MONTHLY REVENUE TREND
-- ============================================================

SELECT
    DATE_TRUNC('month', "InvoiceDate") AS month,
    ROUND(SUM("Revenue"), 2) AS monthly_revenue
FROM sales_clean
WHERE "IsProductSale" = TRUE
GROUP BY DATE_TRUNC('month', "InvoiceDate")
ORDER BY month;


-- ============================================================
-- 6. TOP 10 PRODUCTS BY REVENUE
-- ============================================================

SELECT
    "Description",
    ROUND(SUM("Revenue"), 2) AS total_revenue
FROM sales_clean
WHERE "IsProductSale" = TRUE
  AND "Description" IS NOT NULL
  AND "Description" NOT ILIKE '%DOTCOM POSTAGE%'
GROUP BY "Description"
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- 7. TOP 10 PRODUCTS BY QUANTITY SOLD
-- ============================================================

SELECT
    "Description",
    SUM("Quantity") AS total_quantity
FROM sales_clean
WHERE "IsProductSale" = TRUE
  AND "Description" IS NOT NULL
GROUP BY "Description"
ORDER BY total_quantity DESC
LIMIT 10;


-- ============================================================
-- 8. COUNTRY-WISE REVENUE
-- ============================================================

SELECT
    "Country",
    ROUND(SUM("Revenue"), 2) AS total_revenue
FROM sales_clean
WHERE "IsProductSale" = TRUE
GROUP BY "Country"
ORDER BY total_revenue DESC;


-- ============================================================
-- 9. TOP 10 COUNTRIES BY REVENUE
-- ============================================================

SELECT
    "Country",
    ROUND(SUM("Revenue"), 2) AS total_revenue
FROM sales_clean
WHERE "IsProductSale" = TRUE
GROUP BY "Country"
ORDER BY total_revenue DESC
LIMIT 10;


-- ============================================================
-- 10. CUSTOMER REVENUE
-- ============================================================

SELECT
    "CustomerID",
    ROUND(SUM("Revenue"), 2) AS customer_revenue
FROM sales_clean
WHERE "IsProductSale" = TRUE
  AND "CustomerID" IS NOT NULL
GROUP BY "CustomerID"
ORDER BY customer_revenue DESC;


-- ============================================================
-- 11. TOP 10 CUSTOMERS BY REVENUE
-- ============================================================

SELECT
    "CustomerID",
    ROUND(SUM("Revenue"), 2) AS customer_revenue
FROM sales_clean
WHERE "IsProductSale" = TRUE
  AND "CustomerID" IS NOT NULL
GROUP BY "CustomerID"
ORDER BY customer_revenue DESC
LIMIT 10;


-- ============================================================
-- 12. REPEAT CUSTOMERS
-- Customers with more than one unique order
-- ============================================================

SELECT
    COUNT(*) AS repeat_customers
FROM (
    SELECT
        "CustomerID",
        COUNT(DISTINCT "InvoiceNo") AS order_count
    FROM sales_clean
    WHERE "IsProductSale" = TRUE
      AND "CustomerID" IS NOT NULL
    GROUP BY "CustomerID"
    HAVING COUNT(DISTINCT "InvoiceNo") > 1
) AS customer_orders;


-- ============================================================
-- 13. RETURN REVENUE
-- ============================================================

SELECT
    ROUND(
        ABS(SUM("Revenue")),
        2
    ) AS return_revenue
FROM sales_clean
WHERE "TransactionType" = 'Return';


-- ============================================================
-- 14. RETURN QUANTITY
-- ============================================================

SELECT
    ABS(SUM("Quantity")) AS return_quantity
FROM sales_clean
WHERE "TransactionType" = 'Return';


-- ============================================================
-- 15. MONTHLY RETURN REVENUE
-- ============================================================

SELECT
    DATE_TRUNC('month', "InvoiceDate") AS month,
    ROUND(
        ABS(SUM("Revenue")),
        2
    ) AS return_revenue
FROM sales_clean
WHERE "TransactionType" = 'Return'
GROUP BY DATE_TRUNC('month', "InvoiceDate")
ORDER BY month;


-- ============================================================
-- 16. TOP 10 PRODUCTS BY RETURN QUANTITY
-- ============================================================

SELECT
    "Description",
    ABS(SUM("Quantity")) AS return_quantity
FROM sales_clean
WHERE "TransactionType" = 'Return'
  AND "Description" IS NOT NULL
GROUP BY "Description"
ORDER BY return_quantity DESC
LIMIT 10;


-- ============================================================
-- 17. TOP 10 PRODUCTS BY RETURN REVENUE
-- ============================================================

SELECT
    "Description",
    ROUND(
        ABS(SUM("Revenue")),
        2
    ) AS return_revenue
FROM sales_clean
WHERE "TransactionType" = 'Return'
  AND "Description" IS NOT NULL
GROUP BY "Description"
ORDER BY return_revenue DESC
LIMIT 10;


-- ============================================================
-- 18. UK VS INTERNATIONAL REVENUE
-- ============================================================

SELECT
    CASE
        WHEN "Country" = 'United Kingdom'
            THEN 'United Kingdom'
        ELSE 'International'
    END AS market,
    ROUND(SUM("Revenue"), 2) AS revenue
FROM sales_clean
WHERE "IsProductSale" = TRUE
GROUP BY
    CASE
        WHEN "Country" = 'United Kingdom'
            THEN 'United Kingdom'
        ELSE 'International'
    END
ORDER BY revenue DESC;


-- ============================================================
-- 19. CUSTOMER ORDER FREQUENCY
-- ============================================================

SELECT
    "CustomerID",
    COUNT(DISTINCT "InvoiceNo") AS order_frequency,
    ROUND(SUM("Revenue"), 2) AS total_revenue
FROM sales_clean
WHERE "IsProductSale" = TRUE
  AND "CustomerID" IS NOT NULL
GROUP BY "CustomerID"
ORDER BY order_frequency DESC;


-- ============================================================
-- 20. PRODUCT PERFORMANCE SUMMARY
-- ============================================================

SELECT
    "StockCode",
    "Description",
    SUM("Quantity") AS total_quantity,
    ROUND(SUM("Revenue"), 2) AS total_revenue,
    COUNT(DISTINCT "InvoiceNo") AS orders
FROM sales_clean
WHERE "IsProductSale" = TRUE
  AND "Description" IS NOT NULL
GROUP BY
    "StockCode",
    "Description"
ORDER BY total_revenue DESC;