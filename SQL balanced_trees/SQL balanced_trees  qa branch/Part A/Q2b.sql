SELECT 
  t2.product_name,
  SUM(t1.price * t1.qty) AS total_gross_revenue
FROM 
  balanced_tree.sales AS t1
JOIN
  balanced_tree.product_details AS t2 
ON 
  t2.product_id = t1.prod_id
GROUP BY
  t2.product_name
ORDER BY 
  total_gross_revenue DESC;