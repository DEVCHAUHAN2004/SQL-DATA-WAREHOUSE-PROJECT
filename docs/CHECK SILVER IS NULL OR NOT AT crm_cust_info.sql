--check for nulls or duplicates in primary key
--expectation : No result

SELECT cst_id,count(*)
FROM Bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

