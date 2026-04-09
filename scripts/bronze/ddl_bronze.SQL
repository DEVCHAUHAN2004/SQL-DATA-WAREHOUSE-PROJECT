/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================

📌 Description:
This script is used to create tables in the 'bronze' schema of the data warehouse.
The bronze layer represents the raw data ingestion layer.

⚙️ Functionality:
- Drops existing tables in the 'bronze' schema (if they exist)
- Recreates tables with the defined structure
- Ensures a clean and consistent starting point for data loading

🎯 Purpose:
This script helps in resetting the bronze layer and preparing it
for fresh raw data ingestion from source systems.

🗂️ Layer Information:
- Bronze Layer → Raw Data (Unprocessed)
- Used as the first stage in ETL/ELT pipeline

👨‍💻 Author: Dev Chauhan
📅 Last Updated: 2026

===============================================================================
*/








IF OBJECT_ID ('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
    cst_id INT PRIMARY KEY,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status NVARCHAR(20),
    cst_gndr NVARCHAR(10),
    cst_create_date DATE
);

IF OBJECT_ID ('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
    prd_id INT PRIMARY KEY,
    prd_key NVARCHAR(50) NOT NULL,
    prd_nm NVARCHAR(100) NOT NULL,
    prd_cost DECIMAL(10,2),
    prd_line NVARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE
);


IF OBJECT_ID ('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num NVARCHAR(50) PRIMARY KEY,
    sls_prd_key NVARCHAR(50) NOT NULL,
    sls_cust_id INT NOT NULL,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales DECIMAL(10,2),
    sls_quantity INT,
    sls_price DECIMAL(10,2)
);



IF OBJECT_ID ('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (
    cid INT PRIMARY KEY,
    bdate DATE,
    gen NVARCHAR(10)
)

IF OBJECT_ID ('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
    cid INT,
    cntry NVARCHAR(50)
)

IF OBJECT_ID ('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2 (
    id INT PRIMARY KEY,
    cat NVARCHAR(50),
    subcat NVARCHAR(50),
    maintenance NVARCHAR(50)
)

