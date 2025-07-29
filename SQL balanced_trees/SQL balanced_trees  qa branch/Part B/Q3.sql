WITH get_revenue AS (
SELECT txn_id,
ROUND(SUM(price * qty), 2) AS revenue
FROM balanced_tree.sales
GROUP BY txn_id
),
ordered_revenue AS (
SELECT revenue, ROW_NUMBER() OVER (ORDER BY revenue) AS rn,
COUNT(*) OVER () AS total_rows
FROM get_revenue
)
SELECT
  (SELECT revenue FROM ordered_revenue WHERE rn = FLOOR(0.25 * total_rows)) AS percentile_25,
  (SELECT revenue FROM ordered_revenue WHERE rn = FLOOR(0.50 * total_rows)) AS percentile_50,
  (SELECT revenue FROM ordered_revenue WHERE rn = FLOOR(0.75 * total_rows)) AS percentile_75;
