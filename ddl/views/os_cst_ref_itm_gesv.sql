CREATE OR REPLACE VIEW os_cst_ref_itm_gesv
(
  referral_id,
  created_time,
  list_id,
  list_status,
  item_id,
  item_status,
  gesv_type,
  gesv
)
AS 
 SELECT r.customer_referral_id AS referral_id, r.created_time, l.magic_list_id AS list_id, l.status AS list_status, i.magic_list_item_id AS item_id, i.status AS item_status, 
        CASE
            WHEN i.low_estimate IS NOT NULL AND i.high_estimate IS NOT NULL THEN 'ESTIMATED'::text
            ELSE 'IMPUTED'::text
        END AS gesv_type, 
        CASE
            WHEN i.low_estimate IS NOT NULL AND i.high_estimate IS NOT NULL THEN ((i.low_estimate + i.high_estimate) / 2.0)::numeric(11,2)
            ELSE 120.00::numeric(11,2)
        END AS gesv
   FROM os_cst_ref r
   JOIN ms_mag_lst l ON l.magic_list_id::text = r.magic_list_id::text
   JOIN ms_mag_lst_itm i ON i.magic_list_id::text = l.magic_list_id::text;


GRANT SELECT ON os_cst_ref_itm_gesv TO report;


COMMIT;
