CREATE OR REPLACE VIEW ord_itm_gesv
(
  order_id,
  status,
  booked,
  item_id,
  gesv_type,
  gesv
)
AS 
 SELECT o.customer_order_id AS order_id, o.order_status AS status, o.booked_time AS booked, oi.customer_order_line_item_id AS item_id, 
        CASE
            WHEN mi.low_estimate IS NOT NULL AND mi.high_estimate IS NOT NULL THEN 'ESTIMATED'::text
            ELSE 'IMPUTED'::text
        END::character varying AS gesv_type, 
        CASE
            WHEN mi.low_estimate IS NOT NULL AND mi.high_estimate IS NOT NULL THEN ((mi.low_estimate + mi.high_estimate) / 2.0)::numeric(11,2)
            ELSE 120.00::numeric(11,2)
        END AS gesv
   FROM os_cst_ord o
   LEFT JOIN os_cst_ord_itm oi ON oi.customer_order_id::text = o.customer_order_id::text
   LEFT JOIN ms_mag_lst_itm mi ON mi.magic_list_item_id::text = oi.magic_list_item_id::text
UNION 
 SELECT j.id AS order_id, j.status, j.created_on AS booked, j.id AS item_id, 'IMPUTED' AS gesv_type, 120.00::numeric(11,2) AS gesv
   FROM jobs_manual j;


GRANT SELECT ON ord_itm_gesv TO report;


COMMIT;
