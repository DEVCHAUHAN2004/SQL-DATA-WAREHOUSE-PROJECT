TRUNCATE TABLE bronze.erp_loc_a101;

BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\asus\OneDrive\Desktop\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
WITH (
    FORMAT = 'CSV',   -- 🔥 best option
    FIRSTROW = 2,
    TABLOCK
);

SELECT *
FROM bronze.erp_loc_a101;