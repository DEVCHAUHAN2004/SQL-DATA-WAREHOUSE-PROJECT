INSERT INTO Silver.crm_cust_info (
     cst_id,
     cst_key,cst_firstname,
     cst_lastname,
     cst_marital_status,cst_gndr,
     cst_create_date
)



SELECT cst_id,
cst_key,
TRIM(cst_firstname) AS cst_firstname,
TRIM(cst_lastname) AS cst_lastname,


CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
     WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
     ELSE 'n/a'
END cst_martial_status,


CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
     WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
     ELSE 'n/a'
END cst_gndr,
cst_create_date
FROM 
(
SELECT *,
     ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
FROM Bronze.crm_cust_info
WHERE cst_id is not null
) t
where flag_last = 1

select * from Silver.crm_cust_info
