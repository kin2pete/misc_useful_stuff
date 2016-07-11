CREATE OR REPLACE VIEW all_booking_times
(
  order_id,
  booked_time
)
AS 
 SELECT os_cst_ord.customer_order_id AS order_id, os_cst_ord.booked_time
   FROM os_cst_ord
UNION 
 SELECT jobs_manual.id AS order_id, jobs_manual.created_on AS booked_time
   FROM jobs_manual;


GRANT SELECT ON all_booking_times TO report;


COMMIT;
