INSERT INTO silver.crm_sales_details (
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,
    sls_order_dt,
    sls_ship_dt,
    sls_due_dt,
    sls_sales,
    sls_quantity,
    sls_price
)
SELECT
    sls_ord_num,
    sls_prd_key,
    sls_cust_id,

    CASE
        WHEN sls_order_dt = 0
             OR LEN(sls_order_dt) != 8
             OR sls_order_dt > sls_ship_dt
             OR sls_order_dt > sls_due_dt
        THEN NULL
        ELSE TRY_CAST(CONVERT(VARCHAR(8), sls_order_dt) AS DATE)
    END AS sls_order_dt,

    CASE
        WHEN sls_ship_dt = 0
             OR LEN(sls_ship_dt) != 8
        THEN NULL
        ELSE TRY_CAST(CONVERT(VARCHAR(8), sls_ship_dt) AS DATE)
    END AS sls_ship_dt,

    CASE
        WHEN sls_due_dt = 0
             OR LEN(sls_due_dt) != 8
        THEN NULL
        ELSE TRY_CAST(CONVERT(VARCHAR(8), sls_due_dt) AS DATE)
    END AS sls_due_dt,

    CASE
        WHEN sls_sales IS NULL
             OR sls_sales <= 0
             OR sls_sales != sls_quantity * ABS(sls_price)
        THEN CAST(sls_quantity * ABS(sls_price) AS DECIMAL(10,2))
        ELSE CAST(sls_sales AS DECIMAL(10,2))
    END AS sls_sales,

    sls_quantity,

    CAST(
        CASE
            WHEN sls_price IS NULL
                 OR sls_price <= 0
            THEN sls_sales / NULLIF(sls_quantity, 0)
            ELSE sls_price
        END
    AS DECIMAL(10,2)) AS sls_price

FROM bronze.crm_sales_details;