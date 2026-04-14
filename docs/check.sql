--chek for unwanted spaces
--Expectation : no result

select cst_firstname
from Bronze.crm_cust_info
where cst_firstname != TRIM(cst_firstname)

select cst_lastname
from Bronze.crm_cust_info
where cst_lastname != TRIM(cst_lastname)