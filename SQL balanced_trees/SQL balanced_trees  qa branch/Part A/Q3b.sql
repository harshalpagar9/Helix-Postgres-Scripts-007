
SELECT t2.product_name,
  SUM(t1.price * t1.qty) AS total_item_revenue,
  ROUND(SUM(t1.price * t1.qty * (t1.discount  / 100)), 2) AS total_item_discounts
FROM   balanced_tree.sales AS t1
JOIN  balanced_tree.product_details AS t2 
ON   t2.product_id = t1.prod_id
GROUP BY
  t2.product_name
ORDER BY 
  total_item_revenue DESC;
