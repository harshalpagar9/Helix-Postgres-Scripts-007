select t2.product_name, sum(t1.qty) from sales as t1
join product_details as t2
on t1.prod_id = t2.product_id
group by product_name

