CREATE OR REPLACE VIEW os_cst_ord_hst_chg
(
  customer_order_id,
  min_created_time,
  max_created_time,
  change_count
)
AS 
 SELECT h.customer_order_id, min(h.created_time) AS min_created_time, "max"(h.created_time) AS max_created_time, count(*) AS change_count
   FROM os_cst_ord_hst h
  GROUP BY h.customer_order_id;


GRANT SELECT ON os_cst_ord_hst_chg TO report;


COMMIT;
