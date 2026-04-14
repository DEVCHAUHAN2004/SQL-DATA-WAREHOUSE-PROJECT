TRUNCATE TABLE bronze.crm_prd_info;

BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\asus\OneDrive\Desktop\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

SELECT * FROM  bronze.crm_prd_info;


--SELECT COUNT(*) FROM  bronze.crm_prd_info;
--397
