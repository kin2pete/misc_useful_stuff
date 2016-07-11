CREATE OR REPLACE VIEW os_cst_ord_trn
(
  customer_order_id,
  changed_time,
  prev_status,
  this_status
)
AS 
 SELECT ht.customer_order_id, ht.state_change_time AS changed_time, COALESCE(hp.order_status, 'START'::character varying) AS prev_status, ht.order_status AS this_status
   FROM ( SELECT coh1.customer_order_id, ( SELECT "max"(coh3.state_change_time) AS "max"
                   FROM os_cst_ord_hst coh3
                  WHERE coh3.customer_order_id::text = coh1.customer_order_id::text AND coh3.state_change_time < coh1.state_change_time) AS prev_changed_time, coh1.state_change_time AS this_changed_time
           FROM os_cst_ord_hst coh1) idx
   JOIN os_cst_ord_hst ht ON ht.customer_order_id::text = idx.customer_order_id::text AND ht.state_change_time = idx.this_changed_time
   LEFT JOIN os_cst_ord_hst hp ON hp.customer_order_id::text = idx.customer_order_id::text AND hp.state_change_time = idx.prev_changed_time;

COMMIT;
