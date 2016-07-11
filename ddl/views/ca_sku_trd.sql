CREATE OR REPLACE VIEW ca_sku_trd
(
  sku_id,
  trade_id
)
AS 
 SELECT s0.sku_id, e.trade_id
   FROM ca_sku s0
   JOIN ( SELECT s1.sku_id, min(e.estimate_trade_id) AS estimate_trade_id
           FROM ca_sku s1
      JOIN ( SELECT s2.sku_id, "max"(e.percentage) AS percentage
                   FROM ca_sku s2
              JOIN ca_est_trd e ON e.estimate_id::text = s2.initial_estimate_id::text AND e.deleted = false AND e.display_order = 0
             GROUP BY s2.sku_id) pct ON pct.sku_id::text = s1.sku_id::text
   JOIN ca_est_trd e ON e.estimate_id::text = s1.initial_estimate_id::text AND e.deleted = false AND e.display_order = 0 AND e.percentage = pct.percentage
  GROUP BY s1.sku_id) est ON est.sku_id::text = s0.sku_id::text
   JOIN ca_est_trd e ON e.estimate_trade_id = est.estimate_trade_id;


GRANT SELECT ON ca_sku_trd TO report;


COMMIT;
