SELECT NULLIF(sls_due_dt,0) AS sls_due_dt
FROM Silver.crm_sales_details
where sls_due_dt <= 0 or LEN(sls_due_dt) != 8 or 
     sls_due_dt > 20500101 or sls_due_dt < 19000101



select * from Silver.crm_sales_details
where sls_order_dt > sls_ship_dt or sls_order_dt > sls_due_dt 


-- Check Data Consistency: Between Sales, Quantity, and Price
-- Rule 1: Sales = Quantity * Price
-- Rule 2: Values must not be NULL, zero, or negative

SELECT DISTINCT
    sls_sales as old_sls_sales,
    sls_quantity,
    sls_price as old_sls_price,

    CASE WHEN sls_sales IS NULL OR sls_sales <= 0 or sls_sales != sls_quantity * ABS(sls_price)
         THEN sls_quantity * ABS(sls_price)
         ELSE sls_sales
    END AS sls_sales,

    CASE WHEN sls_price IS NULL OR sls_price <= 0
         THEN sls_sales / NULLIF(sls_quantity,0)
         ELSE sls_price
     END AS sls_price

FROM Silver.crm_sales_details
WHERE 
    -- Rule 1: Sales should be equal to Quantity * Price
    sls_sales != sls_quantity * sls_price

    -- Rule 2: No NULL values allowed
    OR sls_sales IS NULL 
    OR sls_quantity IS NULL 
    OR sls_price IS NULL

    -- Rule 3: No zero or negative values allowed
    OR sls_sales <= 0 
    OR sls_quantity <= 0 
    OR sls_price <= 0
ORDER BY sls_sales,sls_quantity, sls_price



IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE silver.crm_sales_details;

CREATE TABLE silver.crm_sales_details (
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
   sls_order_dt DATE,
   sls_ship_dt DATE,
   sls_due_dt DATE,
    sls_sales DECIMAL(10,2),
    sls_quantity DECIMAL(10,2),
    sls_price DECIMAL(10,2),
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);

SELECT * FROM silver.crm_sales_details