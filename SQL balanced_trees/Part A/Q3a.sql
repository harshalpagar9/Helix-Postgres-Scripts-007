SELECT 
  ROUND(SUM(price * qty * (discount / 100)), 2) AS total_discounts
FROM 
  balanced_tree.sales;
