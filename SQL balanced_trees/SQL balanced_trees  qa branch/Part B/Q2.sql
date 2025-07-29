 with abc as (select count(distinct prod_id) as xyz from sales
group by txn_id)

select round(avg(xyz),0) from abc