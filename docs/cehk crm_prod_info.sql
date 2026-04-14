--check for nulls or duplicates in primary key
select prd_id , count(*)
from Silver.crm_prd_info
group by prd_id
having count(*) > 1 or prd_id is NULL
-- there is not null value


--check unwanted spaces
SELECT prd_nm
from Silver.crm_prd_info
where prd_nm != TRIM(prd_nm)


--check nulls or negative numbers
SELECT prd_cost
from Silver.crm_prd_info
where prd_cost < 0 or prd_cost is null


select distinct prd_line
from Silver.crm_prd_info


--check for innvalid date and orders
select *
from Silver.crm_prd_info
where prd_end_dt < prd_start_dt

select * from Silver.crm_prd_info


