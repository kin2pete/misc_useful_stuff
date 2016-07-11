CREATE OR REPLACE VIEW ms_mag_lst_itm_gesv
(
  list_id,
  list_status,
  created_time,
  item_id,
  item_status,
  gesv_type,
  gesv
)
AS 
 SELECT l.magic_list_id AS list_id, l.status AS list_status, l.created_time, i.magic_list_item_id AS item_id, i.status AS item_status, 
        CASE
            WHEN i.low_estimate IS NOT NULL AND i.high_estimate IS NOT NULL THEN 'ESTIMATED'::text
            ELSE 'IMPUTED'::text
        END AS gesv_type, 
        CASE
            WHEN i.low_estimate IS NOT NULL AND i.high_estimate IS NOT NULL THEN ((i.low_estimate + i.high_estimate) / 2.0)::numeric(11,2)
            ELSE 120.00::numeric(11,2)
        END AS gesv
   FROM ms_mag_lst l
   JOIN ms_mag_lst_itm i ON i.magic_list_id::text = l.magic_list_id::text;


GRANT SELECT ON ms_mag_lst_itm_gesv TO report;


COMMIT;
